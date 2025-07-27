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
                                        Color.clear
                                                    .frame(height: 1)
                                                    .id("anchor-\(section.id)")
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            ForEach(section.items) { meal in
                                                MealCardView(meal: meal)
                                                    .padding(.top)
                                                Divider()
                                            }
                                        }
                                        .id(section.id)
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
                            proxy.scrollTo("anchor-\(categoryId)", anchor: UnitPoint(x:0.5,y: 0.08))     // Попправить, чтобы не пряталось, более удачно
                        }
                    }
                    
                    .safeAreaInset(edge: .top, spacing: 0) {
                        Menu {
                            ForEach(presenter.cities, id: \.self) { city in
                                Button(city) {
                                    presenter.selectedCity = city
                                }
                            }
                            
                        } label: {
                            HStack {
                                Text(presenter.selectedCity)
                                Image(systemName: "chevron.down")
                                    .font(.subheadline)
                                Spacer()
                            }
                            .foregroundStyle(.black)
                            .padding(.bottom, 16)
                            .padding(.horizontal, 16)
                        }
                        .padding(.top)
                        .background(.grayBackground)
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
