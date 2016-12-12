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

    @IBAction func updateButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.person
        
        mainModel.set(address: txtAddress.text!)
        mainModel.set(city: txtCity.text!)
        mainModel.set(state: txtState.text!)
        mainModel.set(zip: txtZip.text!)
        mainModel.set(telephone: txtTelephone.text!)
        mainModel.set(physician: txtPhysician.text!)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get Model singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        txtTelephone.keyboardType = UIKeyboardType.numbersAndPunctuation
        
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
