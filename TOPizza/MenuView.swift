//
//  MenuView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var presenter: Presenter
    
    //@State private var offset = CGSize.zero
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.gray
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    
                    ScrollView(.horizontal) {
                        
                        LazyHStack (spacing: 10) {
                            Image("baner1")
                                .resizable()
                                //.frame(width: 300, height: 112)
                                .clipShape(.rect(cornerRadius: 10))
                                .scaledToFill()
                            
                            Image("baner2")
                                .resizable()
                                .foregroundStyle(.yellow)
                                .clipShape(.rect(cornerRadius: 10))
                                .scaledToFill()
                        }
                    }
                    .frame(height: 112)
                    .padding(.vertical)
                    .padding(.leading)
                    .scrollIndicators(.hidden)
                    
                    
                    Picker("Category", selection: $presenter.selectedCategory) {
                        ForEach(presenter.categories) { category in //.allCases) { category in
                            Text(category.name)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                    .padding(.leading)
                    
                    List(presenter.menuItems) { meal in
                        
                        MealCardView(meal: meal)

                        .listRowInsets(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
                    }
                    .scrollContentBackground(.hidden)
                    .background(
                        Color.white.edgesIgnoringSafeArea(.all)
                    )
                    .clipShape(.rect(cornerRadius: 20))
                    
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Picker("Город", selection: $presenter.cities[0]) {
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

#Preview {
    let Presenter = Presenter()
    MenuView(presenter: Presenter)
}
