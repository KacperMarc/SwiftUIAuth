//
//  SwiftUIAuthenticationApp.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 06/03/2025.
//

import SwiftUI
import Firebase

@main
struct SwiftUIAuthenticationApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure() 
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
