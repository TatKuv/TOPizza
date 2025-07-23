//
//  Presenter.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import Foundation


class Presenter: ObservableObject {
    @Published var cities = ["Москва", "Санкт-Петербург"]
    @Published var categories: [FoodCategory] = []
    @Published var menuItems: [Meal] = []
    @Published var selectedCategory: String = ""

//    var menuSections: [MenuSection] {
//        categories.map { category in
//            MenuSection(
//                id: category.id,
//                category: category,
//                items: menuItems.filter { $0.categoryId == category.id }
//            )
//        }
//    }

    init() {
        loadMockData()
        Task {
            try await loadData()
        }
    }

    func loadMockData() {
        self.categories = [
            .init(id: "pizza", name: "Pizza"),
            .init(id: "sushi", name: "Sushi"),
            .init(id: "drinks", name: "Drinks")
        ]

        self.selectedCategory = categories.first?.id ?? ""
    }
    
    func loadData() async throws {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=p") else {
            print("Invalid URL")
            //loadingState = .failed
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        let decoder = JSONDecoder()
        
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedData = try? decoder.decode(Meals.self, from: data) {
                self.menuItems = decodedData.meals
                    //loadingState = .loaded
            }
            
        } catch {
            //loadingState = .failed
            print("Invalid data")
        }
    }
}
