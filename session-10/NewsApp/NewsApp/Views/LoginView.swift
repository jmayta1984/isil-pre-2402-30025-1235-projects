//
//  LoginView.swift
//  NewsApp
//
//  Created by user259661 on 10/27/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var isLoggedIn: Bool = false
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                            .padding()
                    } else {
                        SecureField("Password", text: $password)
                            .padding()
                    }
                    
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }.padding()
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                
                
                Button(action: {
                    AuthService().login(body: LoginBody(username: username, password: password)) { response, string in
                        if let response = response  {
                            isLoggedIn = true
                            print(response.username)
                        } else {
                            showAlert = true
                        }
                        
                    }
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Login failed"),
                        message: Text("Incorrect username or password. Please try again."),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }.padding()
                .navigationDestination(isPresented: $isLoggedIn) {
                    NewsListView()
                }
        }
    }
}

#Preview {
    LoginView()
}
