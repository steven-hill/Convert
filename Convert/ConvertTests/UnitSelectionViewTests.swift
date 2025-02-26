//
//  UnitSelectionViewTests.swift
//  ConvertTests
//
//  Created by Steven Hill on 25/02/2025.
//

import XCTest
@testable import Convert

final class UnitSelectionViewTests: XCTestCase {

    private var sut: UnitSelectionView!
    private var viewModel: ViewModel!

    override func setUp() {
        viewModel = ViewModel()
        sut = UnitSelectionView(viewModel: viewModel, selectedIndex: .constant(2), title: "Test", units: [UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds])
    }
    
    override func tearDown() {
        viewModel = nil
        sut = nil
    }
    
    func test_unitSelectionView_isInitializedCorrectly() {
        XCTAssertNotNil(sut, "Should not be nil.")
        XCTAssertEqual(sut.units.count, 3, "Should have three units in the array.")
        XCTAssertEqual(sut.title, "Test", "Should have the correct title.")
    }
    
    func test_unitSelectionView_whenSelectedIndexChangedToOne_thenSelectedIndexIsUpdatedToMinutes() {
        sut.selectedIndex = 1
        
        XCTAssertEqual(sut.units[1], UnitDuration.minutes, "Selected duration should be updated to minutes.")
    }
    
    func test_unitSelectionViewFormatter_usesLongStyle() {
        XCTAssertEqual(sut.formatUnit(UnitDuration.minutes), "minutes", "Should be long unit style. In long unit style, minutes is displayed as \"minutes\"; short and medium unit styles both use \"mins\".")
    }
}
