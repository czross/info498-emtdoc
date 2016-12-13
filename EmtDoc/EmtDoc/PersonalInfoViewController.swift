//
//  PersonalInfoViewController.swift
//  EmtDoc
//
//  Created by studentuser on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController {
    
    var EmtDocModel = EmtDoc()
    
    @IBOutlet weak var txtFName: UITextField!
    @IBOutlet weak var txtLName: UITextField!
    @IBOutlet weak var txtMiddleInitial: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtRace: UITextField!
//    @IBOutlet weak var txtAdvanced: UITextField!
    @IBOutlet weak var txtAdvanced: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        // Setup our keyboard types
        txtDob.keyboardType = UIKeyboardType.numbersAndPunctuation
        txtAge.keyboardType = UIKeyboardType.numberPad
        txtWeight.keyboardType = UIKeyboardType.decimalPad
        
        // Prepopulate
        txtFName.placeholder = EmtDocModel.person.fName
        txtLName.placeholder = EmtDocModel.person.lName
        txtMiddleInitial.placeholder = EmtDocModel.person.middleInitial
        
        if (EmtDocModel.person.gender == "") {
            txtGender.placeholder = "Gender"
        } else {
            txtGender.placeholder = EmtDocModel.person.gender
        }
        
        if (EmtDocModel.person.dob == "") {
            txtDob.placeholder = "YY/MM/DD"
        } else {
            txtDob.placeholder = EmtDocModel.person.dob
        }
        
        if (EmtDocModel.person.age == -1) {
            txtAge.placeholder = "Years")
        } else {
            txtAge.placeholder = "\(EmtDocModel.person.age) years"
        }
        
        if () {
            
        }
        txtWeight.placeholder = "\(String(EmtDocModel.person.weight)) lbs"
        
        
        txtRace.placeholder = EmtDocModel.person.race
        txtAdvanced.placeholder = EmtDocModel.person.advanced
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.person
        
        
        if (txtFName.text != "") {
            mainModel.set(fName: txtFName.text!)
        }
        
        if (txtLName.text != "") {
            mainModel.set(lName: txtLName.text!)
        }
        
        if (txtMiddleInitial.text != "") {
            mainModel.set(middleInitial: txtMiddleInitial.text!)
        }
        
        if (txtGender.text != "") {
            mainModel.set(gender: txtGender.text!)
        }
        
        if (txtDob.text != "") {
            mainModel.set(dob: txtDob.text!)
        }
        
        if (Int(txtAge.text!) != nil) {
            mainModel.set(age: Int(txtAge.text!)!)
        }
        
        if (Int(txtWeight.text!) != nil) {
            mainModel.set(weight: Int(txtWeight.text!)!)
        }
        
        if (txtRace.text != "") {
            mainModel.set(race: txtRace.text!)
        }
        
        if (txtAdvanced.text != "") {
            mainModel.set(advanced: txtAdvanced.text!)
        }
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
