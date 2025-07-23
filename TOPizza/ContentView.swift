//
//  ContentView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var presenter = Presenter()
    
    var isUnlocked = true
    
    var body: some View {
        
        if isUnlocked {
            
            TabView {
                MenuView(presenter: presenter)
                    .tabItem {
                        Label("Меню", systemImage: "fork.knife")
                    }
                Text("Contacts")
                    .tabItem {
                        Label("Контакты", systemImage: "map")
                    }
                Text("Profile")
                    .tabItem {
                        Label("Профиль", systemImage: "person.fill")
                    }
                Text("Cart")
                    .tabItem {
                        Label("Корзина", systemImage: "basket.fill")
                    }
            }
            .accentColor(.pink)
        }
        else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
