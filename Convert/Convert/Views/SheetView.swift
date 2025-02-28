//
//  SheetView.swift
//  Convert
//
//  Created by Steven Hill on 28/02/2025.
//

import SwiftUI

struct SheetView: View {
    // MARK: - Binding
    @Binding var showSheet: Bool
    
    // MARK: - Constant
    let result: String
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView()
                ScrollView {
                    Text(result)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .font(.largeTitle)
                }
                .navigationBarItems(trailing: CloseSheetButtonView(action: {
                    showSheet.toggle()
                }))
                .foregroundStyle(.white)
            }
        }
        .accessibilityIdentifier("Sheet view")
    }
}

#Preview {
    SheetView(showSheet: .constant(true), result: "111,111,111,111,111,110,000 au = 1,662,198,563,333,333,400,000,000,000,000,000 cm")
}
