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
  }
}
