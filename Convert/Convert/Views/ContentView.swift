//
//  ContentView.swift
//  Convert
//
//  Created by Steven Hill on 19/02/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - State object
    @StateObject private var viewModel = ViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                UnitTypePickerView(viewModel: viewModel)
                UnitSelectionView(viewModel: viewModel, selectedIndex: $viewModel.selectedFromUnitIndex, title: "From", units: viewModel.currentUnits)
                
                InputView(inputAmount: $viewModel.inputAmount, convertInput: viewModel.updateResult)
                
                UnitSelectionView(viewModel: viewModel, selectedIndex: $viewModel.selectedToUnitIndex, title: "To", units: viewModel.currentUnits)
            }
        }
    }
}

#Preview {
    ContentView()
}
