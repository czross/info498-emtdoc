//
//  EmtDoc.swift
//  EmtDoc
//
//  Created by Brian Ross on 12/6/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

class EmtDoc {
    var person: PersonID = PersonID()
    let exam: Exam = Exam()
    let procedures: Procedure = Procedure()
    let vitals: VitalSigns = VitalSigns()
    var selectedHospital: [String:String]?
//    let glascow: GlascowDscp = GlascowDscp()
    
    let mainChoices: [String] = [
        "Chief Complaint",
        "Vital Signs",
        "Exam",
        "Procedures/Medications"
    ]
    
    let personChoices: [String] = [
        "First Name",
        "Last Name",
        "Middle Initial",
        "Gender",
        "Date of Birth",
        "Age",
        "Weight (Kg)",
        "Advanced",
        "Address",
        "City",
        "State",
        "Zip",
        "Telephone",
        "Physician",
        "Medications",
        "Allergies"
    ]
    
    let examChoice: [String] = [
        "Mental Status",
        "Skin",
        "Facial",
        "Chest",
        "Abdomen",
        "Back",
        "Pelvis",
        "Extremities",
        "Neuro"
    ]
    
    let vitalChoices: [String] = [
        "Weight",
        "Blood Pressure",
        "Heart Rate",
        "Respiratory Rate",
        "02 Saturation",
        "End Tidal CO2",
        "Temperature",
        "Pain Scale",
        "Glascow"
    ]
    
    let procedureChoice: [String] = [
        "Medications",
        "Procedures",
        "Splints"
    ]
    
    
    init() {
    }
}
