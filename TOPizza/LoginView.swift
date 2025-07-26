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
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()
                
                
                VStack {
                    Spacer()
                    
                    HStack(spacing: 18) { // Заменить
                        
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
                    .foregroundStyle(.pink)
                    .font(Font.system(size: 60, weight: .bold))
                    .frame(width: 322,height: 115)
                    //До сюда
                    
                    Group {
                        TextField("\(Image(systemName: "person.fill"))  Логин", text: $loginText)
                        SecureField("\(Image(systemName: "exclamationmark.lock.fill"))  Пароль", text: $passwordText)
                    }
                    .padding()
                    .autocorrectionDisabled(true)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal,16)
                    //.shadow(radius: 1) //fix
                    
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
                                .background(Color.pink)
                                .cornerRadius(20)
                        }
                        .padding(.horizontal, 32)
                        .padding(.top, 8)
                    }
                    .padding(.bottom, 16)
                    .background(.white)
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
