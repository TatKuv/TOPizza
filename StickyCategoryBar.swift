//
//  StickyCategoryBar.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 24.07.2025.
//

import SwiftUI

struct StickyCategoryBar: View {
    @ObservedObject var presenter: Presenter
        
        var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(presenter.categories) { category in
                        Text(category.name)
                            .foregroundColor(.pink)
                            .frame(width: 88, height: 32)
                            .background(presenter.selectedCategory == category.name ? .pink.opacity(0.2) : .clear)
                            .cornerRadius(20)
                            .overlay(
                                presenter.selectedCategory == category.name ?
                                nil : RoundedRectangle(cornerRadius: 20)
                                    .stroke(.pink, lineWidth: 1)
                                
                            )
                            .opacity(presenter.selectedCategory == category.name ? 1: 0.4)  // Слишком много тернарников, вынести модифаеры
                        
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    presenter.selectedCategory = category.id
                                    presenter.hasUserInteractedWithCategory = true
                                }
                            }
                    }
                }
            }
            .padding()
            .background(.grayBackground)
        }
    
}

#Preview {
    let Presenter = Presenter()
    StickyCategoryBar(presenter: Presenter)
}
