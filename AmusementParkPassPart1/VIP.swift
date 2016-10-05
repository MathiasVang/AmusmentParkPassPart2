//
//  Classic.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

class VIPGuest: Guest {
    var dayOfBirth: Date?
    var type: EntranceType
    
    init(dayOfBirth: Date?, type: EntranceType) {
        self.dayOfBirth = dayOfBirth
        self.type = type
    }
}
