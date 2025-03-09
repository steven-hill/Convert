//
//  InputViewUITests.swift
//  ConvertUITests
//
//  Created by Steven Hill on 27/02/2025.
//

import XCTest

final class InputViewUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var inputField: XCUIElement!
    private var clearButton: XCUIElement!
    private var switchSelectedUnitsButton: XCUIElement!
    
    override func setUp() {
        app = XCUIApplication()
        inputField = app.textFields["Input amount text field"]
        clearButton = app.buttons["xmark.circle"]
        switchSelectedUnitsButton = app.buttons["arrow.up.arrow.down"]
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        inputField = nil
        clearButton = nil
        switchSelectedUnitsButton = nil
        app = nil
    }
    
    func test_textField_exists() {
        XCTAssertTrue(inputField.exists, "TextField should exist.")
    }
    
    func test_textField_isHittable() {
        XCTAssertTrue(inputField.isHittable, "TextField should be hittable.")
    }
    
    func test_textField_hasCorrectPlaceHolderTextOnLaunch() {
        XCTAssertEqual(inputField.placeholderValue, "Enter amount", "TextField should have the correct placeholder text.")
    }
    
    func test_tappingTextField_opensKeyboard() {
        inputField.tap()
        let keyboardIsHittable = app.keyboards.element.waitForExistence(timeout: 5)
        
        XCTAssertTrue(keyboardIsHittable, "Keyboard should be visible and hittable.")
    }
    
    func test_user_canEnterAmountIntoTextField() {
        tapInputFieldAndEnterText("25")
        
        XCTAssertEqual(inputField.value as? String, "25", "TextField shows text entered.")
    }
    
    func test_clearButtonImageSystemName_isXMarkCircle() {
        XCTAssertTrue(clearButton.exists, "Clear button SF symbol should be \"xmark.circle\".")
    }
    
    func test_user_cannotEnterLettersFromTheKeyboard() {
        inputField.tap()
        
        let decimalPointKey = app.keyboards.keys["."]
        let deleteKey = app.keyboards.keys["Delete"]
        
        XCTAssertTrue(decimalPointKey.exists && deleteKey.exists, "Keyboard should be `.decimalPad` type.")
    }
    
    func test_user_canClearAmountFromTextField() {
        tapInputFieldAndEnterText("25")
        clearButton.tap()
        
        XCTAssertEqual(inputField.placeholderValue, "Enter amount", "TextField should clear the amount entered.")
    }
    
    func test_switchSelectedUnitsButtonImageSystemName_isArrowUpArrowDown() {
        XCTAssertTrue(switchSelectedUnitsButton.exists, "Switch selected units button SF symbol should be \"arrow.up.arrow.down\".")
    }
    
    // MARK: - Helper function
    func tapInputFieldAndEnterText(_ text: String) {
        inputField.tap()
        inputField.typeText(text)
    }
}
