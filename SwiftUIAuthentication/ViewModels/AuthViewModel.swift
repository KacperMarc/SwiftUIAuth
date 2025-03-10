//
//  LoginViewModel.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 07/03/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol AutheticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUserData()
        }
    }
    func signIn(withEmail email: String, password: String) async throws {
        
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUserData()
        }
        catch {
            print("Error signing in: \(error.localizedDescription)")
        }
        
        print("Signing in...")
    }
    func createUser(withEmail email: String, password: String, name: String) async throws {
        print("Creating user...")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, name: name, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
             
            await fetchUserData()
        }
        catch {
            print("Error creating user: \(error.localizedDescription)")
        }
        
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }
        catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    func deleteUser() {
        
    }
    func fetchUserData() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
     
}
