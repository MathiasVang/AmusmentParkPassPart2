//
//  EntranceTower.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

// MARK: Entrance Tower

final class EntranceTower {
    
    enum AreaAccess {
        case amusementAreas
        case kitchenAreas
        case rideControlAreas
        case maintenanceAreas
        case officeAreas
        
        static func areaAccess(entrant: Entrant) -> [AreaAccess] {
            switch entrant.type {
            case is GuestType:
                return [.amusementAreas]
                
            case is EmployeeType:
                let employee = entrant.type as! EmployeeType
                switch employee {
                case .hourlyEmployeeFood:
                    return [.amusementAreas, .kitchenAreas]
                case .hourlyEmployeeRide:
                    return [.amusementAreas, .rideControlAreas]
                case .hourlyEmployeeMaintenance:
                    return [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas]
                case .manager:
                    return [.amusementAreas, .kitchenAreas, .rideControlAreas, .maintenanceAreas, .officeAreas]
                case .contractEmployee:
                    return [.amusementAreas, .kitchenAreas]
                }
            case is VendorType:
                return [.amusementAreas, .kitchenAreas]
            default:
                return [.amusementAreas]
            }
        }
    }
    
    enum RideAccess {
        case allRides
        case skipLine
        
        static func rideAccess(entrant: Entrant) -> [RideAccess] {
            switch entrant.type {
            case is GuestType:
                let guest = entrant.type as! GuestType
                switch guest {
                case .vipGuest:
                    return [.allRides, .skipLine]
                     case .seasonPassGuest:
                     return [.allRides, .skipLine]
                     case .seniorGuest:
                     return [.allRides, .skipLine]
                default:
                    return [.allRides]
                }
            default:
                return [.allRides]
            }
        }
    }
    
    enum DiscountAccess {
        case foodDiscount10
        case foodDiscount15
        case foodDiscount25
        case merchDiscount10
        case merchDiscount20
        case merchDiscount25
        
        static func discountAccess(entrant: Entrant) -> [DiscountAccess]? {
            switch entrant.type {
            case is GuestType:
                let guest = entrant.type as! GuestType
                switch guest {
                case .vipGuest:
                    return [.foodDiscount10, .merchDiscount20]
                default:
                    return nil
                }
            case is EmployeeType:
                let employee = entrant.type as! EmployeeType
                switch employee {
                case .hourlyEmployeeFood:
                    return [.foodDiscount15, .merchDiscount25]
                case .hourlyEmployeeRide:
                    return [.foodDiscount15, .merchDiscount25]
                case .hourlyEmployeeMaintenance:
                    return [.foodDiscount15, .merchDiscount25]
                case .manager:
                    return [.foodDiscount25, .merchDiscount25]
                default:
                    return nil
                }
            default:
                return nil
            }
        }
    }
    
    func createPass(entrant: Entrant) -> Pass {
        
        let areaAccess = AreaAccess.areaAccess(entrant: entrant)
        let rideAccess = RideAccess.rideAccess(entrant: entrant)
        let discountAccess = DiscountAccess.discountAccess(entrant: entrant)
        return Pass(areaAccess: areaAccess, rideAccess: rideAccess, discountAccess: discountAccess)
    }
}
