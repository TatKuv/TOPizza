//
//  Presenter.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import Foundation


class Presenter: ObservableObject {
    @Published var isLoggedIn = false
    @Published var showWelcomeBanner = false
    
    @Published var cities = ["Москва", "Санкт-Петербург", "Краснодар"]
    @Published var categories: [FoodCategory] = []
    @Published var menuItems: [Meal] = []
    
    @Published var selectedCategory = ""
    @Published var hasUserInteractedWithCategory = false
    @Published var selectedCity = "Москва"
    
    
    var menuSections: [MenuSection] {
        categories.map { category in
            MenuSection(
                id: category.id,
                category: category.name,
                items: menuItems.filter { $0.category == category.id }
            )
        }
    }
    
    
    
    init() {
        
        Task {
            try await loadData()
        }
    }
    
    
    @MainActor
    func loadData() async throws {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=p") else {
            print("Invalid URL")
            //loadingState = .failed
            return
        }
        
        let decoder = JSONDecoder()
        
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? decoder.decode(Meals.self, from: data) {
                self.menuItems = decodedData.meals
                
                self.categories = Array(
                    Set(self.menuItems.map { $0.category })
                ).sorted().map { categoryName in
                    FoodCategory(id: categoryName, name: categoryName)   //id == name 
                }
                self.selectedCategory = categories.first?.name ?? ""
                self.hasUserInteractedWithCategory = false
                //loadingState = .loaded
            }
            
        } catch {
            //loadingState = .failed
            print("Invalid data")
        }
    }
}
