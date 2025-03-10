//
//  ContentView.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 06/03/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.vertical, 30)
                // MARK: - fields
                
                VStack(spacing: 20){
                    TextInput(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .textInputAutocapitalization(.never)
                    TextInput(text: $password, title: "Password", placeholder: "Enter your password", isSecureTextEntry: true)
                }
                .padding(.horizontal)
                
                
                // MARK: - sign in button
                
                Button{
                    Task {

                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                }label: {
                    HStack {
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                        
                    }
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.5)
                .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 40)
                    .foregroundStyle(.white)
                    .background(Color.black)
                    .cornerRadius(10)
                    .padding(.top)
                    .padding()
                
               
                
                // MARK: - sign up button
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationTitle("Create an account")
                } label: {
                    HStack(spacing: 2) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.gray)
                }
                
            }
        }
        }
}
// MARK: - Login Form Validation
extension LoginView: AutheticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count >= 6
    }
}

#Preview {
    LoginView()
}
