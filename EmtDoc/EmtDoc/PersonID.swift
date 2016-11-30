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
    public var dob : Date?
    public var age: Int = -1
    public var weight : Double = 0.0
    public var race : String = ""
    public var advanced : String = ""
    
    public var address : String = ""
    public var city : String = ""
    public var state : String = ""
    public var zip : String = ""
    public var telephone : String = ""
    public var physician : String = ""
    
    public var medications = Set<String>()
    public var allergies = Set<String>()
    
    
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
    
    func set(dobMonth : Int, dobDay : Int, dobYear : Int) {
        
        // Initialize Date components
        let components = NSDateComponents()
        components.month = dobMonth
        components.day = dobDay
        components.year = dobYear
        
        // Get NSDate given the above date components
        let date = NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: components as DateComponents)
        
        self.dob = date!
    }
}


