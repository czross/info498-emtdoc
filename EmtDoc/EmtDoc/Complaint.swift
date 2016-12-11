//
//  Complaint.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

public class {
    let areaChoice: [String] = [
        "Head",
        "Neck",
        "Upper Back",
        "Upper Chest",
        "Lower Back",
        "Lower Chest",
        "Right Leg",
        "Left Leg",
        "Right Arm",
        "Left Arm"
    ]
    let intensityChoice: [Int] = [1...10]
    var descritption: String
    var signsSymptoms: String
    var bodyArea: String
    var duration: String
    var intensity: Int
    
    init() {
        self.description = ""
    }
    
}
