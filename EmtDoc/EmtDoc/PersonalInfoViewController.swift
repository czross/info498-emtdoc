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
        txtDob.keyboardType = UIKeyboardType.numberPad
        txtAge.keyboardType = UIKeyboardType.numberPad
        txtWeight.keyboardType = UIKeyboardType.numberPad
        
        // Prepopulate
        
        if (EmtDocModel.person.fName == "") {
            txtFName.placeholder = "First"
        } else {
            txtFName.placeholder = EmtDocModel.person.fName
        }
        
        if (EmtDocModel.person.lName == "") {
            txtLName.placeholder = "Last"
        } else {
            txtLName.placeholder = EmtDocModel.person.lName
        }
        
        if (EmtDocModel.person.middleInitial == "") {
            txtMiddleInitial.placeholder = "Middle Initial"
        } else {
            txtMiddleInitial.placeholder = EmtDocModel.person.middleInitial
        }
        
        
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
            txtAge.placeholder = "Years"
        } else {
            txtAge.placeholder = "\(EmtDocModel.person.age) years"
        }
        
        if (EmtDocModel.person.weight == 0) {
            txtWeight.placeholder = "lbs"
        } else {
            txtWeight.placeholder = "\(String(EmtDocModel.person.weight)) lbs"
        }
        
        if (EmtDocModel.person.race == "") {
            txtRace.placeholder = "Race"
        } else {
            txtRace.placeholder = EmtDocModel.person.race
        }
        
        txtAdvanced.text = EmtDocModel.person.advanced
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
