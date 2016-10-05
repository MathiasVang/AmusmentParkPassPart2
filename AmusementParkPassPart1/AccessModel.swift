//
//  Access.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

// MARK: Swipe Methods

final class AccessModel {

    let trueAnswer = "Access Granted"
    let falseAnswer = "Access Denied"
    
    public var timer = Timer()
    public var count = 0.0
    
    func avoidConsecutiveSwipes() -> Bool {
        
        if count == 0.0 {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(addTime), userInfo: nil, repeats: true)
            return true
        } else if count < 10.0 {
            return false
        } else if count >= 10.0 {
            count = 0.0
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(addTime), userInfo: nil, repeats: true)
            return true
        }
        
        return false
    }
    
    @objc func addTime() {
        count += 0.1
    }
    
    func swipeArea(area: EntranceTower.AreaAccess, entrant: Entrant) -> (Bool, String) {
        
        let preventDouble = avoidConsecutiveSwipes()
        if preventDouble == false {
            playAccessDeniedSound()
            return (false, "Wait 10 seconds please")
        }
        
        let entrant = entrant.generatePass()
        
        switch area {
        case .amusementAreas:
            let area = EntranceTower.AreaAccess.amusementAreas
            
            if entrant.areaAccess.contains(area) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
            
        case .kitchenAreas:
            let area = EntranceTower.AreaAccess.kitchenAreas
            
            if entrant.areaAccess.contains(area) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
            
        case .maintenanceAreas:
            let area = EntranceTower.AreaAccess.maintenanceAreas
            
            if entrant.areaAccess.contains(area) {
                playAccessGrantedSound()
                return(true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
            
        case .officeAreas:
            let area = EntranceTower.AreaAccess.officeAreas
            
            if entrant.areaAccess.contains(area) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
            
        case .rideControlAreas:
            let area = EntranceTower.AreaAccess.rideControlAreas
            
            if entrant.areaAccess.contains(area) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        }
    }
    
    func swipeRides(area: EntranceTower.RideAccess, entrant: Entrant) -> (Bool, String) {
        
        let preventDouble = avoidConsecutiveSwipes()
        if preventDouble == false {
            playAccessDeniedSound()
            return (false, "Wait 10 seconds please")
        }
        
        let entrant = entrant.generatePass()
        
        switch area {
        case .allRides:
            let ride = EntranceTower.RideAccess.allRides
            
            if entrant.rideAccess.contains(ride) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
            
            
        case .skipLine:
            let ride = EntranceTower.RideAccess.skipLine
            
            if entrant.rideAccess.contains(ride) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        }
    }
    
    func swipeDiscount(area: EntranceTower.DiscountAccess, entrant: Entrant) -> (Bool, String) {
        
        let preventDouble = avoidConsecutiveSwipes()
        if preventDouble == false {
            playAccessDeniedSound()
            return (false, "Wait 10 seconds please")
        }
        
        let entrant = entrant.generatePass()
        
        guard let entrantDiscount = entrant.discountAccess else {
            return (false, falseAnswer)
        }
        
        switch area {
        case .foodDiscount10:
            let discount = EntranceTower.DiscountAccess.foodDiscount10
            
            if entrantDiscount.contains(discount) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        case .foodDiscount15:
            let discount = EntranceTower.DiscountAccess.foodDiscount15
            
            if entrantDiscount.contains(discount) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        case .foodDiscount25:
            let discount = EntranceTower.DiscountAccess.foodDiscount25
            
            if entrantDiscount.contains(discount) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        case .merchDiscount10:
            let discount = EntranceTower.DiscountAccess.merchDiscount10
            
            if entrantDiscount.contains(discount) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        case .merchDiscount20:
            let discount = EntranceTower.DiscountAccess.merchDiscount20
            
            if entrantDiscount.contains(discount) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        case .merchDiscount25:
            let discount = EntranceTower.DiscountAccess.merchDiscount25
            
            if entrantDiscount.contains(discount) {
                playAccessGrantedSound()
                return (true, trueAnswer)
            } else {
                playAccessDeniedSound()
                return (false, falseAnswer)
            }
        }
    }
}
