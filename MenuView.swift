//
//  MenuView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var presenter: Presenter
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.grayBackground
                    .ignoresSafeArea()
                
                ScrollViewReader { proxy in
                    
                    ScrollView {
                        
                        LazyVStack(alignment: .leading, pinnedViews: .sectionHeaders) {
                            Section {
                                ScrollView(.horizontal) {
                                    
                                    LazyHStack (spacing: 16) {          //Можно выделить в отдельный вью
                                        Image("baner1")                 //добавить цикл (forech + модифаеры 1 раз)
                                            .resizable()
                                            .clipShape(.rect(cornerRadius: 10))
                                            .scaledToFill()
                                        
                                        Image("baner2")
                                            .resizable()
                                            .clipShape(.rect(cornerRadius: 10))
                                            .scaledToFill()
                                    }
                                }
                                .frame(height: 112)
                                .padding(.leading)
                                .scrollIndicators(.hidden)
                            }
                            
                            Section {
                                LazyVStack(alignment: .leading, spacing: 0) {
                                    
                                    ForEach(presenter.menuSections) { section in
                                        VStack(alignment: .leading, spacing: 8) {
                                            ForEach(section.items) { meal in
                                                MealCardView(meal: meal)
                                                    .padding(.top)
                                                Divider()
                                            }
                                        }
                                    }
                                    .scrollContentBackground(.hidden)
                                    .background(Color.white)
                                    .clipShape(.rect(cornerRadius: 20))
                                }
                                
                            } header: {
                                StickyCategoryBar(presenter: presenter)
                            }
                        }
                    }
                    
                    .onChange(of: presenter.selectedCategory) { categoryId in
                        guard presenter.hasUserInteractedWithCategory else { return }
                        withAnimation {
                            proxy.scrollTo(categoryId, anchor: .top)
                        }
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Picker("Город", selection: $presenter.selectedCity) { 
                                ForEach(presenter.cities, id: \.self) { city in
                                    Text(city)
                                }
                            }
                            
                        }
                    }
                    
//                    .safeAreaInset(edge: .top, alignment: .leading) {
//                        ZStack {
//                            Color(red: 243/255,green: 245/255,blue: 249/255)
//                            
//                            HStack {
//                                Picker("Город", selection: $presenter.selectedCity) {
//                                    ForEach(presenter.cities, id: \.self) { city in
//                                        Text(city)
//                                    }
//                                }
//                                Spacer()
//                            }
//                        }
//                        .ignoresSafeArea()
//                        .frame(height: 60)
//                    }
                }
            }
        }
    }
}

#Preview {
    let Presenter = Presenter()
    MenuView(presenter: Presenter)
}
