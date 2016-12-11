//
//  PersonID.swift
//  EmtDoc
//
//  Created by Brian Ross on 11/29/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

extension String {
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}

public class PersonID {
    public var fName : String = ""
    public var lName : String = ""
    public var middleInitial : String = ""
    
    // TODO: Enumerate Gender
    public var gender : String = ""
    
    // TODO: Date class for dob
    public var dob : String = ""
    public var age: Int = -1
    public var weight : Int = 0
    public var race : String = ""
    public var advanced : String = ""
    
    public var address : String = ""
    public var city : String = ""
    public var state : String = ""
    public var zip : String = ""
    public var telephone : String = ""
    public var physician : String = ""
    
    public var medications = ""
    public var allergies = ""
    
    
    public init () {
        
    }
    
    func set(fName : String) {
        self.fName = fName.trim()
    }
    
    func set(lName : String) {
        self.lName = lName.trim()
    }
    
    func set(middleInitial : String) {
        var newMiddleInitial = middleInitial
        newMiddleInitial = newMiddleInitial.trim()
        if let letter = newMiddleInitial.characters.first {
            self.middleInitial = String(letter)
        } else {
            self.middleInitial = ""
        }
    }
    
    func set(gender : String) {
        self.gender = gender
    }
    
    func set(dob : String) {
        self.dob = dob
    }
    
    func set(age : Int) {
        self.age = age
    }
    
    func set(weight : Int) {
        self.weight = weight
    }
    
    func set(race : String) {
        self.race = race.trim()
    }
    
    func set(advanced : String) {
        self.advanced = advanced.trim()
    }
    
    func set(address : String ) {
        self.address = address.trim()
    }
    
    func set(city: String) {
        self.city = city.trim()
    }
    
    func set(state : String) {
        self.state = state.trim()
    }
    
    func set(zip : String) {
        self.zip = zip.trim()
    }
    
    func set(telephone : String) {
        self.telephone = telephone.trim()
    }
    
    func set(physician : String) {
        self.physician = physician.trim()
    }
    
    func set(medications : String) {
        self.medications = medications
    }
    
    func set(allergies : String) {
        self.allergies = allergies
    }
}




