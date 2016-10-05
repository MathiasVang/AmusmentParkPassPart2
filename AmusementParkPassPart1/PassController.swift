//
//  PassController.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 03/10/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import UIKit

class PassController: UIViewController {
    
    @IBOutlet weak var guestName: UILabel!
    @IBOutlet weak var entrantType: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var areaAccessButton: UIButton!
    @IBOutlet weak var rideAccessButton: UIButton!
    @IBOutlet weak var discountAccessButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var sixthButton: UIButton!
    
    
    @IBOutlet weak var testView: UIView!
    
    @IBOutlet weak var createPassButton: UIButton!
    
    var classicGuest: ClassicGuest?
    var vipGuest: VIPGuest?
    var childGuest: ChildGuest?
    var seasonPassGuest: SeasonPassGuest?
    var seniorGuest: SeniorGuest?
    
    var hourlyEmployeeFood: HourlyEmployee?
    var hourlyEmployeeRide: HourlyEmployee?
    var hourlyEmployeeMerch: HourlyEmployee?
    var manager: Manager?
    var contractEmployeeAcme: ContractEmployee?
    var contractEmployeeOrkin: ContractEmployee?
    var contractEmployeeFedex: ContractEmployee?
    var contractEmployeeNWElictrical: ContractEmployee?
    var vendor1001: Vendor?
    var vendor1002: Vendor?
    var vendor1003: Vendor?
    var vendor2001: Vendor?
    var vendor2002: Vendor?
    
    var selectedEntrant: Entrant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkGuest()
        hideSubMenu()
        buttonDesign()
        
