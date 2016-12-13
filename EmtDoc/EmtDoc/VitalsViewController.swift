//
//  VitalsViewController.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class VitalsViewController: UIViewController{
    var EmtDocModel = EmtDoc()

    
    @IBOutlet weak var rhythmButton: UIButton!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtBPSystolic: UITextField!
    @IBOutlet weak var txtBPDiastolic: UITextField!
    @IBOutlet weak var txtHeartRate: UITextField!
    @IBOutlet weak var txtRhythm: UITextField!
    @IBOutlet weak var txtRespRate: UITextField!
    @IBOutlet weak var txtO2Saturation: UITextField!
    @IBOutlet weak var txtEndTitalCO2: UITextField!
    @IBOutlet weak var txtTemp: UITextField!
    @IBOutlet weak var txtPain: UITextField!
    
    let rhythmAlert = UIAlertController(title: "Rhythm", message: "Please Choose Type of Rhythm", preferredStyle: .alert)
    
    @IBAction func rhythmButtonPress(_ sender: Any) {
        self.present(rhythmAlert, animated: true, completion:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
        
        // Set our text inputs as
        txtWeight.keyboardType = UIKeyboardType.decimalPad
        txtBPSystolic.keyboardType = UIKeyboardType.numberPad
        txtBPDiastolic.keyboardType = UIKeyboardType.numberPad
        txtHeartRate.keyboardType = UIKeyboardType.numberPad
        txtRespRate.keyboardType = UIKeyboardType.numberPad
        txtO2Saturation.keyboardType = UIKeyboardType.numberPad
        txtEndTitalCO2.keyboardType = UIKeyboardType.numberPad
        txtTemp.keyboardType = UIKeyboardType.decimalPad
        txtPain.keyboardType = UIKeyboardType.numberPad
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        // Populate text fields
        
        
        txtWeight.placeholder = "\(String(EmtDocModel.person.weight)) lbs"
        
        
        
        txtBPSystolic.placeholder = "\(String(EmtDocModel.vitals.bloodPrs["Systolic"]!)) mmHg"
        txtBPDiastolic.placeholder = "\(String(EmtDocModel.vitals.bloodPrs["Diastolic"]!)) mmHg"
        txtHeartRate.placeholder = "\(String(EmtDocModel.vitals.heartRate)) BPM"
        txtRespRate.placeholder = "\(String(EmtDocModel.vitals.respRate)) RR"
        txtO2Saturation.placeholder = "\(String(EmtDocModel.vitals.o2Saturation)) %"
        txtEndTitalCO2.placeholder = "\(String(EmtDocModel.vitals.endTidalCO2)) mmHg"
        txtTemp.placeholder = "\(String(EmtDocModel.vitals.temp)) C"
        txtPain.placeholder = "\(String(EmtDocModel.vitals.pain)) / 10"
        
        
        // Setup Rhythm Alert
        
        rhythmAlert.addAction(UIAlertAction(title: "Normal", style: .default, handler: { (action) in
            //execute some code when this option is selected
            self.rhythmButton.setTitle("Normal", for: .normal)
        }))
        
        rhythmAlert.addAction(UIAlertAction(title: "Irregular", style: .default, handler: { (action) in
            //execute some code when this option is selected
            self.rhythmButton.setTitle("Irregular", for: .normal)
        }))
    }
    
    // Saves model information when exiting VC
    override func viewDidDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.vitals
        
        if (Int(txtWeight.text!) != nil) {
            appDelegate.EmtDocModel.person.weight = Int(txtWeight.text!)!
        }
        
        if (Int(txtBPSystolic.text!) != nil) {
            mainModel.bloodPrs["Systolic"] = Int(txtBPSystolic.text!)
        }
        
        if (Int(txtBPSystolic.text!) != nil) {
            mainModel.bloodPrs["Diastolic"] = Int(txtBPSystolic.text!)
        }
        
        if (Int(txtHeartRate.text!) != nil) {
            mainModel.heartRate = Int(txtHeartRate.text!)!
        }
        
        mainModel.rhythm = (self.rhythmButton.titleLabel!.text!)
        
        if (Int(txtRespRate.text!) != nil) {
            mainModel.respRate = Int(txtRespRate.text!)!
        }
        
        if (Double(txtO2Saturation.text!) != nil) {
            mainModel.o2Saturation = Double(txtO2Saturation.text!)!
        }
        
        if (Double(txtEndTitalCO2.text!) != nil) {
            mainModel.endTidalCO2 = Double(txtEndTitalCO2.text!)!
        }
        
        if (Double(txtTemp.text!) != nil) {
            mainModel.temp = Double(txtTemp.text!)!
        }
        
        if (Int(txtPain.text!) != nil) {
            mainModel.pain = Int(txtPain.text!)!
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
