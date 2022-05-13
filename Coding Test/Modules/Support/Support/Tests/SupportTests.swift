//
//  SupportTests.swift
//  Support
//
//  Created by Savvycom on 5/13/22.
//

import XCTest

class SupportTests: XCTestCase {

    func testYearSetter() {
        var date = Date()
        date.year = 1998
        XCTAssertTrue(date.year == 1998)
    }
    
    func testMonthSetter() {
        var date = Date()
        date.month = 1
        XCTAssertTrue(date.month == 1)
    }
    
    func testDaySetter() {
        var date = Date()
        date.day = 1
        XCTAssertTrue(date.day == 1)
    }
    
    func testDateTransformToString() {
        var date = Date()
        date.year = 1998
        date.month = 1
        date.day = 1
        XCTAssertEqual(date.string(format: "dd/MM/yyyy"), "01/01/1998")
    }
    
    func testStringTransformToDate() {
        var date = Date()
        date.year = 1998
        date.month = 1
        date.day = 1
        
        let dateTransformed = "01/01/1998".date(format: "dd/MM/yyyy") ?? Date()
        XCTAssertTrue(date.year == dateTransformed.year)
        XCTAssertTrue(date.month == dateTransformed.month)
        XCTAssertTrue(date.day == dateTransformed.day)
    }
}
