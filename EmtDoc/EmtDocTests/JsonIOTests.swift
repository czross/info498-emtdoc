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
  /*
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
 */
    /*
    public func testReadWritePerson() -> Void {
      let person = makePerson()
      JsonIO.writePerson(person: person)
      let personRead = JsonIO.readPerson()
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
  */
  
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
    
    private func makeVital() -> VitalSigns{
        let vital = VitalSigns()
        vital.bloodPrs = ["Systolic" : 12, "Diastolic" : 10]
        vital.heartRate = 34
        vital.rhythm = "Normal"
        vital.respRate = 48
        vital.o2Saturation = 77.4
        vital.endTidalCO2 = 23.9
        vital.temp = 34.2
        vital.pain = 8
        vital.setGlascow(eye: 3, verbal: 5, motor: 1)
        return vital
    }
    public func testVitalReadWrite(){
        let vital = makeVital()
        JsonIO.writeVital(vital: vital)
        let vitalRead = JsonIO.readVital()
        for (key, value) in vitalRead.bloodPrs{
            XCTAssert(vitalRead.bloodPrs[key] == vital.bloodPrs[key])
        }
        XCTAssert(vitalRead.heartRate == vital.heartRate)
        XCTAssert(vitalRead.rhythm == vital.rhythm)
        XCTAssert(vitalRead.respRate == vital.respRate)
        XCTAssert(vitalRead.o2Saturation == vital.o2Saturation)
        XCTAssert(vitalRead.endTidalCO2 == vital.endTidalCO2)
        XCTAssert(vitalRead.temp == vital.temp)
        XCTAssert(vitalRead.pain == vital.pain)
        XCTAssert(vitalRead.glascowTtl == vital.glascowTtl)
        XCTAssert((vitalRead.glascow["Eye"] != nil))
        XCTAssert(vitalRead.glascow["Eye"] == vital.glascow["Eye"])
        XCTAssert(vitalRead.glascow["Verbal"] == vital.glascow["Verbal"])
        XCTAssert(vitalRead.glascow["Motor"] == vital.glascow["Motor"])
    }
    
    
}
