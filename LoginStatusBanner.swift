//
//  LoginStatusBanner.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 28.07.2025.
//

import SwiftUI

struct LoginStatusBanner: View {
    
    var isSuccess: Bool
    var text: String
    var elementColor: Color
    
    var imageIndicator: Image {
        isSuccess ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "xmark.circle.fill")
    }
    
    init(isSuccess: Bool = false) {
        self.isSuccess = isSuccess
        self.text = isSuccess ? "Вход выполнен успешно" : "Неверный логин или пароль"
        self.elementColor = isSuccess ? .green : .pinkLogo
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
            Spacer()
            imageIndicator
            
        }
        .padding()
        .background(.white)
        .cornerRadius(20)
        .foregroundStyle(elementColor)
    }
}

#Preview {
    LoginStatusBanner()
}
