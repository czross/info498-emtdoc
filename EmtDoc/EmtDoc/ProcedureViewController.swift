//
//  ProcedureViewController.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit
import SwiftHEXColors

class ProcedureViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var EmtDocModel = EmtDoc()
    var procedures: [String] = []
    var location: [String] = []
    var pickerData: [[String]] = []
    var procedureChosen: String = ""
    var locationChosen: String = ""
    
    // Amiodarone
    @IBOutlet weak var medALabel: UIButton!
    
    // Epinephrine
    @IBOutlet weak var medBLabel: UIButton!
    
    // Bicarb
    @IBOutlet weak var medCLabel: UIButton!
    
    // Insulin
    @IBOutlet weak var medDLabel: UIButton!
    
    @IBOutlet weak var picker: UIPickerView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.EmtDocModel = appDelegate.EmtDocModel
        self.procedures = self.EmtDocModel.procedures.getProcedures()
        self.location = self.EmtDocModel.procedures.getBandageLocation()
        self.pickerData = [self.procedures, self.location]
        self.procedureChosen = self.procedures[0]
        self.locationChosen = self.location[0]
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print("component \(component)")
//        print("row \(row)")
//        print(self.pickerData[component][row])
        if (component == 0) {
            self.procedureChosen = self.pickerData[component][row]
        } else {
            self.locationChosen = self.pickerData[component][row]
        }
        
    }
    
    @IBAction func commitProcedure(_ sender: AnyObject) {
        self.EmtDocModel.procedures.done(procedure: self.procedureChosen, location: self.locationChosen)
        print(self.EmtDocModel.procedures.getInput())
    }
    
    @IBAction func addMed(_ sender: UIButton) {
        let choice = sender.restorationIdentifier
        var med = ""
        print("button choice \(choice)")
        
        // Amiodarone
        if sender.tag == 0 {
            medALabel.backgroundColor = UIColor(hexString: "#51CABD")
            medBLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medCLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medDLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            med = "Amiodarone"
        } else if sender.tag == 1 {
            medALabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medBLabel.backgroundColor = UIColor(hexString: "#51CABD")
            medCLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medDLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            med = "Epinephrine"
        } else if sender.tag == 2 {
            medALabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medBLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medCLabel.backgroundColor = UIColor(hexString: "#51CABD")
            medDLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            med = "Bicarb"
        } else if sender.tag == 3 {
            medALabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medBLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medCLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            medDLabel.backgroundColor = UIColor(hexString: "#51CABD")
            med = "Insulin"
        }
        
        
        if (choice == "Epi") {
            med = "Epinephrine"
            sender.backgroundColor = UIColor(hexString: "#51CABD")
        } else if (choice == "Bicarb") {
            med = "Bicarb"
            sender.backgroundColor = UIColor(hexString: "#51CABD")
        } else if (choice == "Insulin") {
            med = "Insulin"
            sender.backgroundColor = UIColor(hexString: "#51CABD")
        } else {
            med = "Amiodarone"
            sender.backgroundColor = UIColor(hexString: "#51CABD")
        }
        print(med)
        self.EmtDocModel.procedures.done(procedure: med, location: "med")
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
