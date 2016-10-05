//
//  Vendor.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 28/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

class Vendor: Entrant {
    var dayOfBirth: Date?
    var type: EntranceType
    var firstName: String
    var lastName: String
    var dayOfVisit: Date
    
    init(dayOfBirth: Date, type: EntranceType, firstName: String, lastName: String, dayOfVisit: Date) {
        self.dayOfBirth = dayOfBirth
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.dayOfVisit = dayOfVisit
    }
}
