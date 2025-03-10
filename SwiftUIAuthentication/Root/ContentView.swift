//
//  ContentView.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 07/03/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                AccountInformationView()
            }else {
                LoginView()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