        if classicGuest != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = classicGuest!
        } else if vipGuest != nil {
            discountAccessButton.isEnabled = true
            whiteColor(button: discountAccessButton)
            selectedEntrant = vipGuest!
        } else if childGuest != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = childGuest!
        } else if seasonPassGuest != nil {
            discountAccessButton.isEnabled = true
            whiteColor(button: discountAccessButton)
            selectedEntrant = seasonPassGuest!
        } else if seniorGuest != nil {
            discountAccessButton.isEnabled = true
            whiteColor(button: discountAccessButton)
            selectedEntrant = seniorGuest!
        } else if hourlyEmployeeFood != nil {
            discountAccessButton.isEnabled = true
            whiteColor(button: discountAccessButton)
            selectedEntrant = hourlyEmployeeFood!
        } else if hourlyEmployeeRide != nil {
            discountAccessButton.isEnabled = true
            whiteColor(button: discountAccessButton)
            selectedEntrant = hourlyEmployeeRide!
        } else if hourlyEmployeeMerch != nil {
            discountAccessButton.isEnabled = true
            whiteColor(button: discountAccessButton)
            selectedEntrant = hourlyEmployeeMerch!
        } else if manager != nil {
            discountAccessButton.isEnabled = true
            whiteColor(button: discountAccessButton)
            selectedEntrant = manager!
        } else if contractEmployeeAcme != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = contractEmployeeAcme!
        } else if contractEmployeeOrkin != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = contractEmployeeOrkin!
        } else if contractEmployeeFedex != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = contractEmployeeFedex!
        } else if contractEmployeeNWElictrical != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = contractEmployeeNWElictrical!
        } else if vendor1001 != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = vendor1001!
        } else if vendor1002 != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = vendor1002!
        } else if vendor1003 != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = vendor1003!
        } else if vendor2001 != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = vendor2001!
        } else if vendor2002 != nil {
            discountAccessButton.isEnabled = false
            greyColor(button: discountAccessButton)
            selectedEntrant = vendor2002!
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func createPassButton(_ sender: AnyObject) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func topTestingButtons(_ sender: UIButton) {
        
        let btnArray: [UIButton] = [areaAccessButton, rideAccessButton, discountAccessButton]
        
        for button in btnArray {
            button.isSelected = sender === button
        }
        
        if sender == areaAccessButton {
            
            firstButton.isHidden = false
            secondButton.isHidden = false
            thirdButton.isHidden = false
            fourthButton.isHidden = false
            fifthButton.isHidden = false
            sixthButton.isHidden = true
            
            firstButton.setTitle("Amusement", for: .normal)
            secondButton.setTitle("Ride Control", for: .normal)
            thirdButton.setTitle("Kitchen", for: .normal)
            fourthButton.setTitle("Maintainence", for: .normal)
            fifthButton.setTitle("Office", for: .normal)
            
        } else if sender == rideAccessButton {
            
            firstButton.isHidden = false
            secondButton.isHidden = false
            thirdButton.isHidden = true
            fourthButton.isHidden = true
            fifthButton.isHidden = true
            sixthButton.isHidden = true
            
            firstButton.setTitle("All rides", for: .normal)
            secondButton.setTitle("Skip lines", for: .normal)
            
        } else if sender == discountAccessButton {
            
            firstButton.isHidden = false
            secondButton.isHidden = false
            thirdButton.isHidden = false
            fourthButton.isHidden = false
            fifthButton.isHidden = false
            sixthButton.isHidden = false
            
            firstButton.setTitle("Food10", for: .normal)
            secondButton.setTitle("Food15", for: .normal)
            thirdButton.setTitle("Food25", for: .normal)
            fourthButton.setTitle("Merch10", for: .normal)
            fifthButton.setTitle("Merch20", for: .normal)
            sixthButton.setTitle("Merch25", for: .normal)
            
        }
        
    }
    
    @IBAction func bottomTestingButtons(_ sender: UIButton) {
        
        let btnArray: [UIButton] = [firstButton, secondButton, thirdButton, fourthButton, fifthButton, sixthButton]
        
        for button in btnArray {
            button.isSelected = sender === button
        }
        if areaAccessButton.state == .selected {
            switch sender {
            case firstButton:
                if let result = selectedEntrant {
                    let text = result.swipeArea(area: EntranceTower.AreaAccess.amusementAreas)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case secondButton:
                if let result = selectedEntrant {
                    let text = result.swipeArea(area: EntranceTower.AreaAccess.kitchenAreas)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case thirdButton:
                if let result = selectedEntrant {
                    let text = result.swipeArea(area: EntranceTower.AreaAccess.rideControlAreas)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case fourthButton:
                if let result = selectedEntrant {
                    let text = result.swipeArea(area: EntranceTower.AreaAccess.maintenanceAreas)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case fifthButton:
                if let result = selectedEntrant {
                    let text = result.swipeArea(area: EntranceTower.AreaAccess.officeAreas)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            default:
                break
            }
            
        } else if rideAccessButton.state == .selected {
            switch sender {
            case firstButton:
                if let result = selectedEntrant {
                    let text = result.swipeRides(area: EntranceTower.RideAccess.allRides)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case secondButton:
                if let result = selectedEntrant {
                    let text = result.swipeRides(area: EntranceTower.RideAccess.skipLine)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            default:
                break
            }
            
        } else if discountAccessButton.state == .selected {
            switch sender {
            case firstButton:
                if let result = selectedEntrant {
                    let text = result.swipeDiscount(area: EntranceTower.DiscountAccess.foodDiscount10)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case secondButton:
                if let result = selectedEntrant {
                    let text = result.swipeDiscount(area: EntranceTower.DiscountAccess.foodDiscount15)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case thirdButton:
                if let result = selectedEntrant {
                    let text = result.swipeDiscount(area: EntranceTower.DiscountAccess.foodDiscount25)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case fourthButton:
                if let result = selectedEntrant {
                    let text = result.swipeDiscount(area: EntranceTower.DiscountAccess.merchDiscount10)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            case fifthButton:
                if let result = selectedEntrant {
                    let text = result.swipeDiscount(area: EntranceTower.DiscountAccess.merchDiscount20)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
            }
            case sixthButton:
                if let result = selectedEntrant {
                    let text = result.swipeDiscount(area: EntranceTower.DiscountAccess.merchDiscount25)
                    testLabel.text = text.1
                    if text.0 {
                        testView.backgroundColor = .green
                    } else {
                        testView.backgroundColor = .red
                    }
                }
            default:
                break
            }
        }
    }
    
    
    func checkGuest() {
        
        if classicGuest != nil  {
            firstLabel.isHidden = false
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "No Name"
            entrantType.text = "Classic Guest"
            firstLabel.text = "Access all rides"
        } else if vipGuest != nil {
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            guestName.text = "No Name"
            entrantType.text = "VIP Guest"
            firstLabel.text = "Access all rides\n Skip all ride lines"
            secondLabel.text = "10% discount on food"
            thirdLabel.text = "20% discount on merchandise"
        } else if childGuest != nil {
            firstLabel.isHidden = false
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "No Name"
            entrantType.text = "Child Guest"
            firstLabel.text = "Access all rides"
        } else if let entrant = seasonPassGuest {
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Season Pass Guest"
            firstLabel.text = "Access all rides\n Skip all ride lines"
            secondLabel.text = "10% discount on food"
            thirdLabel.text = "20% discount on food"
        } else if let entrant = seniorGuest {
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Senior Guest"
            firstLabel.text = "Access all rides\n Skip all ride lines"
            secondLabel.text = "10% discount on food"
            thirdLabel.text = "10% discount on merchandise"
        } else if let entrant = hourlyEmployeeFood {
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Hourly Employee - Food Services"
            firstLabel.text = "Access all rides"
            secondLabel.text = "15% discount on food"
            thirdLabel.text = "25% discount on merchandise"
        } else if let entrant = hourlyEmployeeRide {
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Hourly Employee - Ride Services"
            firstLabel.text = "Access all rides"
            secondLabel.text = "15% discount on food"
            thirdLabel.text = "25% discount on merchandise"
        } else if let entrant = hourlyEmployeeMerch {
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Hourly Employee - Merchandise Services"
            firstLabel.text = "Access all rides"
            secondLabel.text = "15% discount on food"
            thirdLabel.text = "25% discount on merchandise"
        } else if let entrant = manager {
            firstLabel.isHidden = false
            secondLabel.isHidden = false
            thirdLabel.isHidden = false
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Manager"
            firstLabel.text = "Access all rides"
            secondLabel.text = "25% discount on food"
            thirdLabel.text = "25% disount on food"
        } else if let entrant = vendor1001 {
            firstLabel.isHidden = false
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Vendor - Project #1001"
            firstLabel.text = "Access all rides"
        } else if let entrant = vendor1002 {
            firstLabel.isHidden = false
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Vendor - Project #1002"
            firstLabel.text = "Access all rides"
        } else if let entrant = vendor1003 {
            firstLabel.isHidden = false
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Vendor - Project #1003"
            firstLabel.text = "Access all rides"
        } else if let entrant = vendor2001 {
            firstLabel.isHidden = true
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Vendor - Project #2001"
        } else if let entrant = vendor2002 {
            firstLabel.isHidden = true
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Vendor - Project #2002"
        } else if let entrant = contractEmployeeAcme {
            firstLabel.isHidden = true
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Contractor - Acme"
        } else if let entrant = contractEmployeeOrkin {
            firstLabel.isHidden = false
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Contractor - Orkin"
            firstLabel.text = "Access all rides"
        } else if let entrant = contractEmployeeFedex {
            firstLabel.isHidden = true
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Contractor - Fedex"
        } else if let entrant = contractEmployeeNWElictrical {
            firstLabel.isHidden = false
            secondLabel.isHidden = true
            thirdLabel.isHidden = true
            guestName.text = "\(entrant.firstName) " + "\(entrant.lastName)"
            entrantType.text = "Contractor - NW Elictrical"
            firstLabel.text = "Access all rides"
        }
    }
    
    // MARK: Helper Methods
    func buttonDesign() {
        areaAccessButton.layer.cornerRadius = 4
        rideAccessButton.layer.cornerRadius = 4
        discountAccessButton.layer.cornerRadius = 4
        createPassButton.layer.cornerRadius = 4
        testView.layer.cornerRadius = 4
    }
    
    func hideSubMenu() {
        firstButton.isHidden = true
        secondButton.isHidden = true
        thirdButton.isHidden = true
        fourthButton.isHidden = true
        fifthButton.isHidden = true
        sixthButton.isHidden = true
    }
    
    func whiteColor(button: UIButton) {
        button.backgroundColor = UIColor(red: 239/255.0, green: 236/255.0, blue: 241/255.0, alpha: 1.0)
    }
    
    func greyColor(button: UIButton) {
        button.backgroundColor = UIColor(red: 128/255.0, green: 128/255.0, blue: 128/255.0, alpha: 1.0)
    }
}
