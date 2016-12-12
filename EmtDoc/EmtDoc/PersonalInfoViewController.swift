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
    @IBOutlet weak var txtAdvanced: UITextField!
    
    @IBAction func updateButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.person
        
        mainModel.set(fName: txtFName.text!)
        mainModel.set(lName: txtLName.text!)
        mainModel.set(middleInitial: txtMiddleInitial.text!)
        
        mainModel.set(gender: txtGender.text!)
        mainModel.set(dob: txtDob.text!)
        mainModel.set(age: Int(txtAge.text!)!)
        mainModel.set(weight: Int(txtWeight.text!)!)
        mainModel.set(race: txtRace.text!)
        mainModel.set(advanced: txtAdvanced.text!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        // Setup our keyboard types
        txtDob.keyboardType = UIKeyboardType.numbersAndPunctuation
        txtAge.keyboardType = UIKeyboardType.numberPad
        txtWeight.keyboardType = UIKeyboardType.decimalPad
        
        // Prepopulate
        txtFName.text = EmtDocModel.person.fName
        txtLName.text = EmtDocModel.person.lName
        txtMiddleInitial.text = EmtDocModel.person.middleInitial
        
        txtGender.text = EmtDocModel.person.gender
        txtDob.text = EmtDocModel.person.dob
        txtAge.text = String(EmtDocModel.person.age)
        txtWeight.text = String(EmtDocModel.person.weight)
        txtRace.text = EmtDocModel.person.race
        txtAdvanced.text = EmtDocModel.person.advanced

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
