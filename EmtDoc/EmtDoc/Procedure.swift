//
//  Procedure.swift
//  EmtDoc
//
//  Created by Brian Ross on 11/29/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

class Procedure {
    let medChoices: [String] = [
        "Epinephrine",
        "Bircarb",
        "Insulin",
        "Amiodarone"
    ]
    
    let procedureChoices: [String] = [
        "IV",
        "Backboard",
        "Neck Collar",
        "Bag-mask Ventilation",
        "Intubation",
        "CPR",
        "Defibrillation",
        "Chest Tube",
        "Central Line",
        "Compression Bandage",
        "Splint"
    ]
    
    let splintLocation : [String] = [
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right leg",
    ]
    
    var bandageLocation : [String]
    var proceduresDone: [String]?
    var procedureLocation: [String]?
    
    init() {
        self.bandageLocation = self.splintLocation + [
            "Head",
            "Neck",
            "Upper Front Torso",
            "Upper Back Torso",
            "Lower Front Torse",
            "Lower Back Torso"
            ]
        self.proceduresDone = []
        self.procedureLocation = []
    }
    
    func done(procedure: String, location : String ) {
        self.proceduresDone?.append(procedure)
        self.procedureLocation?.append(location)
    }
    
    func getInput() -> ([String], [String]) {
        return (self.proceduresDone!, self.procedureLocation!)
    }
    
    func getMeds() -> [String]{
        return self.medChoices
    }
    
    func getProcedures() -> [String] {
        return self.procedureChoices
    }
    
    func getProcLocation() -> [String] {
        return self.procedureLocation!
    }
    
    func getBandageLocation() -> [String] {
        return self.bandageLocation
    }

}




