//
//  Protocols.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

// MARK: Protocols

protocol EntranceType {}

protocol EntryPass {
    func generatePass() -> Pass
    
    func swipeArea(area: EntranceTower.AreaAccess) -> (Bool, String)
    func swipeRides(area: EntranceTower.RideAccess) -> (Bool, String)
    func swipeDiscount(area: EntranceTower.DiscountAccess) -> (Bool, String)
}

protocol Entrant: EntryPass {
    var dayOfBirth: Date? { get }
    var type: EntranceType { get }
}

protocol Guest: Entrant {
}

protocol Employee: Entrant {
    var firstName: String { get }
    var lastName: String { get }
    var address: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: String { get }
}

// MARK: Extensions

extension Entrant {
    func generatePass() -> Pass {
        return EntranceTower().createPass(entrant: self)
    }
}

extension Entrant {
    
    func swipeArea(area: EntranceTower.AreaAccess) -> (Bool, String) {
        return AccessModel().swipeArea(area: area, entrant: self)
    }
    
    func swipeRides(area: EntranceTower.RideAccess) -> (Bool, String) {
        return AccessModel().swipeRides(area: area, entrant: self)
    }
    
    func swipeDiscount(area: EntranceTower.DiscountAccess) -> (Bool, String) {
        return AccessModel().swipeDiscount(area: area, entrant: self)
    }
}
