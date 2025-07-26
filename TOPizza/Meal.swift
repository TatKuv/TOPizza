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
    let ingredients: [String]
    
    var textIngridients: String {
        ingredients.joined(separator: ", ").capitalized
    }
    
    let price = 234
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case image = "strMealThumb"
        case name = "strMeal"
        case category = "strCategory"
        case ingredients = "strIngredient1" //Заменит, добавить побольше ингедиентов
    }
    
    init(from decoder: any Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        
        self.ingredients = [try container.decode(String.self, forKey: .ingredients)]
        
    }
    
    
    init () {
        self.id = UUID().uuidString
        self.image = ""
        self.name = "Test dish"
        self.category = "New"
        self.ingredients = ["Sugar", "flour", "eggs","salt", "milk", "vanilla"]
    }
    
    static let example = Meal()
}
