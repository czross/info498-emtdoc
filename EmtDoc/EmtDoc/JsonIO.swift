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
    let data = ["fname", "lName", "middleInitial", "gender", "dob",
            "age", "weight", "race", "advanced", "address",
            "telephone", "physician", "medications", "allergies"]
    var json = JSON(data)
    json["fname"] = JSON(person.fName)
    json["lname"] = JSON(person.lName)
    json["middleInitial"] = JSON(person.middleInitial)
    json["gender"] = JSON(person.gender)
    json["dob"] = JSON(person.dob!)
    json["age"] = JSON(person.age)
    json["weight"] = JSON(person.weight)
    json["race"] = JSON(person.race)
    json["advanced"] = JSON(person.advanced)
    json["address"] = JSON(person.address)
    json["telephone"] = JSON(person.telephone)
    json["physician"] = JSON(person.physician)
    json["medications"] = JSON(person.medications)
    json["allergies"] = JSON(person.allergies)
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
        let jsonString = try String(contentsOf: fileURL)
        let json = JSON(jsonString)
        person.set(age: json["age"].intValue)
        person.set(fName: json["fname"].string!)
        person.set(lName: json["fName"].string!)
        person.set(middleInitial: json["middleInitial"].string!)
        person.set(gender: json["gender"].string!)
        person.set(age: json["age"].intValue)
        person.set(address: json["address"].string!)
        person.set(telephone: json["telephone"].string!)
        person.set(physician: json["physician"].string!)
        let medications = json["medications"].arrayValue.map({$0["medications"].stringValue})
        for medication in medications {
          person.add(medication: medication)
        }
        let allergies = json["allergies"].arrayValue.map({$0["allergies"].stringValue})
        for allergy in allergies {
          person.add(allergy: allergy)
        }
      }
    }
    catch {}
    return person
  }
}


