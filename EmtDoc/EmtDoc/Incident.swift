//
//  Incident.swift
//  EmtDoc
//
//  Created by studentuser on 12/12/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class Incident {
    public var dateTime: Date?
    public var latitude: Float?
    public var longitude: Float?
    
    init() {
    }
    
    init(latitude: Float, longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func set(latitude: Float, longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func set(dateTime: Date) {
        self.dateTime = dateTime
    }
}
