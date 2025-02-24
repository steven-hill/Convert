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
            UnitTypePickerView(viewModel: viewModel)
        }
    }
}

#Preview {
    ContentView()
}
