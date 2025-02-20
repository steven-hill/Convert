//
//  ConversionsTests.swift
//  ConvertTests
//
//  Created by Steven Hill on 20/02/2025.
//

import XCTest
@testable import Convert

final class ConversionsTests: XCTestCase {
    
    private var sut: Conversions!
    
    override func setUp() {
        sut = Conversions()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_conversionsArray_containsFiveUnitTypes() {
        XCTAssertEqual(sut.conversions.count, 5, "There should be 5 unit types.")
    }
    
    func test_conversionsUnitTypes_haveCorrectTitles() {
        XCTAssertEqual(sut.conversions[0].type.rawValue, "Distance", "The first conversion should be \"Distance\".")
        XCTAssertEqual(sut.conversions[1].type.rawValue, "Duration", "The second conversion should be \"Duration\".")
        XCTAssertEqual(sut.conversions[2].type.rawValue, "Mass", "The third conversion should be \"Mass\".")
        XCTAssertEqual(sut.conversions[3].type.rawValue, "Temperature", "The fourth conversion should be \"Temperature\".")
        XCTAssertEqual(sut.conversions[4].type.rawValue, "Volume", "The fifth conversion should be \"Volume\".")
    }
    
    func test_conversionsUnitTypes_haveCorrectNumberOfUnits() {
        XCTAssertEqual(sut.conversions[0].units.count, 11, "There should be 11 units for the distance conversion.")
        XCTAssertEqual(sut.conversions[1].units.count, 3, "There should be 3 units for the duration conversion.")
        XCTAssertEqual(sut.conversions[2].units.count, 6, "There should be 6 units for the mass conversion.")
        XCTAssertEqual(sut.conversions[3].units.count, 3, "There should be 3 units for the temperature conversion.")
        XCTAssertEqual(sut.conversions[4].units.count, 11, "There should be 11 units for the volume conversion.")
    }
}
