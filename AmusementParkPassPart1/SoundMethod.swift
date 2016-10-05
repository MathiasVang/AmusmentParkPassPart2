//
//  SoundMethod.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 22/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import Foundation
import AudioToolbox

var accessGrantedSound: SystemSoundID = 0

func loadAccessGrantedSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &accessGrantedSound)
}

func playAccessGrantedSound() {
    AudioServicesPlaySystemSound(accessGrantedSound)
}

var accessDeniedSound: SystemSoundID = 0

func loadAccessDeniedSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
    let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL, &accessDeniedSound)
}

func playAccessDeniedSound() {
    AudioServicesPlaySystemSound(accessDeniedSound)
}
