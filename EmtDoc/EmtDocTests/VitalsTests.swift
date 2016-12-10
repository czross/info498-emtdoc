//
//  VitalsTests.swift
//  EmtDoc
//
//  Created by cmfeng on 12/6/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import XCTest
@testable import EmtDoc

class VitalsTests: XCTestCase {
    
    var vitals = VitalSigns()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConstructor() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        vitals = VitalSigns()
        XCTAssert(vitals != nil)
    }
    
    func testSetValuesOtherThanGlascow(){
        vitals.weight = 77
        vitals.bloodPrs = ["Systolic" : 20, "Diastolic" : 10]
        vitals.heartRate = 68
        vitals.rhythm = "Normal"
        vitals.respRate = 55
        vitals.o2Saturation = 11.4
        vitals.endTidalCO2 = 29.3
        vitals.temp = 66.7
        vitals.pain = 8
        vitals.setGlascow(eye: 3, verbal: 2, motor: 5)
        
        XCTAssertEqual(vitals.weight, 77)
        XCTAssertEqual(vitals.bloodPrs["Systolic"], 20)
        XCTAssertEqual(vitals.bloodPrs["Diastolic"], 10)
        XCTAssertEqual(vitals.heartRate, 68)
        XCTAssertEqual(vitals.rhythm, "Normal")
        XCTAssertEqual(vitals.respRate, 55)
        XCTAssertEqual(vitals.o2Saturation, 11.4)
        XCTAssertEqual(vitals.endTidalCO2, 29.3)
        XCTAssertEqual(vitals.getGlascow()["Eye"], 3)
        XCTAssertEqual(vitals.getGlascow()["Verbal"], 2)
        XCTAssertEqual(vitals.getGlascow()["Motor"], 5)
        XCTAssertEqual(vitals.glascowTtl, 10)
        
    }
    
    func testGetChoices(){
        let s1 = vitals.getPainDscp()
        XCTAssertEqual(s1, "1-10")
        
        let s2 = vitals.getRhythmChoices()
        XCTAssertEqual(s2, ["Normal", "Irregular"])
        
        let s3 = vitals.getGlascowKeyWords()
        XCTAssertEqual(s3, ["Eye (E)", "Verbal (V)", "Motor (M)"])
        
        let s4 = vitals.getEyeChoices()
        XCTAssertEqual(s4, [4 : "spontaneous- open with blinking",
                            3 : "opens to verbal command, speech, or shout",
                            2 : "opens to pain, not applied to face",
                            1 : "none"])
        
        let s5 = vitals.getVerbalChoices()
        XCTAssertEqual(s5, [5 : "Oriented",
                            4 : "Confused conversation, but able to answer questions",
                            3 : "Inappropriate responses, words discernible",
                            2 : "Incomplete ensible speech",
                            1 : "None"])
        
        let s6 = vitals.getMotorChoices()
        XCTAssertEqual(s6, [6 : "Obeys commands for movement",
                            5 : "Purposeful movements to painful stimulus",
                            4 : "Withdraws from pain",
                            3 : "Abnormal (spastic) flexion, decorticate posture",
                            2 : "Extensor (rigid) response, decerebrate posture",
                            1 : "None"])
        XCTAssertEqual(s6[4], "Withdraws from pain")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
