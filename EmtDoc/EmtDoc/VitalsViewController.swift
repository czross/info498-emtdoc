//
//  VitalsViewController.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class VitalsViewController: UIViewController {
    var EmtDocModel = EmtDoc()
    
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
    
    
    @IBAction func updateButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.vitals
        
        appDelegate.EmtDocModel.person.weight = Int(txtWeight.text!)!
        
        mainModel.bloodPrs["Systolic"] = Int(txtBPSystolic.text!)
        mainModel.bloodPrs["Diastolic"] = Int(txtBPSystolic.text!)
        
        mainModel.heartRate = Int(txtHeartRate.text!)!
        mainModel.rhythm = txtRhythm.text!
        mainModel.respRate = Int(txtRespRate.text!)!
        mainModel.o2Saturation = Double(txtO2Saturation.text!)!
        mainModel.endTidalCO2 = Double(txtEndTitalCO2.text!)!
        mainModel.temp = Double(txtTemp.text!)!
        mainModel.pain = Int(txtPain.text!)!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.EmtDocModel = appDelegate.EmtDocModel
        
        txtWeight.text = EmtDocModel.person.weight as! String
        
        txtBPSystolic.text = EmtDocModel.vitals.bloodPrs["Systolic"] as! String
        
        txtBPDiastolic.text = EmtDocModel.vitals.bloodPrs["Diastolic"] as! String
        
        txtHeartRate.text = String(EmtDocModel.vitals.heartRate)
        
        txtRhythm.text = EmtDocModel.vitals.rhythm
        
        txtRespRate.text = String(EmtDocModel.vitals.respRate)
        txtO2Saturation.text = String(EmtDocModel.vitals.o2Saturation)
        txtEndTitalCO2.text = String(EmtDocModel.vitals.endTidalCO2)
        txtTemp.text = String(EmtDocModel.vitals.temp)
        txtPain.text = String(EmtDocModel.vitals.pain)
        
        // Setup Rhythm Alert
        
        let rhythmAlert = UIAlertController(title: "Rhythm", message: "Please Choose Type of Rhythm", preferredStyle: .actionSheet)
        
        rhythmAlert.addAction(UIAlertAction(title: "Normal", style: .default, handler: { (action) in
            //execute some code when this option is selected
            self.txtRhythm.text = "Normal"
        }))
        
        rhythmAlert.addAction(UIAlertAction(title: "Irregular", style: .default, handler: { (action) in
            //execute some code when this option is selected
            self.txtRhythm.text = "Irregular"
        }))
        
        
        
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
