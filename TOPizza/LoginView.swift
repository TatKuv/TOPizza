//
//  LoginView.swift
//  TOPizza
//
//  Created by Tatiana Kuvarzina on 23.07.2025.
//

import SwiftUI

struct LoginView: View {
    @State private var loginText: String = ""
    @State private var passwordText: String = ""
    
    var loggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                HStack(spacing: 0){ // Заменить
                    Group {
                        VStack{
                            Text("то")
                            Spacer()
                        }
                        Text("П")
                            .scaleEffect(2)
                            .padding(10)
                        Text("ицца")
                    }
                    .foregroundStyle(.pink)
                    
                    .font(.largeTitle)
                    .bold(true)
                }
                .frame(width: 322,height: 103) //До сюда 
                
                Group {
                    TextField("\(Image(systemName: "person.fill"))  Логин", text: $loginText)
                    SecureField("\(Image(systemName: "exclamationmark.lock.fill"))  Пароль", text: $passwordText)
                }
                .autocorrectionDisabled(true)
                .textFieldStyle(.roundedBorder)
                
                Spacer()
                
                Button {
                    if loggedIn {
                        
                    } else {
                        
                    }
                    
                } label: {
                    Text("Войти")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 344, height: 48)
                        .background(Color.pink)
                        .cornerRadius(16)
                }
            }
            .navigationTitle("Авторизация")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
