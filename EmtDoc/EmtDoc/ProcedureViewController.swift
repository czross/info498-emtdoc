//
//  ProcedureViewController.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class ProcedureViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var EmtDocModel = EmtDoc()
    var procedures: [String] = []
    var location: [String] = []
    var pickerData: [[String]] = []
    var procedureChosen: String = ""
    var locationChosen: String = ""
    
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
        print(self.EmtDocModel.procedures.getInput())
    }
    
    @IBAction func commitProcedure(_ sender: AnyObject) {
        self.EmtDocModel.procedures.done(procedure: self.procedureChosen, location: self.locationChosen)
    }
    
    @IBAction func addMed(_ sender: UIButton) {
        let choice = String.init(describing: sender.titleLabel)
        var med = ""
        print(choice)
        if (choice == "Epinephrine Given") {
            med = "Epinephrine"
        } else if (choice == "Bicarb Given") {
            med = "Bicarb"
        } else if (choice == "Insulin Given") {
            med = "Insulin"
        } else {
            med = "Amiodarone"
        }
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
