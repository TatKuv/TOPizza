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
        
        HStack(alignment: .top, spacing: 16) {
            
            AsyncImage(url: URL(string: meal.image)) { image in
                image.resizable()
            } placeholder: {
                Rectangle().fill(.gray.opacity(0.2))
            }
            .frame(width: 132, height: 132)
            .clipShape(.rect(cornerRadius: 20))
            
            Spacer()
            
            VStack (alignment: .leading, spacing: 8) {
                Text(meal.name)
                    .font(Font.system(size: 17, weight: .bold))
                
                Text(meal.textIngridients)
                    .lineLimit(3)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("от \(meal.price) р")
                        .font(.caption)
                        .padding(8)
                        .padding(.horizontal,10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.pinkLogo, lineWidth: 1)
                        )
                }
            }
        }
        .padding()
        .padding(.trailing,8)
        .frame(height: 156)
    }
}
    
    #Preview {
        MealCardView(meal: .example)
    }
