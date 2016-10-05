//
//  DataTypes.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

// MARK: Pass struct

struct Pass {
    let areaAccess: [EntranceTower.AreaAccess]
    let rideAccess: [EntranceTower.RideAccess]
    let discountAccess: [EntranceTower.DiscountAccess]?
}

// MARK: Entrant Type

enum GuestType: EntranceType {
    case classicGuest
    case vipGuest
    case childGuest
    case seasonPassGuest
    case seniorGuest
}

enum EmployeeType: EntranceType {
    case hourlyEmployeeFood
    case hourlyEmployeeRide
    case hourlyEmployeeMaintenance
    case manager
    case contractEmployee
}

enum VendorType: EntranceType {
    case vendor
}

