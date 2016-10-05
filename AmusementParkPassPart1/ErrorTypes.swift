//
//  ErrorTypes.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation

enum Errors: Error {
    case missingFirstName
    case missingLastName
    case missingAddress
    case missingCity
    case missingState
    case missingZipCode
    case missingDayOfBirth
    case noDiscount
    case noValidDate
    case missingDateOfVisit
    case wrongDateFormat
}
