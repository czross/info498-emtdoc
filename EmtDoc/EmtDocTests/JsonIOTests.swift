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
  
  private func makePersons() -> [PersonID] {
    let person1 = PersonID()
    person1.set(fName: "John")
    person1.set(lName: "Jackson")
    let person2 = PersonID()
    person2.set(fName: "Jacob")
    person2.set(lName: "Johnson")
    var persons = [PersonID]()
    persons.append(person1)
    persons.append(person2)
    return persons
  }
 
  
    public func testReadWritePerson() -> Void {
      let persons = makePersons()
      JsonIO.writePerson(person: persons[0])
      JsonIO.writePerson(person: persons[1])
      let personsRead = JsonIO.readPerson()
      print (personsRead.count)
      XCTAssert(personsRead.count == 2)
  }
  
  
  private func makeExam() -> Exam {
    let exam = Exam()
    exam.abdomen = exam.abdomenChoices[0]
    exam.back = exam.backChoices[0]
    exam.chest["heartSounds"] = exam.chestChoices["heartSounds"]![0]
    exam.chest["lungs"] = exam.chestChoices["lungs"]![0]
    exam.extremities["leftUpper"] = exam.extremityChoices["leftUpper"]![0]
    exam.extremities["rightUpper"] = exam.extremityChoices["rightUpper"]![0]
    exam.extremities["leftLower"] = exam.extremityChoices["leftLower"]![0]
    exam.extremities["rightUpper"] = exam.extremityChoices["rightUpper"]![0]
    exam.facial["pupils"] = exam.facialChoices["pupils"]![0]
    exam.facial["throat"] = exam.facialChoices["throat"]![0]
    exam.facial["ears"] = exam.facialChoices["ears"]![0]
    exam.facial["nose"] = exam.facialChoices["nose"]![0]
    exam.facial["head"] = exam.facialChoices["head"]![0]
    exam.mentalStatus = exam.mentalStatusChoices[0]
    exam.neuro = exam.neuroChoices[0]
    exam.pelvic = exam.pelvicChoices[0]
    exam.skin = exam.skinChoices[0]
    return exam
  }
  
  public func testExamReadWrite() {
    let exam = makeExam()
    JsonIO.writeExam(exam: exam)
    let examRead = JsonIO.readExam()
    XCTAssert(exam.abdomen == examRead.abdomen)
    XCTAssert(exam.back == examRead.back)
    XCTAssert(exam.chest["heartSounds"] == examRead.chest["heartSounds"])
    XCTAssert(exam.chest["lungs"] == examRead.chest["lungs"])
    XCTAssert(exam.extremities["leftUpper"] == examRead.extremities["leftUpper"])
    XCTAssert(exam.extremities["rightUpper"] == examRead.extremities["rightUpper"])
    XCTAssert(exam.extremities["leftLower"] == examRead.extremities["leftLower"])
    XCTAssert(exam.extremities["rightUpper"] == examRead.extremities["rightUpper"])
    XCTAssert(exam.facial["pupils"] == examRead.facial["pupils"])
    XCTAssert(exam.facial["throat"] == examRead.facial["throat"])
    XCTAssert(exam.facial["ears"] == examRead.facial["ears"])
    XCTAssert(exam.facial["nose"] == examRead.facial["nose"])
    XCTAssert(exam.facial["head"] == examRead.facial["head"])
    XCTAssert(exam.mentalStatus == examRead.mentalStatus)
    XCTAssert(exam.neuro == examRead.neuro)
    XCTAssert(exam.pelvic == examRead.pelvic)
    XCTAssert(exam.skin == examRead.skin)
  }
  
  
  private func makeProcedure() -> Procedure {
    let procedure = Procedure()
    procedure.done(procedure: "proc1", location: "loc1")
    procedure.done(procedure: "proc2", location: "loc2")
    return procedure
  }
  
  public func testReadWriteProcedure() -> Void {
    let procedure = makeProcedure()
    JsonIO.writeProcedure(procedure: procedure)
    let procedureRead = JsonIO.readProcedure()
    XCTAssert(procedure.getProcLocation() == procedureRead.getProcLocation())
  }
}


