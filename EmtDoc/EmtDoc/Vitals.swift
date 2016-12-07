//
//  Vitals.swift
//  EmtDoc
//
//  Created by Brian Ross on 11/29/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation


public class VitalSigns {
    public var weight : Double = -1.0
    public var bloodPrs : [String: Int] = ["Systolic" : -1, "Diastolic" : -1]
    public var heartRate : Int = -1
    public var rhythm = "Unspecified"
    public var respRate : Int = -1
    public var o2Saturation : Double = -1.0
    public var endTidalCO2 : Double = -1.0
    public var temp : Double = -1.0
    public var pain : Int = -1
    
    public var glascow : [String: Int] = ["Eye (E)" : -1, "Verbal (V)" : -1, "Motor (M)" : -1]
    public var glascowTtl: Int = 0
    
    //Choices for rhythm
    let rhythmChoices = ["Normal", "Irregular"]
    
    //Description for Glascow shown in TableView
    let glascowKeyWords = ["Eye (E)", "Verbal (V)", "Motor (M)"]
    let eyeChoices = [4 : "spontaneous- open with blinking",
                      3 : "opens to verbal command, speech, or shout",
                      2 : "opens to pain, not applied to face",
                      1 : "none"]
    let verbalChoices = [5 : "Oriented",
                        4 : "Confused conversation, but able to answer questions",
                        3 : "Inappropriate responses, words discernible",
                        2 : "Incomplete ensible speech",
                        1 : "None"]
    let motorChoices = [6 : "Obeys commands for movement",
                        5 : "Purposeful movements to painful stimulus",
                        4 : "Withdraws from pain",
                        3 : "Abnormal (spastic) flexion, decorticate posture",
                        2 : "Extensor (rigid) response, decerebrate posture",
                        1 : "None"]
    
    public init() {
        glascowTtl = glascow["Eye (E)"]! + glascow["Verbal (V)"]!
        glascowTtl += glascow["Motor (M)"]!
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
