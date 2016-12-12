//
//  Vitals.swift
//  EmtDoc
//
//  Created by Brian Ross on 11/29/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

public class GlascowDscp {
    public let keyWords = ["Eye (E)", "Verbal (V)", "Motor (M)"]
    public let eyeDscp = [4 : "spontaneous- open with blinking",
                   3 : "opens to verbal command, speech, or shout",
                   2 : "opens to pain, not applied to face",
                   1 : "none"]
    public let verbalDscp = [5 : "Oriented",
                      4 : "Confused conversation, but able to answer questions",
                      3 : "Inappropriate responses, words discernible",
                      2 : "Incomplete ensible speech",
                      1 : "None"]
    public let motorDscp = [6 : "Obeys commands for movement",
                 5 : "Purposeful movements to painful stimulus",
                 4 : "Withdraws from pain",
                 3 : "Abnormal (spastic) flexion, decorticate posture",
                 2 : "Extensor (rigid) response, decerebrate posture",
                 1 : "None"]
}


public class VitalSigns {
    public var bloodPrs : [String: Int] = ["Systolic" : -1, "Diastolic" : -1]
    public var heartRate : Int = -1
    public var rhythm = "Unspecified"
    public var respRate : Int = -1
    public var o2Saturation : Double = -1.0
    public var endTidalCO2 : Double = -1.0
    public var temp : Double = -1.0
    public var pain : Int = -1
    
    public var glascow : [String: Int] = ["Eye" : -1, "Verbal" : -1, "Motor" : -1]
    public var glascowTtl: Int = 0
    
    let painDscp = "1-10"
    //Choices for rhythm
    let rhythmChoices = ["Normal", "Irregular"]
    
    //Description for Glascow shown in TableView
    public let glascowDscp = GlascowDscp()
    public let glascowKeyWords : [String]
    public let eyeChoices : [Int: String]
    public let verbalChoices : [Int: String]
    public let motorChoices : [Int: String]
    
    public init() {
        glascowTtl = glascow["Eye"]! + glascow["Verbal"]!
        glascowTtl += glascow["Motor"]!
        glascowKeyWords = glascowDscp.keyWords
        eyeChoices = glascowDscp.eyeDscp
        verbalChoices = glascowDscp.verbalDscp
        motorChoices = glascowDscp.motorDscp
    }
    
    func setGlascow(eye: Int, verbal: Int, motor: Int) {
        glascow["Eye"] = eye
        glascow["Verbal"] = verbal
        glascow["Motor"] = motor
        glascowTtl = glascow["Eye"]! + glascow["Verbal"]!
        glascowTtl += glascow["Motor"]!
    }
    func getGlascow() -> [String: Int] {
        return self.glascow
    }
    
    func getPainDscp() -> String {
        return self.painDscp
    }
    func getRhythmChoices() -> [String] {
        return self.rhythmChoices
    }
    func getGlascowKeyWords() -> [String] {
        return self.glascowKeyWords
    }
    func getEyeChoices() -> [Int : String] {
        return self.eyeChoices
    }
    func getVerbalChoices() -> [Int: String]{
        return self.verbalChoices
    }
    func getMotorChoices() -> [Int: String] {
        return self.motorChoices
    }
    
}
