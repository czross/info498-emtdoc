//
//  PersonalIDTests.swift
//  EmtDoc
//
//  Created by studentuser on 12/6/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import XCTest
@testable import EmtDoc
class PersonalIDTests: XCTestCase {
    var person = PersonID()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyConstructorForNil() {
        let person = PersonID()
        XCTAssert(person != nil)
    }
    
    func testSetPatientName() {
        person.set(fName: "John  ")
        person.set(lName: " Doe ")
        person.set(gender: "Male")
        person.set(middleInitial: " Bob ")
        
        
        XCTAssert(person.fName == "John")
        XCTAssert(person.lName == "Doe")
        XCTAssert(person.gender == "Male")
        XCTAssert(person.middleInitial == "B")
    }
    
    func testPatientDob() {
        // Initialize Date components
        let components = NSDateComponents()
        components.month = 4
        components.day = 5
        components.year = 1995
        // Get NSDate given the above date components
        let testDate = NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: components as DateComponents)
        
        person.set(dobMonth: 4, dobDay: 5, dobYear: 1995)
        
        
        XCTAssert(person.dob! == testDate)
        
    }
    
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    } 
}



    
