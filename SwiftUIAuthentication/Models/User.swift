//
//  User.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 07/03/2025.
//

import Foundation
struct User: Identifiable, Codable {
    let id: String
    let name: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let nameComponents = formatter.personNameComponents(from: name) {
            formatter.style = .abbreviated
            return formatter.string(from: nameComponents)
        }
        return ""
    }
    
    
}
