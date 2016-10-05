//
//  ViewController.swift
//  AmusementParkPassPart1
//
//  Created by Mathias Vang Rasmussen on 21/09/2016.
//  Copyright © 2016 ReCapted. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    @IBOutlet weak var contractorButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var ssnTextField: UITextField!
    @IBOutlet weak var projectNumberTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    @IBOutlet weak var generatePassButton: UIButton!
    @IBOutlet weak var populateDataButton: UIButton!
    @IBOutlet weak var changingLabel: UILabel!
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!

    
    var fakeVisitDate: Date!
    var fakeDate: Date!
    var fakePerson: Manager!
    var fakeVendor: Vendor!
    var guest: Guest?
    var blueColor = UIColor(red: 58, green: 153, blue: 216, alpha: 1.0)


    @IBAction func topMenuButtons(_ sender: UIButton) {

        let btnArray: [UIButton] = [guestButton, employeeButton, managerButton, contractorButton, vendorButton]
        
        for button in btnArray {
            button.isSelected = sender === button
        }
        
            if sender == guestButton {
                disableAll()
                showSubMenu()
                clearTextViews()
                fifthButton.isHidden = false
                
                firstButton.setTitle("Child", for: .normal)
                secondButton.setTitle("Classic", for: .normal)
                thirdButton.setTitle("Senior", for: .normal)
                fourthButton.setTitle("VIP", for: .normal)
                fifthButton.setTitle("Season Pass", for: .normal)
                
                changingLabel.text = "Zip Code"
                
            } else if sender == employeeButton {
                disableAll()
                showSubMenu()
                clearTextViews()
                fifthButton.isHidden = true
                fourthButton.isHidden = true
                
                firstButton.setTitle("Food", for: .normal)
                secondButton.setTitle("Ride", for: .normal)
                thirdButton.setTitle("Maintenance", for: .normal)
                
                changingLabel.text = "Zip Code"
                
            } else if sender == managerButton {
                hideSubMenu()
                disableAll()
                clearTextViews()
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                addressTextField.isEnabled = true
                cityTextField.isEnabled = true
                stateTextField.isEnabled = true
                zipCodeTextField.isEnabled = true
                
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
                whiteColor(field: addressTextField)
                whiteColor(field: cityTextField)
                whiteColor(field: stateTextField)
                whiteColor(field: zipCodeTextField)
                
                changingLabel.text = "Zip Code"
                
            } else if sender == contractorButton {
                showSubMenu()
                disableAll()
                clearTextViews()
                fifthButton.isHidden = true
                
                firstButton.setTitle("Acme", for: .normal)
                secondButton.setTitle("Orkin", for: .normal)
                thirdButton.setTitle("Fedex", for: .normal)
                fourthButton.setTitle("NW Electrical", for: .normal)
                
                changingLabel.text = "Zip Code"
                
            } else if sender == vendorButton {
                showSubMenu()
                disableAll()
                clearTextViews()
                fifthButton.isHidden = false
                
                firstButton.setTitle("1001", for: .normal)
                secondButton.setTitle("1002", for: .normal)
                thirdButton.setTitle("1003", for: .normal)
                fourthButton.setTitle("2001", for: .normal)
                fifthButton.setTitle("2002", for: .normal)
                
                changingLabel.text = "Date of Visit"
                
        }
    }
    
    @IBAction func subMenuButtons(_ sender: UIButton) {
        
        let subMenuArray: [UIButton] = [firstButton, secondButton, thirdButton, fourthButton, fifthButton]
        
        for button in subMenuArray {
            button.isSelected = sender === button
        }
        
        if guestButton.state == .selected {
            switch sender {
            case firstButton:
                disableAll()
                clearTextViews()
                birthTextField.isEnabled = true
                
                whiteColor(field: birthTextField)
            case thirdButton:
                disableAll()
                clearTextViews()
                birthTextField.isEnabled = true
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                
                whiteColor(field: birthTextField)
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
            case fifthButton:
                disableAll()
                clearTextViews()
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                addressTextField.isEnabled = true
                cityTextField.isEnabled = true
                stateTextField.isEnabled = true
                zipCodeTextField.isEnabled = true
                
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
                whiteColor(field: addressTextField)
                whiteColor(field: cityTextField)
                whiteColor(field: stateTextField)
                whiteColor(field: zipCodeTextField)
            default:
                disableAll()
                clearTextViews()
            }
            
        } else if employeeButton.state == .selected {
            disableAll()
            clearTextViews()
            
            firstNameTextField.isEnabled = true
            lastNameTextField.isEnabled = true
            addressTextField.isEnabled = true
            cityTextField.isEnabled = true
            stateTextField.isEnabled = true
            zipCodeTextField.isEnabled = true
            
            whiteColor(field: firstNameTextField)
            whiteColor(field: lastNameTextField)
            whiteColor(field: addressTextField)
            whiteColor(field: cityTextField)
            whiteColor(field: stateTextField)
            whiteColor(field: zipCodeTextField)
            
        } else if contractorButton.state == .selected {
            switch sender {
            case firstButton:
                disableAll()
                clearTextViews()
                
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                addressTextField.isEnabled = true
                cityTextField.isEnabled = true
                stateTextField.isEnabled = true
                zipCodeTextField.isEnabled = true
                    
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
                whiteColor(field: addressTextField)
                whiteColor(field: cityTextField)
                whiteColor(field: stateTextField)
                whiteColor(field: zipCodeTextField)
            case secondButton:
                disableAll()
                clearTextViews()
                
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                addressTextField.isEnabled = true
                cityTextField.isEnabled = true
                stateTextField.isEnabled = true
                zipCodeTextField.isEnabled = true
                
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
                whiteColor(field: addressTextField)
                whiteColor(field: cityTextField)
                whiteColor(field: stateTextField)
                whiteColor(field: zipCodeTextField)
            case thirdButton:
                clearTextViews()
                
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                addressTextField.isEnabled = true
                cityTextField.isEnabled = true
                stateTextField.isEnabled = true
                zipCodeTextField.isEnabled = true
                    
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
                whiteColor(field: addressTextField)
                whiteColor(field: cityTextField)
                whiteColor(field: stateTextField)
                whiteColor(field: zipCodeTextField)
            case fourthButton:
                clearTextViews()
                
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                addressTextField.isEnabled = true
                cityTextField.isEnabled = true
                stateTextField.isEnabled = true
                zipCodeTextField.isEnabled = true
                    
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
                whiteColor(field: addressTextField)
                whiteColor(field: cityTextField)
                whiteColor(field: stateTextField)
                whiteColor(field: zipCodeTextField)
            default:
                disableAll()
                clearTextViews()
            }
            
        } else if vendorButton.state == .selected {
                clearTextViews()
            
                firstNameTextField.isEnabled = true
                lastNameTextField.isEnabled = true
                birthTextField.isEnabled = true
                zipCodeTextField.isEnabled = true
                
                whiteColor(field: firstNameTextField)
                whiteColor(field: lastNameTextField)
                whiteColor(field: birthTextField)
                whiteColor(field: zipCodeTextField)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        clearTextViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAccessDeniedSound()
        loadAccessGrantedSound()
        disableAll()
        buttonDesign()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        fakeDate = try! stringToDate("1991-01-01")
        fakeVisitDate = try! stringToDate("1994-01-01")
        fakePerson = Manager(dayOfBirth: fakeDate, type: EmployeeType.manager, firstName: "Nick", lastName: "Fury", address: "Classified", city: "Classified", state: "Classified", zipCode: "0000")
        
        fakeVendor = Vendor(dayOfBirth: fakeDate, type: VendorType.vendor, firstName: "Tony", lastName: "Stark", dayOfVisit: fakeVisitDate)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GeneratePass" {
            let controller = segue.destination as! PassController
            
            do {
                if guestButton.isSelected && firstButton.isSelected {
                    if birthTextField.text == "" {
                        throw Errors.missingDayOfBirth
                    }
                    let date = try stringToDate(birthTextField.text!)
                    controller.childGuest = ChildGuest(dayOfBirth: date, type: GuestType.childGuest)
                } else if guestButton.isSelected && secondButton.isSelected {
                    controller.classicGuest = ClassicGuest(dayOfBirth: nil, type: GuestType.classicGuest)
                } else if guestButton.isSelected && thirdButton.isSelected {
                    if birthTextField.text == "" {
                        throw Errors.missingDayOfBirth
                    }
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    let date = try stringToDate(birthTextField.text!)
                    controller.seniorGuest = SeniorGuest(dayOfBirth: date, type: GuestType.seniorGuest, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!)
                } else if guestButton.isSelected && fourthButton.isSelected {
                    controller.vipGuest = VIPGuest(dayOfBirth: nil, type: GuestType.vipGuest)
                }else if guestButton.isSelected && fifthButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.seasonPassGuest = SeasonPassGuest(dayOfBirth: nil, type: GuestType.vipGuest, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: stateTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if employeeButton.isSelected && firstButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.hourlyEmployeeFood = HourlyEmployee(dayOfBirth: nil, type: EmployeeType.hourlyEmployeeFood, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if employeeButton.isSelected && secondButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.hourlyEmployeeRide = HourlyEmployee(dayOfBirth: nil, type: EmployeeType.hourlyEmployeeFood, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if employeeButton.isSelected && thirdButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.hourlyEmployeeMerch = HourlyEmployee(dayOfBirth: nil, type: EmployeeType.hourlyEmployeeFood, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if managerButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.manager = Manager(dayOfBirth: nil, type: EmployeeType.manager, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if contractorButton.isSelected && firstButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.contractEmployeeAcme = ContractEmployee(dayOfBirth: nil, type: EmployeeType.contractEmployee, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if contractorButton.isSelected && secondButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.contractEmployeeOrkin = ContractEmployee(dayOfBirth: nil, type: EmployeeType.contractEmployee, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if contractorButton.isSelected && thirdButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.contractEmployeeFedex = ContractEmployee(dayOfBirth: nil, type: EmployeeType.contractEmployee, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if contractorButton.isSelected && fourthButton.isSelected {
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if addressTextField.text == "" {
                        throw Errors.missingAddress
                    }
                    if cityTextField.text == "" {
                        throw Errors.missingCity
                    }
                    if stateTextField.text == "" {
                        throw Errors.missingState
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingZipCode
                    }
                    controller.contractEmployeeNWElictrical = ContractEmployee(dayOfBirth: nil, type: EmployeeType.contractEmployee, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, address: addressTextField.text!, city: cityTextField.text!, state: stateTextField.text!, zipCode: zipCodeTextField.text!)
                } else if vendorButton.isSelected && firstButton.isSelected {
                    if birthTextField.text == "" {
                        throw Errors.missingDayOfBirth
                    }
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingDateOfVisit
                    }
                    let visitDate = try stringToDate(zipCodeTextField.text!)
                    let date = try stringToDate(birthTextField.text!)
                    controller.vendor1001 = Vendor(dayOfBirth: date, type: VendorType.vendor, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, dayOfVisit: visitDate)
                } else if vendorButton.isSelected && secondButton.isSelected {
                    if birthTextField.text == "" {
                        throw Errors.missingDayOfBirth
                    }
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingDateOfVisit
                    }
                    let visitDate = try stringToDate(zipCodeTextField.text!)
                    let date = try stringToDate(birthTextField.text!)
                    controller.vendor1002 = Vendor(dayOfBirth: date, type: VendorType.vendor, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, dayOfVisit: visitDate)
                } else if vendorButton.isSelected && thirdButton.isSelected {
                    if birthTextField.text == "" {
                        throw Errors.missingDayOfBirth
                    }
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingDateOfVisit
                    }
                    let visitDate = try stringToDate(zipCodeTextField.text!)
                    let date = try stringToDate(birthTextField.text!)
                    controller.vendor1003 = Vendor(dayOfBirth: date, type: VendorType.vendor, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, dayOfVisit: visitDate)
                } else if vendorButton.isSelected && fourthButton.isSelected {
                    if birthTextField.text == "" {
                        throw Errors.missingDayOfBirth
                    }
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingDateOfVisit
                    }
                    let visitDate = try stringToDate(zipCodeTextField.text!)
                    let date = try stringToDate(birthTextField.text!)
                    controller.vendor2001 = Vendor(dayOfBirth: date, type: VendorType.vendor, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, dayOfVisit: visitDate)
                } else if vendorButton.isSelected && fifthButton.isSelected {
                    if birthTextField.text == "" {
                        throw Errors.missingDayOfBirth
                    }
                    if firstNameTextField.text == "" {
                        throw Errors.missingFirstName
                    }
                    if lastNameTextField.text == "" {
                        throw Errors.missingLastName
                    }
                    if zipCodeTextField.text == "" {
                        throw Errors.missingDateOfVisit
                    }
                    let visitDate = try stringToDate(zipCodeTextField.text!)
                    let date = try stringToDate(birthTextField.text!)
                    controller.vendor2002 = Vendor(dayOfBirth: date, type: VendorType.vendor, firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, dayOfVisit: visitDate)
                }
            } catch Errors.missingDayOfBirth {
                let alertController = UIAlertController(title: "Date of Birth Required", message: "Provide a date of birth", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch Errors.missingFirstName {
                    let alertController = UIAlertController(title: "First Name Required", message: "Provide a first name", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(action)
                    
                    present(alertController, animated: true, completion: nil)
            } catch Errors.missingLastName {
                let alertController = UIAlertController(title: "Last Name Required", message: "Provide a last name", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch Errors.missingAddress {
                let alertController = UIAlertController(title: "Address Required", message: "Provide an address", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch Errors.missingCity {
                let alertController = UIAlertController(title: "City Required", message: "Provide a city", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch Errors.missingState {
                let alertController = UIAlertController(title: "State Required", message: "Provide a state", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch Errors.missingZipCode {
                let alertController = UIAlertController(title: "Zip Code Required", message: "Provide a zip code", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch Errors.missingDateOfVisit {
                let alertController = UIAlertController(title: "Date of Visit Required", message: "Provide a date of visit", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch Errors.wrongDateFormat {
                let alertController = UIAlertController(title: "Date of Birth Required", message: "Date must be 'yyyy-mm-dd'", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            } catch let error {
                fatalError("\(error)")
            }
        }
    }
    
    @IBAction func populateDataButton(_ sender: AnyObject) {
        clearTextViews()
        
        if vendorButton.isSelected {
            if birthTextField.isEnabled == true {
                birthTextField.text = dateToString(fakeVendor.dayOfBirth!)
            } else {
                birthTextField.text = nil
            }
            if firstNameTextField.isEnabled == true {
                firstNameTextField.text = fakeVendor.firstName
            } else {
                firstNameTextField.text = nil
            }
            if lastNameTextField.isEnabled == true {
                lastNameTextField.text = fakeVendor.lastName
            } else {
                lastNameTextField.text = nil
            }
            if zipCodeTextField.isEnabled == true {
                zipCodeTextField.text = dateToString(fakeVendor.dayOfVisit)
            } else {
                zipCodeTextField.text = nil
            }
        } else {
        
            if birthTextField.isEnabled == true {
                birthTextField.text = dateToString(fakePerson.dayOfBirth!)
            } else {
                birthTextField.text = nil
            }
            if firstNameTextField.isEnabled == true {
                firstNameTextField.text = fakePerson.firstName
            } else {
                firstNameTextField.text = nil
            }
            if lastNameTextField.isEnabled == true {
                lastNameTextField.text = fakePerson.lastName
            } else {
                lastNameTextField.text = nil
            }
            if addressTextField.isEnabled == true {
                addressTextField.text = fakePerson.address
            } else {
                addressTextField.text = nil
            }
            if cityTextField.isEnabled == true {
                cityTextField.text = fakePerson.city
            } else {
                cityTextField.text = nil
            }
            if stateTextField.isEnabled == true {
                stateTextField.text = fakePerson.state
            } else {
                stateTextField.text = nil
            }
            if zipCodeTextField.isEnabled == true {
                zipCodeTextField.text = fakePerson.zipCode
            } else {
                zipCodeTextField.text = nil
            }
        }
    }
    
    // MARK: Helper Methods
    func buttonDesign() {
        generatePassButton.layer.cornerRadius = 4
        populateDataButton.layer.cornerRadius = 4
    }
    
    func disableAll() {
        changingLabel.text = "Zip Code"
        birthTextField.isEnabled = false
        ssnTextField.isEnabled = false
        projectNumberTextField.isEnabled = false
        firstNameTextField.isEnabled = false
        lastNameTextField.isEnabled = false
        companyTextField.isEnabled = false
        addressTextField.isEnabled = false
        cityTextField.isEnabled = false
        stateTextField.isEnabled = false
        zipCodeTextField.isEnabled = false
        
        greyColor(field: birthTextField)
        greyColor(field: ssnTextField)
        greyColor(field: projectNumberTextField)
        greyColor(field: firstNameTextField)
        greyColor(field: lastNameTextField)
        greyColor(field: companyTextField)
        greyColor(field: addressTextField)
        greyColor(field: cityTextField)
        greyColor(field: stateTextField)
        greyColor(field: zipCodeTextField)
    }
    
    func clearTextViews() {
        birthTextField.text = ""
        ssnTextField.text = ""
        projectNumberTextField.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        companyTextField.text = ""
        addressTextField.text = ""
        cityTextField.text = ""
        stateTextField.text = ""
        zipCodeTextField.text = ""
    }
    
    func hideSubMenu() {
        firstButton.isHidden = true
        secondButton.isHidden = true
        thirdButton.isHidden = true
        fourthButton.isHidden = true
        fifthButton.isHidden = true
    }
    
    func showSubMenu() {
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = false
    }
    
    func whiteColor(field: UITextField) {
        field.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.95)
    }
    
    func greyColor(field: UITextField) {
        field.backgroundColor = UIColor(red: 128/255.0, green: 128/255.0, blue: 128/255.0, alpha: 1.0)
    }
    
    func dateToString(_ date: Date = Date()) -> String {
        let dateFmt: DateFormatter = DateFormatter()
        dateFmt.timeZone = TimeZone.current
        dateFmt.dateFormat =  "yyyy-MM-dd"
        let currentDate = dateFmt.string(from: date)
        
        return currentDate
    }
    
    func keyboardWillShow(notification: Notification) {
        if let userInfoDict = notification.userInfo, let keyboardFrameValue = userInfoDict[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardFrame = keyboardFrameValue.cgRectValue
            
            UIView.animate(withDuration: 0.8) {
                self.stackViewBottomConstraint.constant = keyboardFrame.size.height + 10
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.8) {
            self.stackViewBottomConstraint.constant = 40.0
            self.view.layoutIfNeeded()
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

func stringToDate(_ date: String) throws -> Date {
    let dateFmt: DateFormatter = DateFormatter()
    dateFmt.timeZone = TimeZone.current
    dateFmt.dateFormat =  "yyyy-MM-dd"
    
    let dateFromString = dateFmt.date(from: date)
    
    guard let date = dateFromString else {
        throw Errors.wrongDateFormat as Error
    }
    
    return date
}
