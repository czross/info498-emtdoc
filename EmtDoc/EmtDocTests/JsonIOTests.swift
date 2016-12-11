//
//  JsonIOTests.swift
//  EmtDoc
//
//  Created by YiHanzhen on 12/10/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

import XCTest
@testable import EmtDoc

class JsonIOTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  private func makePerson() -> PersonID {
    let person = PersonID()
    person.set(fName: "John")
    person.set(lName: "Jackson")
    person.set(middleInitial: "K")
    person.set(dobMonth: 8, dobDay: 30, dobYear: 1980)
    person.set(age: 36)
    person.set(gender: "male")
    person.set(race: "racerace")
    person.set(physician: "GreatGuy")
    person.add(medication: "m1")
    person.add(medication: "m2")
    person.add(allergy: "peanut")
    person.add(allergy: "milk")
    person.set(address: "100 10th St NE")
    person.set(city: "Seattle")
    person.set(state: "WA")
    person.set(zip: "98000")
    person.set(advanced: "Advanced")
    return person
  }
    
    public func testReadWritePerson() -> Void {
      let person = makePerson()
      JsonIO.writeJson(person: person)
      let personRead = JsonIO.readJson()
      XCTAssert(person.fName == personRead.fName)
      XCTAssert(person.lName == personRead.lName)
      XCTAssert(person.middleInitial == personRead.middleInitial)
      XCTAssert(person.advanced == personRead.advanced)
      XCTAssert(person.race == personRead.race)
      XCTAssert(person.gender == personRead.gender)
      XCTAssert(person.physician == personRead.physician)
      XCTAssert(person.age == personRead.age)
      XCTAssert(person.dob == personRead.dob)
      XCTAssert(person.medications == personRead.medications)
      XCTAssert(person.allergies == personRead.allergies)
      XCTAssert(person.city == personRead.city)
      XCTAssert(person.state == personRead.state)
      XCTAssert(person.zip == personRead.zip)
    }
}
