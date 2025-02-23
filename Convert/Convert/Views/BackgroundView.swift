//
//  BackgroundView.swift
//  Convert
//
//  Created by Steven Hill on 23/02/2025.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.black, .teal]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        .accessibilityIdentifier("Background view")
    }
}
