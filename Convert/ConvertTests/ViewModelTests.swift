//
//  ViewModelTests.swift
//  ConvertTests
//
//  Created by Steven Hill on 22/02/2025.
//

import XCTest
@testable import Convert

final class ViewModelTests: XCTestCase {
    
    private var sut: ViewModel!
    
    override func setUp() {
        sut = ViewModel()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_viewModelDefaultValues_areSetCorrectlyAtInitialisation() {
        XCTAssertEqual(sut.selectedUnitTypeIndex, 0, "Should be set to 0.")
        XCTAssertEqual(sut.selectedFromUnitIndex, 0, "Should be set to 0.")
        XCTAssertEqual(sut.selectedToUnitIndex, 1, "Should be set to 1.")
        XCTAssertEqual(sut.inputAmount, "", "Should be set to an empty string.")
        XCTAssertEqual(sut.result, "", "Should be set to an empty string.")
    }
    
    func test_selectedUnitTypeIndex_changesCorrectly() {
        sut.selectedUnitTypeIndex = 0
        sut.selectedUnitTypeIndex = 1
        
        XCTAssertEqual(sut.selectedUnitTypeIndex, 1)
        XCTAssertEqual(sut.currentUnits, Conversions.init().conversions[1].units, "Both values should be the hours, minutes and seconds units of the Duration array.")
    }
    
    func test_unitSelectionResetFunction_resetsUnitIndexesToInitialValues() {
        sut.selectedFromUnitIndex = 2
        sut.selectedToUnitIndex = 2
        
        sut.resetUnitSelection()
        
        XCTAssertEqual(sut.selectedFromUnitIndex, 0, "Should be reset to 0.")
        XCTAssertEqual(sut.selectedToUnitIndex, 1, "Should be reset to 1.")
    }
    
    func test_unitSelectionResetFunction_resetsUnitIndexesToInitialValuesAfterUnitTypeIndexChanges() {
        sut.selectedFromUnitIndex = 3
        sut.selectedToUnitIndex = 2
        sut.selectedUnitTypeIndex = 1
        sut.resetUnitSelection()
        
        XCTAssertEqual(sut.selectedFromUnitIndex, 0, "Should be reset to 0.")
        XCTAssertEqual(sut.selectedToUnitIndex, 1, "Should be reset to 1.")
    }
    
    func test_updateResult_convertsInputAmountToResult_usingViewModelDefaultValues() {
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "0 au = 0 cm", "Result should be 0 au = 0 cm when view model's default values are used and input amount is an empty string.")
    }
    
    func test_updateResult_convertsInputAmountToResult_whenInputAmountIsAPeriod() {
        sut.inputAmount = "."
        
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "0 au = 0 cm", "The result should be 0 au = 0 cm.")
    }
    
    func test_updateResult_convertsInputAmountToResult_whenInputAmountIsANumberAndAPeriod() {
        sut.inputAmount = "0."
        
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "0 au = 0 cm", "The result should be 0 au = 0 cm.")
    }
    
    func test_updateResult_convertsInputAmountToResult_whenInputAmountIsAPeriodAndANumber() {
        sut.inputAmount = ".0"
        
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "0 au = 0 cm", "The result should be 0 au = 0 cm.")
    }
    
    func test_conversionCalculationForMilesToKilometers_isCorrect() {
        sut.selectedFromUnitIndex = 7
        sut.selectedToUnitIndex = 4
        sut.inputAmount = "5"
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "5 mi = 8.047 km", "Result should be that 5 miles is equal to 8.047 kilometers.")
    }
    
    func test_conversionCalculationForHoursToSeconds_isCorrect() {
        sut.selectedUnitTypeIndex = 1
        sut.selectedFromUnitIndex = 0
        sut.selectedToUnitIndex = 2
        sut.inputAmount = "1"
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "1 hr = 3,600 secs", "Result should be that 1 hour is equal to 3600 seconds.")
    }
    
    func test_conversionCalculationForGramsToKilograms_isCorrect() {
        sut.selectedUnitTypeIndex = 2
        sut.selectedFromUnitIndex = 0
        sut.selectedToUnitIndex = 1
        sut.inputAmount = "1000"
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "1,000 g = 1 kg", "Result should be that 1000 grams is equal to 1 kilogram.")
    }
    
    func test_conversionCalculationForFahrenheitToCelsius_isCorrect() {
        sut.selectedUnitTypeIndex = 3
        sut.selectedFromUnitIndex = 1
        sut.selectedToUnitIndex = 0
        sut.inputAmount = "100"
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "100°F = 37.778°C", "Result should be that 100 degrees Fahrenheit is equal to 37.778 degrees Celsius.")
    }
    
    func test_conversionCalculationForMillilitersToLiters_isCorrect() {
        sut.selectedUnitTypeIndex = 4
        sut.selectedFromUnitIndex = 6
        sut.selectedToUnitIndex = 5
        sut.inputAmount = "1000"
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "1,000 ml = 1 l", "Result should be that 1000 milliliters is equal to 1 liter.")
    }
    
    func test_changingASelectedUnitIndexAfterAConversion_updatesResultUsingNewlySelectedUnitIndex() {
        sut.selectedUnitTypeIndex = 0
        sut.selectedFromUnitIndex = 0
        sut.selectedToUnitIndex = 1
        sut.inputAmount = "100"
        sut.updateResult()
        XCTAssertEqual(sut.result, "100 au = 1,495,978,707,000,000 cm", "Should be the result of the first conversion: 100 au is equal to 1,495,978,707,000,000 cm.")
        
        sut.selectedFromUnitIndex = 8
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "100 mm = 10 cm", "Should be the result of the second conversion: 100 mm is equal to 10 cm.")
    }
    
    func test_changingSelectedUnitTypeIndexAfterAConversion_updatesResultUsingNewlySelectedUnitTypeIndex() {
        sut.selectedUnitTypeIndex = 2
        sut.selectedFromUnitIndex = 0
        sut.selectedToUnitIndex = 1
        sut.inputAmount = "500"
        sut.updateResult()
        XCTAssertEqual(sut.result, "500 g = 0.5 kg", "Should be the result of the first conversion: 500 g = 0.5 kg.")
        
        sut.selectedUnitTypeIndex = 1
        sut.updateResult()
        
        XCTAssertEqual(sut.result, "500 hrs = 30,000 min", "Should be the result of the second conversion: 500 hrs = 30,000 min.")
    }
}
