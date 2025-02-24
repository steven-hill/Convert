//
//  UnitTypePickerViewUITests.swift
//  ConvertUITests
//
//  Created by Steven Hill on 24/02/2025.
//

import XCTest
import SwiftUI

final class UnitTypePickerViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var scrollView: XCUIElement!
    
    override func setUp() {
        app = XCUIApplication()
        scrollView = app.scrollViews["Unit type picker scroll view"]
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        scrollView = nil
        app = nil
    }
    
    func test_unitTypePickerViewScrollView_exists() {
        XCTAssertTrue(scrollView.exists, "The scroll view should exist.")
    }
    
    func test_unitTypePickerViewScrollView_isHittable() {
        XCTAssertTrue(scrollView.isHittable, "The scroll view should be hittable.")
    }
    
    func test_unitTypePickerViewScrollView_hasCorrectNumberOfButtons() {
        XCTAssertEqual(scrollView.buttons.count, 5, "The scroll view should have 5 buttons.")
    }
    
    func test_unitTypePickerView_hasCorrectButtonLabels() {
        let firstButton = scrollView.buttons["Unit type button 0"]
        let secondButton = scrollView.buttons["Unit type button 1"]
        let thirdButton = scrollView.buttons["Unit type button 2"]
        let fourthButton = scrollView.buttons["Unit type button 3"]
        let fifthButton = scrollView.buttons["Unit type button 4"]
        
        XCTAssertEqual(firstButton.label, "Distance", "The first button label should be \"Distance\".")
        XCTAssertEqual(secondButton.label, "Duration", "The second button label should be \"Duration\".")
        XCTAssertEqual(thirdButton.label, "Mass", "The third button label should be \"Mass\".")
        XCTAssertEqual(fourthButton.label, "Temperature", "The fourth button label should be \"Temperature\".")
        XCTAssertEqual(fifthButton.label, "Volume", "The fifth button label should be \"Volume\".")
    }
    
    func test_unitTypePickerView_canScrollToTheEndAndDisplayLastButton() {
        let lastButton = scrollView.buttons["Unit type button 4"]
        XCTAssertTrue(lastButton.exists, "Should be present in the view hierarchy but off screen initially.")
        
        scrollView.swipeLeft()
        
        XCTAssertTrue(lastButton.isHittable, "Should be able to scroll to the end of the scroll view and display the last button.")
    }
}
