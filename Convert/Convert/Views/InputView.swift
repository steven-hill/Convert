//
//  InputView.swift
//  Convert
//
//  Created by Steven Hill on 27/02/2025.
//

import SwiftUI

struct InputView: View {
    
    // MARK: - Binding
    @Binding var inputAmount: String
    
    // MARK: - Action
    let convertInput: () -> Void
    
    // MARK: - Constant
    let buttonImageName = "xmark.circle"
    
    // MARK: - Body
    var body: some View {
        HStack {
            TextField(text: $inputAmount, label: {
                Text("Enter amount")
                    .foregroundStyle(.gray)
            })
            .foregroundStyle(.white)
            .minimumScaleFactor(0.8)
            .font(.title)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(16)
            .keyboardType(.decimalPad)
            .accessibility(identifier: "Input amount text field")
            .onChange(of: inputAmount) {
                convertInput()
            }
            
            Button(action: {
                inputAmount.removeAll()
            }) {
                Image(systemName: buttonImageName)
                    .foregroundColor(inputAmount.isEmpty ? .gray : .white)
            }
            .accessibilityIdentifier(buttonImageName)
            .padding()
        }
        .padding(.leading)
    }
}

#Preview {
    InputView(inputAmount: .constant(""), convertInput: {})
}
