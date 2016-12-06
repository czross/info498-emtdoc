//
//  Vitals.swift
//  EmtDoc
//
//  Created by Brian Ross on 11/29/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

enum Rhythm {
    case Normal
    case Irregular
}

//Description for Glascow shown in TableView
public class GlascowDscp {
    let keyWords = ["Eye (E)", "Verbal (V)", "Motor (M)"]
    let eyeDscp = [4 : "spontaneous- open with blinking",
                   3 : "opens to verbal command, speech, or shout",
                   2 : "opens to pain, not applied to face",
                   1 : "none"]
    let verbalDscp = [5 : "Oriented",
                      4 : "Confused conversation, but able to answer questions",
                      3 : "Inappropriate responses, words discernible",
                      2 : "Incomplete ensible speech",
                      1 : "None"]
    let motor = [6 : "Obeys commands for movement",
                 5 : "Purposeful movements to painful stimulus",
                 4 : "Withdraws from pain",
                 3 : "Abnormal (spastic) flexion, decorticate posture",
                 2 : "Extensor (rigid) response, decerebrate posture",
                 1 : "None"]
}

public class VitalSigns {
    public var weight : Double = -1.0
    public var bloodPrs : [String: Int] = ["Systolic" : -1, "Diastolic" : -1]
    public var heartRate : Int = -1
    //?? right way to use enum
    public var rhythm = Rhythm.Normal
    public var respRate : Int = -1
    public var o2Saturation : Double = -1.0
    public var endTidalCO2 : Double = -1.0
    public var temp : Double = -1.0
    public var pain : Int = -1
    
    public var glascow : [String: Int] = ["Eye (E)" : -1, "Verbal (V)" : -1, "Motor (M)" : -1]
    public var glascowTtl: Int = self.glascow["Eye (E)"] + self.glascow["Verbal (V)"] + self.glascow[ "Motor (M)"]
    
}
