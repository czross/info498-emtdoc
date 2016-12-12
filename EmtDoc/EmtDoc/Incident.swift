//
//  Incident.swift
//  EmtDoc
//
//  Created by studentuser on 12/12/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit
import CoreLocation

class Incident {
    public var dateTime: Date?
    public var coordinates: CLLocationCoordinate2D?
    
    init() {
    }
    
    func set(coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
    }
    
    func getLatitude() -> CLLocationDegrees {
        return (self.coordinates?.latitude)!
    }
    
    func getLongitude() -> CLLocationDegrees {
        return (self.coordinates?.longitude)!
    }
    
    func set(dateTime: Date) {
        self.dateTime = dateTime
    }
}
