//
//  AccountSettingsRows.swift
//  SwiftUIAuthentication
//
//  Created by Kacper Marciszewski on 06/03/2025.
//

import SwiftUI

struct AccountSettingsRows: View {
    
    let image: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: image)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    AccountSettingsRows(image: "gear", title: "Version", tintColor: Color(.systemGray))
}
