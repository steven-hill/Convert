//
//  CustomButtonView.swift
//  Convert
//
//  Created by Steven Hill on 09/03/2025.
//

import SwiftUI

struct CustomButtonView: View {
    // MARK: - Action
    let action: () -> Void
    
    // MARK: - Constants
    let imageSystemName: String
    let accessibilityIdentifier: String
    
    // MARK: - Disabled boolean
    let disabled: Bool
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Image(systemName: imageSystemName)
                .foregroundColor(disabled ? .gray : .white)
        }
        .disabled(disabled)
        .accessibilityIdentifier(accessibilityIdentifier)
    }
}

#Preview {
    CustomButtonView(action: {}, imageSystemName: "arrow.up.arrow.down", accessibilityIdentifier: "arrow.up.arrow.down", disabled: true)
}
