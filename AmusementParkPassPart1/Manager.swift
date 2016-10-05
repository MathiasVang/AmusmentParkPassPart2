//
//  HourlyEmployeeFood.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

class Manager: Employee {
    var dayOfBirth: Date?
    var type: EntranceType
    
    var firstName: String
    var lastName: String
    var address: String
    var city: String
    var state: String
    var zipCode: String
    
    init(dayOfBirth: Date?, type: EntranceType, firstName: String, lastName: String, address: String, city: String, state: String, zipCode: String) {
        self.dayOfBirth = dayOfBirth
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}
