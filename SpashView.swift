//
//  SpashView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 27.07.2025.
//

import SwiftUI

struct SplashView: View {
    var color : Color = Color(red: 253/255, green: 58/255, blue: 105/255)
    var body: some View {
            ZStack {
                Color.pinkLogo.ignoresSafeArea()
                
                VStack(spacing: 16) {
                    LogoView(.white)
                }
            }
        }
}

#Preview {
    SplashView()
}
