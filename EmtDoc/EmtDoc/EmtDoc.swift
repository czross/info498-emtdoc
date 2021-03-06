//
//  EmtDoc.swift
//  EmtDoc
//
//  Created by Brian Ross on 12/6/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

class EmtDoc {
    var incident: Incident = Incident()
    var chiefComplaint : String = ""
    var person: PersonID = PersonID()
    var exam: Exam = Exam()
    var procedures: Procedure = Procedure()
    var vitals: VitalSigns = VitalSigns()
    var selectedHospital: [String:String]?
    
    func clear() {
        self.incident = Incident()
        self.chiefComplaint = ""
        self.person = PersonID()
        self.exam = Exam()
        self.procedures = Procedure()
        self.vitals = VitalSigns()
        self.selectedHospital = nil
    }
    
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
