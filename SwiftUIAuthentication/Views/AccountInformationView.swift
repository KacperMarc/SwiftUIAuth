//
//  AccountInformationView.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 06/03/2025.
//

import SwiftUI

struct AccountInformationView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section{
                    HStack{
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(width: 60, height: 60)
                            .background(Color.gray)
                            .clipShape(Circle())
                        VStack{
                            Text(user.name)
                                .fontWeight(.semibold)
                                .font(.subheadline)
                            
                            Text(user.email)
                                .accentColor(.gray)

                        }
                    }
                }
                
                Section("Settings"){
                    HStack {
                        AccountSettingsRows(image: "gear", title: "Version", tintColor: Color(.systemGray2))
                        Spacer()
                        Text("1.0.0")
                    }
                }
                
                Section("Account actions"){
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        AccountSettingsRows(image: "arrow.left", title: "Sing out", tintColor: Color(.systemRed))
                    })
                    Button(action: {
                        
                    }, label: {
                        AccountSettingsRows(image: "trash", title: "Delete account", tintColor: Color(.systemRed))
                    })
                    
                }
            }
        }
    }
}

#Preview {
    AccountInformationView()
}
