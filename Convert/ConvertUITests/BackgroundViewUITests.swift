//
//  BackgroundViewUITests.swift
//  ConvertUITests
//
//  Created by Steven Hill on 23/02/2025.
//

import XCTest

final class BackgroundViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_backgroundView_exists() {
        let backgroundView = app.otherElements["Background view"]

        XCTAssertTrue(backgroundView.exists, "The background view should exist.")
    }
    
    func test_backgroundView_coversTheEntireScreen() {
        let backgroundView = app.otherElements["Background view"]
        let appFrame = app.windows.firstMatch.frame
        
        XCTAssertEqual(backgroundView.frame, appFrame, "The background view should ignore the safe area and cover the entire screen.")
    }
}
