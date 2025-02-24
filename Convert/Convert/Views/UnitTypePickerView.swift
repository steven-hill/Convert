//
//  UnitTypePickerView.swift
//  Convert
//
//  Created by Steven Hill on 24/02/2025.
//

import SwiftUI

struct UnitTypePickerView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(0..<Conversions.init().conversions.count, id: \.self) { index in
                    Button(action: {
                        viewModel.selectedUnitTypeIndex = index
                        viewModel.resetUnitSelection()
                    }) {
                        Text(Conversions.init().conversions[index].type.rawValue)
                            .padding()
                            .font(.headline)
                            .foregroundColor(viewModel.selectedUnitTypeIndex == index ? .white : .teal)
                            .background(viewModel.selectedUnitTypeIndex == index ? Color.teal : Color.clear)
                            .cornerRadius(16)
                            .frame(height: 40)
                            .animation(.easeInOut, value: viewModel.selectedUnitTypeIndex)
                    }
                    .onChange(of: viewModel.selectedUnitTypeIndex) {
                        viewModel.updateResult()
                    }
                    .accessibilityIdentifier("Unit type button \(index)")
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.1))
        .cornerRadius(16)
        .accessibilityIdentifier("Unit type picker scroll view")
    }
}

#Preview {
    UnitTypePickerView(viewModel: ViewModel())
}
