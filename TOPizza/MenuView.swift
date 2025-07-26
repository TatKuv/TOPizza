//
//  MenuView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var presenter: Presenter
    
    @State private var barOffset: CGFloat = 0
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.gray
                    .opacity(0.1)  //поменять цвет
                    .ignoresSafeArea()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        
                        LazyVStack(alignment: .leading) {
                            
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
                            } //банеры
                            .frame(height: 112)
                            .padding(.leading)
                            .scrollIndicators(.hidden)
                            
                            
                            StickyCategoryBar(presenter: presenter)
                                .padding(.vertical)
                                .zIndex(1)
                            
                            
                            LazyVStack(alignment: .leading, spacing: 0) {
                                    
//                                if let section = presenter.menuSections.first(where: { $0.category == presenter.selectedCategory }) {
//                                    VStack(alignment: .leading, spacing: 8) {
//                                        ForEach(section.items) { meal in
//                                            MealCardView(meal: meal)
//                                                .padding(.top)
//                                            Divider()
//                                        }
//                                    }
//                                    .scrollContentBackground(.hidden)
//                                    .background(Color.white)
//                                    .clipShape(.rect(cornerRadius: 20))
//                                }
                                    
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
                }
            }
        }
    }
}

#Preview {
    let Presenter = Presenter()
    MenuView(presenter: Presenter)
}
