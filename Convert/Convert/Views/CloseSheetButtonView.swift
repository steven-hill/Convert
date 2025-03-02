//
//  CloseSheetButtonView.swift
//  Convert
//
//  Created by Steven Hill on 28/02/2025.
//

import SwiftUI

struct CloseSheetButtonView: View {
    // MARK: - Action
    let action: () -> Void

    // MARK: - Body
    var body: some View {
        Button("Close", action: action)
            .accessibilityIdentifier("Close sheet button")
            .foregroundColor(.white)
    }
}

#Preview {
    CloseSheetButtonView(action: {})
}
