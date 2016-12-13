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
  public static func writePerson(person: PersonID) -> Void {
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
  
  public static func readPerson() -> PersonID {
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
  
  public static func writeExam(exam: Exam) -> Void {
    let data = ["mentalStatus": "mentalStatus",
                "pupils": "pupils",
                "ears": "ears",
                "throat": "throat",
                "nose": "nose",
                "head": "head",
                "heartSounds": "heartSound",
                "lungs": "lungs",
                "neuro": "neuro",
                "extremityLU": "extremityLU",
                "extremityRU": "extremityRU",
                "extremityLL": "extremityLL",
                "extremityRL": "extremityRL",
                "abdomen": "abdomen",
                "pelvic": "pelvic",
                "back": "back"
                ] as [String : Any]
    
    var json = JSON(data)
    json["mentalStatus"].string = exam.mentalStatus
    json["skin"].string = exam.skin
    json["pupils"].string = exam.facial["pupils"]
    json["ears"].string = exam.facial["ears"]
    json["nose"].string = exam.facial["nose"]
    json["throat"].string = exam.facial["throat"]
    json["head"].string = exam.facial["head"]
    json["heartSounds"].string = exam.chest["heartSounds"]
    json["lungs"].string = exam.chest["lungs"]
    json["neuro"].string = exam.neuro
    json["pelvic"].string = exam.pelvic
    json["abdomen"].string = exam.abdomen
    json["extremityLU"].string = exam.extremities["leftUpper"]
    json["extremityRU"].string = exam.extremities["rightUpper"]
    json["extremityLL"].string = exam.extremities["leftLower"]
    json["extremityRL"].string = exam.extremities["rightLower"]
    json["back"].string = exam.back
    json["abdomen"].string = exam.abdomen
    if let jsonString = json.rawString() {
      do {
        let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirectoryURL.appendingPathComponent("exam.json")
        do {
          try jsonString.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
        }
        catch {}
        
      }
      catch {}
    }
  }
  
  public static func readExam() -> Exam {
    let exam = Exam()
    do {
      let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      let fileURL = documentDirectoryURL.appendingPathComponent("exam.json")
      do {
        let jsonData = try Data(contentsOf: fileURL)
        let json = JSON(data: jsonData)
        exam.abdomen = json["abdomen"].string!
        exam.back = json["back"].string!
        exam.chest["heartSounds"] = json["heartSounds"].string!
        exam.chest["lungs"] = json["lungs"].string!
        exam.facial["pupils"] = json["pupils"].string!
        exam.facial["ears"] = json["ears"].string!
        exam.facial["nose"] = json["nose"].string!
        exam.facial["head"] = json["head"].string!
        exam.facial["throat"] = json["throat"].string!
        exam.extremities["leftLower"] = json["extremityLL"].string!
        exam.extremities["leftUpper"] = json["extremityLU"].string!
        exam.extremities["rightLower"] = json["extremityRL"].string!
        exam.extremities["rightUpper"] = json["extremityRU"].string!
        exam.skin = json["skin"].string!
        exam.pelvic = json["pelvic"].string!
        exam.neuro = json["neuro"].string!
        exam.mentalStatus = json["mentalStatus"].string!
      }
      catch {}
    }
    catch {}
    return exam
  }
  
  public static func writeProcedure(procedure: Procedure) -> Void {
    let data = ["procedure": "procedure", "location": "location"]
    var json = JSON(data)
    json["procedure"].arrayObject = procedure.getProcedures()
    json["location"].arrayObject = procedure.getProcLocation()
    if let jsonString = json.rawString() {
      do {
        let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fileURL = documentDirectoryURL.appendingPathComponent("procedure.json")
        do {
          try jsonString.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
        }
        catch {}
        
      }
      catch {}
    }
  }
  
  public static func readProcedure() -> Procedure {
    let procedure = Procedure()
    do {
      let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      let fileURL = documentDirectoryURL.appendingPathComponent("procedure.json")
      do {
        let jsonData = try Data(contentsOf: fileURL)
        let json = JSON(data: jsonData)
        let procs = json["procedure"].arrayValue
        let locs = json["location"].arrayValue
        for i in 0...procs.count {
          procedure.done(procedure: procs[i].string!, location: locs[i].string!)
        }
      }
      catch {}
    }
    catch {}
    return procedure
  }
    
    
    public static func writeVital(vital: VitalSigns) -> Void{
        let data = ["bloodPrs": ["bloodPrs": -1],
                    "heartRate": -1,
                    "rhythm": "rhythm",
                    "respRate": -1,
                    "o2Saturation": -1.0,
                    "endTidalCO2": -1.0,
                    "temp": -1.0,
                    "pain": -1,
                    "glascow": ["glascow":-1],
                    "glascowTtl": -1] as [String : Any]
        var json = JSON(data)
        json["bloodPrs"].dictionaryObject = vital.bloodPrs
        json["heartRate"].intValue = vital.heartRate
        json["rhythm"].string = vital.rhythm
        json["respRate"].intValue = vital.respRate
        json["o2Saturation"].doubleValue = vital.o2Saturation
        json["endTidalCO2"].doubleValue = vital.endTidalCO2
        json["temp"].doubleValue = vital.temp
        json["pain"].intValue = vital.pain
        json["glascow"].dictionaryObject = vital.getGlascow()
        json["glascowTtl"].int = vital.getGlascowTtl()
        
        if let jsonString = json.rawString() {
            do {
                let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                let fileURL = documentDirectoryURL.appendingPathComponent("vitalSigns.json")
                do {
                    try jsonString.write(to: fileURL, atomically: false, encoding: String.Encoding.utf8)
                }
                catch {}
                
            }
            catch {}
        }
    }
    
    public static func readVital() -> VitalSigns{
        let vital = VitalSigns()
        do {
            let documentDirectoryURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectoryURL.appendingPathComponent("vitalSigns.json")
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let json = JSON(data: jsonData)
                print (jsonData)
                let bloodprs = json["bloodPrs"].dictionaryValue
                for (key, value) in bloodprs{
                    vital.bloodPrs[key] = value.intValue
                }
                vital.heartRate = json["heartRate"].intValue
                vital.rhythm = json["rhythm"].string!
                vital.respRate = json["respRate"].intValue
                vital.o2Saturation = json["o2Saturation"].doubleValue
                vital.endTidalCO2 = json["endTidalCO2"].doubleValue
                vital.temp = json["temp"].doubleValue
                vital.pain = json["pain"].intValue
                let glascow = json["glascow"].dictionaryValue
                vital.setGlascow(eye: (glascow["Eye"]?.intValue)!)
                vital.setGlascow(motor: (glascow["Motor"]?.intValue)!)
                vital.setGlascow(verbal: (glascow["Verbal"]?.intValue)!)
            }
            catch{}
        }
        catch{}
        return vital
    }
  
}


