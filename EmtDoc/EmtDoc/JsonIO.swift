//
//  writeData.swift
//  EmtDoc
//
//  Created by YiHanzhen on 12/8/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation
import SwiftyJSON

public class JsonIO {
  public static func writeJson(person: PersonID) -> Void {
    let data = ["fname": "fname",
                "lname": "lname",
                "middleInitial": "middleInitial",
                "gender": "gender",
                "dob": "dob",
                "age": "age",
                "weight": "weight",
                "race": "race",
                "advanced": "advanced",
                "address": "address",
                "telephone": "telephone",
                "physician": "physician",
                "medications": ["medications"],
                "city": "city",
                "state": "state",
                "zip": "zip",
                "allergies": ["allergies"]] as [String : Any]
    var json = JSON(data)

    json["fname"].string = person.fName
    json["lname"].string = person.lName
    json["middleInitial"].string = person.middleInitial
    json["gender"].string = person.gender
    json["dob"].string = person.dob
    json["age"].intValue = person.age
    json["weight"].intValue = person.weight
    json["race"].string = person.race
    json["advanced"].string = person.advanced
    json["address"].string = person.address
    json["city"].string = person.city
    json["state"].string = person.state
    json["zip"].string = person.zip
    json["telephone"].string = person.telephone
    json["physician"].string = person.physician
    json["medications"].string = person.medications
    json["allergies"].string = person.allergies
    
    if let jsonString = json.rawString() {
      do {
        let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirectoryURL.appendingPathComponent("person.json")
        do {
          try jsonString.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
        }
        catch {}
      
      }
      catch {}
    }
  }
  
  public static func readJson() -> PersonID {
    let person = PersonID()
    do {
      let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      let fileURL = documentDirectoryURL.appendingPathComponent("person.json")
      do {
        let jsonData = try Data(contentsOf: fileURL)
        let json = JSON(data: jsonData)
        print(jsonData)
        person.set(age: json["age"].intValue)
        person.set(fName: json["fname"].string!)
        person.set(lName: json["lname"].string!)
        person.set(middleInitial: json["middleInitial"].string!)
        let dob = json["dob"].string!
        let dobArray = dob.components(separatedBy: "/")
        person.set(dob: json["dob"].string!)
        person.set(advanced: json["advanced"].string!)
        person.set(race: json["race"].string!)
        person.set(gender: json["gender"].string!)
        person.set(age: json["age"].intValue)
        person.set(address: json["address"].string!)
        person.set(city: json["city"].string!)
        person.set(state: json["state"].string!)
        person.set(zip: json["zip"].string!)
        person.set(telephone: json["telephone"].string!)
        person.set(physician: json["physician"].string!)
        person.set(medications: json["medications"].string!)
        person.set(allergies: json["allergies"].string!)
      }
    }
    catch {}
    return person
  }
}


