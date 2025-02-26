//
//  UnitSelectionView.swift
//  Convert
//
//  Created by Steven Hill on 25/02/2025.
//

import SwiftUI

struct UnitSelectionView: View {
    // MARK: - Observed object
    @ObservedObject var viewModel: ViewModel
    
    // MARK: - Binding
    @Binding var selectedIndex: Int
    
    // MARK: - Constants
    let title: String
    let units: [Dimension]
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .foregroundStyle(.gray)
                .padding()
            Spacer()
            Picker("\(title) unit selection view", selection: $selectedIndex) {
                ForEach(0..<units.count, id: \.self) { index in
                    Text(formatUnit(units[index])).tag(index)
                }
            }
            .padding()
            .pickerStyle(.menu)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(16)
            .tint(Color.teal)
            .accessibilityIdentifier("\(title) unit selection view")
            .onChange(of: selectedIndex) {
                viewModel.updateResult()
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing)
    }
    
    // MARK: - formatUnit method
    func formatUnit(_ unit: Dimension) -> String {
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .long 
        return formatter.string(from: unit)
    }
}

#Preview {
    UnitSelectionView(viewModel: ViewModel(), selectedIndex: .constant(1), title: "From", units: [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds])
}
