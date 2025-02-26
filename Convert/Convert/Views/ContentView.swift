//
//  ContentView.swift
//  Convert
//
//  Created by Steven Hill on 19/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                UnitTypePickerView(viewModel: viewModel)
                UnitSelectionView(viewModel: viewModel, selectedIndex: $viewModel.selectedFromUnitIndex, title: "From", units: viewModel.currentUnits)
                UnitSelectionView(viewModel: viewModel, selectedIndex: $viewModel.selectedToUnitIndex, title: "To", units: viewModel.currentUnits)
            }
        }
    }
}

#Preview {
    ContentView()
}
