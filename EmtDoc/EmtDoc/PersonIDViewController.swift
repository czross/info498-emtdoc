//
//  PersonIDViewController.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class PersonIDViewController: UIViewController {
    var EmtDocModel = EmtDoc()
    
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtMiddleInitial: UITextField!
    
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtRace: UITextField!
    @IBOutlet weak var txtAdvanced: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtTelephone: UITextField!
    @IBOutlet weak var txtPhysician: UITextField!
    
    @IBOutlet weak var txtAddMedication: UITextField!
    @IBOutlet weak var txtAddAllergies: UITextField!
    
    @IBAction func updateButton(sender: UIButton) {
        var updatedPersonID = PersonID()
        
        updatedPersonID.set(fName: txtFName.text!)
        updatedPersonID.set(lName: txtLName.text!)
        updatedPersonID.set(middleInitial: txtMiddleInitial.text!)
        
        updatedPersonID.set(gender: txtGender.text!)
        updatedPersonID.set(dob: txtDob.text!)
        updatedPersonID.set(age: (txtAge.text as? Int)!)
        updatedPersonID.set(weight: (txtWeight.text as? Double)!)
        updatedPersonID.set(race: txtRace.text!)
        updatedPersonID.set(advanced: txtAdvanced.text!)
        
        updatedPersonID.set(address: txtAddress.text!)
        updatedPersonID.set(city: txtCity.text!)
        updatedPersonID.set(state: txtState.text!)
        updatedPersonID.set(zip: txtZip.text!)
        updatedPersonID.set(telephone: txtTelephone.text!)
        updatedPersonID.set(physician: txtPhysician.text!)
        
        updatedPersonID.set(allergies: EmtDocModel.person.allergies)
        updatedPersonID.set(medications: EmtDocModel.person.medications)
        updatedPersonID.add(medication: txtAddMedication.text!)
        updatedPersonID.add(allergy: txtAddAllergies.text!)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.EmtDocModel.person = updatedPersonID
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.EmtDocModel = appDelegate.EmtDocModel
        
        
        // Prepopulate person info
        
        if EmtDocModel.person.fName != nil {
            print("DAFUQ")
            print(txtFName.text)
            txtFName.text = EmtDocModel.person.fName
        }
        
        txtLName.text = EmtDocModel.person.lName
        txtMiddleInitial.text = EmtDocModel.person.middleInitial
        
        txtGender.text = EmtDocModel.person.gender
        txtDob.text = EmtDocModel.person.dob
        txtAge.text = EmtDocModel.person.age as! String
        txtWeight.text = EmtDocModel.person.weight as! String
        txtRace.text = EmtDocModel.person.race
        txtAdvanced.text = EmtDocModel.person.advanced
        
        txtAddress.text = EmtDocModel.person.address
        txtCity.text = EmtDocModel.person.city
        txtState.text = EmtDocModel.person.state
        txtZip.text = EmtDocModel.person.zip
        txtTelephone.text = EmtDocModel.person.telephone
        txtPhysician.text = EmtDocModel.person.physician
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
