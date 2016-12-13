//
//  Exam.swift
//  EmtDoc
//
//  Created by Brian Ross on 11/29/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation

public class Exam {
  
  public var mentalStatus: String
  public var skin: String
  public var facial: [String: String]
  public var chest: [String: String]
  public var abdomen: String
  public var back: String
  public var pelvic: String
  public var extremities: [String: String]
  public var neuro: String
  
  
  public var mentalStatusChoices: [String]
  public var skinChoices: [String]
  public var facialChoices: [String: [String]]
  public var chestChoices: [String: [String]]
  public var abdomenChoices: [String]
  public var backChoices: [String]
  public var pelvicChoices: [String]
  public var extremityChoices: [String: [String]]
  public var neuroChoices: [String]

  public init() {
    mentalStatus = "Unspecified"
    
    skin = "Unspecified"
    
    facial = [String: String]()
    facial["pupils"] = "Unspecified"
    facial["throat"] = "Unspecified"
    facial["head"] = "Unspecified"
    facial["ears"] = "Unspecified"
    facial["nose"] = "Unspecified"
    
    chest = [String: String]()
    chest["heartSounds"] = "Unspecified"
    chest["lungs"] = "Unspecified"
    
    back = "Unspecified"
    
    abdomen = "Unspecified"
    
    pelvic = "Unspecified"
    
    neuro = "Unspecified"
    
    extremities = [String: String]()
    extremities["leftUpper"] = "Unspecified"
    extremities["leftLower"] = "Unspecified"
    extremities["righttUpper"] = "Unspecified"
    extremities["rightLower"] = "Unspecified"
    
    mentalStatusChoices = ["Alert", "Oriented", "Unintelligible", "Unresponsive"]
    
    skinChoices = ["Normal", "Pale", "Mottled"]
    facialChoices = [String: [String]]()
    facialChoices["pupils"] = ["Equal", "Unequal", "Responsive", "Fixed", "Dilated"]
    facialChoices["ears"] = ["No Blood", "Blood", "Clear Fluid"]
    facialChoices["nose"] = ["No Blood", "Blood", "Clear Fluid"]
    facialChoices["throat"] = ["Normal", "Injury"]
    facialChoices["head"] = ["No sign of injury", "Injury"]
    
    chestChoices = [String: [String]]()
    chestChoices["lungs"] = ["Bilateral Breath Sounds", "L unclear", "R unclear", "Both unclear"]
    chestChoices["heartSounds"] = ["Normal", "Murmur"]
    
    abdomenChoices = ["Vomiting", "Normal", "Left upper quadrant – normal",
                      "Right upper quadrant – normal", "Left lower quadrant – normal",
                      "Right lower quadrant – normal"]

    backChoices = ["Cervical", "Thoracic", "Lumbar"]
    
    extremityChoices = [String: [String]]()
    extremityChoices["leftUpper"] = ["Normal", "Not Normal"]
    extremityChoices["rightUpper"] = ["Normal", "Not Normal"]
    extremityChoices["leftLower"] = ["Normal", "Not Normal"]
    extremityChoices["rightLower"] = ["Normal", "Not Normal"]
    
    pelvicChoices = ["Stable", "Unstable"]
    
    neuroChoices = ["Intact", "Seizures"]
  }
}
