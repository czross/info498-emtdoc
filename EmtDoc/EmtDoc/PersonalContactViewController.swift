//
//  PersonalContactViewController.swift
//  EmtDoc
//
//  Created by studentuser on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class PersonalContactViewController: UIViewController {
    var EmtDocModel = EmtDoc()
    

    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var txtTelephone: UITextField!
    @IBOutlet weak var txtPhysician: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
        
        // Get Model singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        txtTelephone.keyboardType = UIKeyboardType.numberPad
        txtZip.keyboardType = UIKeyboardType.numberPad
        
        if (EmtDocModel.person.address == "") {
            txtAddress.placeholder = "Street"
        } else {
            txtAddress.placeholder = EmtDocModel.person.address
        }
        
        if (EmtDocModel.person.city == "") {
            txtCity.placeholder = "City"
        } else {
            txtCity.placeholder = EmtDocModel.person.city
        }
        
        if (EmtDocModel.person.state == "") {
            txtState.placeholder = "State"
        } else {
            txtState.placeholder = EmtDocModel.person.state
        }
        
        if (EmtDocModel.person.zip == "") {
            txtZip.placeholder = "Zip"
        } else {
            txtZip.placeholder = EmtDocModel.person.zip
        }
        
        if (EmtDocModel.person.telephone == "") {
            txtTelephone.placeholder = "###-###-####"
        } else {
            txtTelephone.placeholder = EmtDocModel.person.telephone
        }
        
        if (EmtDocModel.person.physician == "") {
            txtPhysician.placeholder = "Physician"
        } else {
            txtPhysician.placeholder = EmtDocModel.person.physician
        }
        
        
    }

    override func viewDidDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.person
        
        
        if (txtAddress.text! != "") {
            mainModel.set(address: txtAddress.text!)
        }
        
        if (txtCity.text! != "") {
            mainModel.set(city: txtCity.text!)
        }
        
        if (txtState.text! != "") {
            mainModel.set(state: txtState.text!)
        }
        
        if (txtZip.text! != "") {
            mainModel.set(zip: txtZip.text!)
        }
        
        if (txtTelephone.text! != "") {
            mainModel.set(telephone: txtTelephone.text!)
        }
        
        if (txtPhysician.text! != "") {
            mainModel.set(physician: txtPhysician.text!)
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
