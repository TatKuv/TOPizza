//
//  Meal.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import Foundation

struct Meal: Codable, Identifiable {
    let id: String
    let image: String
    let name: String
    let category: String
    let ingridients: [String]
    
    var textIngridients: String {
        ingridients.joined(separator: ", ").capitalized
    }
    
    let price = 234
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case image = "strMealThumb"
        case name = "strMeal"
        case category = "strCategory"
        case ingridients = "strIngredient1"
        //case price
    }
    
    init(from decoder: any Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        
        self.ingridients = [try container.decode(String.self, forKey: .ingridients)]
        
    }
}
