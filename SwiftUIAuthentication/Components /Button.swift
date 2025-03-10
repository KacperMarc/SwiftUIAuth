//
//  Button.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 06/03/2025.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
   
    
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                Text(title)
                    .fontWeight(.semibold)
                Image(systemName: "arrow.right")
                
            }
        }
    }
}

