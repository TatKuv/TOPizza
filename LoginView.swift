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
                                withAnimation {
                                    presenter.isLoggedIn = true
                                }
                            } else {
                                    Task {
                                        try await Task.sleep(for: .seconds(2))
                                        presenter.showWelcomeBanner = false
                                    }
                            }
                            
                            withAnimation {
                                presenter.showWelcomeBanner = true
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
                        .padding()
                    }
                    .background(
                            Color.white
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                )
                                .ignoresSafeArea()
                        )
                }
                
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        
                        ZStack {
                            Text("Авторизация")
                                .font(.headline)
                            
                            if presenter.showWelcomeBanner {
                                    LoginStatusBanner(isSuccess: presenter.isLoggedIn)
                                    .transition(.move(edge: .top).combined(with: .opacity))
                                    .padding(.top)
                                }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    let Presenter = Presenter()
    LoginView(presenter: Presenter)
}
