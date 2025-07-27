//
//  LogoView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 27.07.2025.
//

import SwiftUI

struct LogoView: View {
    
    var logoColor: Color
    
    var body: some View {
        
        HStack(spacing: 18) { // Заменить на лого
            
            VStack {
                Text("то")
                    .padding(.top, -10)
                Spacer()
            }
            
            Text("П")
                .scaleEffect(2)
            VStack {
                Spacer()
                Text("ицца")
            }
            
        }
        .foregroundStyle(logoColor)
        .font(Font.system(size: 60, weight: .bold))
        .frame(width: 322,height: 115)
    }
    
    init(_ logoColor: Color? = .pinkLogo) {
        if let logoColor = logoColor {
            self.logoColor = logoColor
        } else {
            self.logoColor = .pinkLogo
        }
    }
}

#Preview {
    LogoView()
}
