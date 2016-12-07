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
    var proc: Procedure? = nil

    
    var person = PersonID()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        proc = Procedure()
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
    
    func testOtherStrings() {
        person.set(race: "Caucasion")
        person.set(advanced: "Very Advanced")
        person.set(address: "12 Main Street")
        person.set(city: "Seattle ")
        person.set(state: "Washington")
        person.set(zip: "98115")
        person.set(telephone: "2065555555")
        person.set(telephone: "2065555551")
        person.set(physician: "Lit")

        
        XCTAssert(person.race == "Caucasion")
        XCTAssert(person.advanced == "Very Advanced")
        XCTAssert(person.address == "12 Main Street")
        XCTAssert(person.city == "Seattle")
        XCTAssert(person.state == "Washington")
        XCTAssert(person.zip == "98115")
        XCTAssert(person.telephone == "2065555551")
        XCTAssert(person.physician == "Lit")
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
    

    func testAddingAndRemovingAllergies() {
        person.add(allergy: "Ibuprofen")
        person.add(allergy: "Tylenol")
        
        person.remove(allergy: "tylenol")
        
        XCTAssert(!person.isAllergic(to : "tylenol"))
        XCTAssert(person.isAllergic(to : "IBUPROFEN"))
    }
    
    func testAddingAndRemovingMedication() {
        person.add(medication: "insulin")
        person.add(medication: "oxycotin")
        
        XCTAssert(person.isUsing(medication: "INSULIN "))
        XCTAssert(person.isUsing(medication: " oXYCoTIN"))
        XCTAssert(person.isUsing(medication: "insulin"))
        
        person.remove(medication: "insulin")
        XCTAssert(!person.isUsing(medication: "insulin"))
        XCTAssert(person.isUsing(medication: "oxycotin"))
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
