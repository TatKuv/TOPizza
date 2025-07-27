//
//  LoginView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var presenter: Presenter
    
    @State private var loginText: String = ""
    @State private var passwordText: String = ""
    
    @State private var showError = false
    @State private var errorText = "Неверный логин или пароль"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.grayBackground
                    .ignoresSafeArea()
                
                
                VStack {
                    Spacer()
                    
                    LogoView()
                    
                    Group {
                        TextField("\(Image(systemName: "person.fill"))  Логин", text: $loginText)
                        SecureField("\(Image(systemName: "exclamationmark.lock.fill"))  Пароль", text: $passwordText)
                    }
                    .padding()
                    .autocorrectionDisabled(true)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke( .grayText, lineWidth: 1)
                    )
                    .cornerRadius(20)
                    .padding(.horizontal,16)
                    
                    Spacer()
                    Spacer()
                    
                }
                .safeAreaInset(edge: .bottom) {
                    VStack(spacing: 12) {
                        Button {
                            if loginText == "Qwerty123" && passwordText == "Qwerty123" {
                                presenter.isLoggedIn = true
                            } else {
                                withAnimation {
                                    showError = true
                                }
                            }
                            
                        } label: {
                            Text("Войти")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .background(Color.pinkLogo)
                                .cornerRadius(20)
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    }
                    .background(
                            Color.white
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                )
                                .ignoresSafeArea()
                        )
                }
                
                .navigationTitle("Авторизация")
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
}

#Preview {
    let Presenter = Presenter()
    LoginView(presenter: Presenter)
}
