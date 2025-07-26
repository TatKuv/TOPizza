//
//  MenuSection.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 26.07.2025.
//

import Foundation


struct MenuSection: Identifiable {
    let id: String
    let category: String
    let items: [Meal]
}
