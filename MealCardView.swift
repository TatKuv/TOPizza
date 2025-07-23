//
//  MealCardView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 24.07.2025.
//

import SwiftUI

struct MealCardView: View {
    var meal: Meal
    
    var body: some View {
        
        LazyHStack (spacing: 48) {
            
            Rectangle()
                .frame(width: 132, height: 132)
                .foregroundStyle(.gray)
                .clipShape(.rect(cornerRadius: 20))
            
            VStack (alignment: .leading, spacing: 8) {
                Text(meal.name)
                    .font(Font.system(size: 17, weight: .bold))
                
                Text(meal.textIngridients)
                    .foregroundStyle(.secondary)
                
                HStack {
                    Spacer()
                    Text("от \(meal.price) р")
                        .font(.caption)
                        .padding(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.pink, lineWidth: 1)
                        )
                }
            }
            .frame(width: 171, height: 124, alignment: .leading)
            
        }
    }
}
    
    #Preview {
        //MealCardView(meal: presenter.menuItems[0])
    }
