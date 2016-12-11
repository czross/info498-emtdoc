//
//  Complaint.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

public class Complaint {
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
    let intensityChoice: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var descritption: String
    var signsSymptoms: String
    var bodyArea: String
    var duration: String
    var intensity: Int
    
    init() {
        self.descritption = ""
        self.signsSymptoms = ""
        self.bodyArea = ""
        self.duration = ""
        self.intensity = 0
    }
    
}
