//
//  EmtDocTests.swift
//  EmtDocTests
//
//  Created by Brian Ross on 11/22/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import XCTest
@testable import EmtDoc

class EmtDocTests: XCTestCase {
    let proc: Procedure?

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        proc = Procedure()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testProcedureMedChoices() {
        let base = proc?.getMeds()
        let shouldBe = [
            "Epinephrine",
            "Bircarb",
            "Insulin",
            "Amiodarone"
        ]
        XCTAssertEqual(shouldBe, base!)
    }
    
    func testProcedureProcChoice() {
        let base = proc?.getProcedures()
    }
    
}
