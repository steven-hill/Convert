//
//  ResultViewUITests.swift
//  ConvertUITests
//
//  Created by Steven Hill on 28/02/2025.
//

import XCTest

final class ResultViewUITests: XCTestCase {

    private var app: XCUIApplication!
    private var inputField: XCUIElement!
    private var resultView: XCUIElement!
    private var expandButton: XCUIElement!
    private var sheet: XCUIElement!
    
    override func setUp() {
        app = XCUIApplication()
        inputField = app.textFields["Input amount text field"]
        resultView = app.staticTexts["Result view"]
        expandButton = app.buttons["Expand button"]
        sheet = app.otherElements["Sheet view"]
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        inputField = nil
        resultView = nil
        expandButton = nil
        sheet = nil
        app = nil
    }
    
    func test_resultView_exists() {
        XCTAssertTrue(resultView.exists, "Result view should exist.")
    }
    
    func test_resultView_displaysCorrectTextOnLaunch() {
        XCTAssertTrue(resultView.label == "0", "Result view should have the correct initial text.")
    }
    
    func test_resultView_doesntRevealExpandButtonOnLaunch() {
        XCTAssertFalse(app.buttons["Expand button"].exists, "Expand result button should not initially be visible.")
    }
    
    func test_resultView_displaysCorrectTextAfterInput() {
        createShortResult()
        
        XCTAssertEqual(resultView.label, "1 au = 14,959,787,070,000 cm", "Result view should have the correct text after input.")
    }
    
    func test_resultView_doesntRevealExpandButtonForShortResult() {
        createShortResult()
        
        XCTAssertFalse(app.buttons["Expand button"].exists, "Expand result button should not be visible for a short result.")
    }
    
    func test_resultView_revealsExpandButtonForLongResult() {
        createLongResult()
        
        XCTAssertTrue(app.buttons["Expand button"].exists, "Expand result button should be visible for a long result.")
    }
    
    func test_tappingExpandButton_showsSheet() {
        textEnteredAndSheetShown()
        
        XCTAssertTrue(sheet.exists, "The sheet should be shown when the expand button is tapped.")
    }
    
    func test_sheet_containsCorrectText() {
        textEnteredAndSheetShown()
        
        XCTAssertTrue(sheet.staticTexts["111,111,111,111,111,110,000 au = 1,662,198,563,333,333,400,000,000,000,000,000 cm"].exists, "The sheet should contain the whole result text without truncation.")
    }
    
    func test_tappingExpandButton_thenCloseButton_hidesSheet() {
        textEnteredAndSheetShown()
        let closeButton = app.buttons["Close sheet button"]
        closeButton.tap()
        
        XCTAssertFalse(sheet.exists, "The sheet should be dismissed after tapping close.")
    }
    
    // MARK: - Helper functions
    func createShortResult() {
        inputField.tap()
        inputField.typeText("1")
    }
    
    func createLongResult() {
        inputField.tap()
        inputField.typeText("111111111111111111111")
    }
    
    func textEnteredAndSheetShown() {
        createLongResult()
        expandButton.tap()
    }
}


