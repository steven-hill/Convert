//
//  ResultView.swift
//  Convert
//
//  Created by Steven Hill on 28/02/2025.
//

import SwiftUI

struct ResultView: View {
    // MARK: - State
    @State private var showSheet = false
    
    // MARK: - Constant
    let result: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Text(result)
                .lineLimit(...4)
                .truncationMode(.tail)
                .multilineTextAlignment(.leading)
                .foregroundStyle(.white)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(16)
                .padding(.horizontal)
                .accessibilityIdentifier("Result view")
            
            if result.count > 80 {
                Button(action: {
                    showSheet.toggle()
                }) {
                    Image(systemName: "rectangle.expand.diagonal")
                        .foregroundColor(.white)
                        .bold()
                        .rotationEffect(.init(degrees: 90))
                }
                .accessibilityIdentifier("Expand button")
                .padding([.top, .trailing, .bottom])
            }
        }
        .sheet(isPresented: $showSheet) {
            SheetView(showSheet: $showSheet, result: result)
        }
    }
}

#Preview {
    ResultView(result: "4 kg = 4000 g")
}
