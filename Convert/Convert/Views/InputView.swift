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
    
    // MARK: - Actions
    let convertInput: () -> Void
    let switchSelectedUnits: () -> Void
    
    // MARK: - Constants
    let clearButtonImageName = "xmark.circle"
    let switchUnitsButtonImageName = "arrow.up.arrow.down"
    
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
            
            CustomButtonView(action: { inputAmount.removeAll() }, imageSystemName: clearButtonImageName, accessibilityIdentifier: clearButtonImageName, disabled: inputAmount.isEmpty)
                .padding()
            
            CustomButtonView(action: { switchSelectedUnits() }, imageSystemName: switchUnitsButtonImageName, accessibilityIdentifier: switchUnitsButtonImageName, disabled: false)
                .padding(.trailing)
        }
        .padding(.leading)
    }
}

#Preview {
    InputView(inputAmount: .constant(""), convertInput: {}, switchSelectedUnits: {})
}
