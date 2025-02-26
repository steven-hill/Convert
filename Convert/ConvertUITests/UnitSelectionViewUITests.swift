//
//  UnitSelectionViewUITests.swift
//  ConvertUITests
//
//  Created by Steven Hill on 25/02/2025.
//

import XCTest

final class UnitSelectionViewUITests: XCTestCase {

    private var app: XCUIApplication!
    private var fromPickerMenu: XCUIElement!
    private var toPickerMenu: XCUIElement!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        fromPickerMenu = app.buttons["From unit selection view"]
        toPickerMenu = app.buttons["To unit selection view"]
        continueAfterFailure = false
    }
    
    override func tearDown() {
        fromPickerMenu = nil
        toPickerMenu = nil
        app = nil
    }

    func test_unitSelectionViews_exist() {
        XCTAssertTrue(fromPickerMenu.exists, "The picker should exist.")
        XCTAssertTrue(toPickerMenu.exists, "The picker should exist.")
    }
    
    func test_unitSelectionViews_areHittable() {
        XCTAssertTrue(fromPickerMenu.isHittable, "The picker should be hittable.")
        XCTAssertTrue(toPickerMenu.isHittable, "The picker should be hittable.")
    }
    
    func test_unitSelectionViews_haveCorrectTitleLabels() {
        let fromUnitSelectionViewTitle = app.staticTexts["From"]
        let toUnitSelectionViewTitle = app.staticTexts["To"]
        
        XCTAssertEqual(fromUnitSelectionViewTitle.label, "From", "Should be \"From\".")
        XCTAssertEqual(toUnitSelectionViewTitle.label, "To", "Should be \"To\".")
    }
    
    func test_unitSelectionViews_haveCorrectUnitLabelsOnLaunch() {
        let fromUnitSelectionViewUnit = app.staticTexts["astronomical units"]
        let toUnitSelectionViewUnit = app.staticTexts["centimetres"]
        
        XCTAssertEqual(fromUnitSelectionViewUnit.label, "astronomical units", "Should be \"astronomical units\".")
        XCTAssertEqual(toUnitSelectionViewUnit.label, "centimetres", "Should be \"centimetres\".")
    }
}
