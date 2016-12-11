//
//  PersonalMedicalViewController.swift
//  EmtDoc
//
//  Created by studentuser on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class PersonalMedicalViewController: UIViewController {
    
    var EmtDocModel = EmtDoc()
    
    
    @IBOutlet weak var medications: UILabel!
    @IBOutlet weak var allergies: UILabel!
    @IBOutlet weak var txtAddMedication: UITextField!
    @IBOutlet weak var txtAddAllergy: UITextField!

    @IBAction func updateButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.person
        
        mainModel.add(allergy: txtAddAllergy.text!)
        mainModel.add(medication: txtAddMedication.text!)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.EmtDocModel = appDelegate.EmtDocModel
        
        medications.text = "placeholder"
        
        allergies.text = "placeholder2"
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
