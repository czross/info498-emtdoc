//
//  SetTimeViewController.swift
//  EmtDoc
//
//  Created by iGuest on 12/12/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class SetTimeViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var setTimeLabel: UILabel!
    
    @IBAction func setTimeButton(_ sender: Any) {
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.incident
        
        mainModel.dateTime = datePicker.date
        self.navigationController?.popViewController(animated: true)
    }
    
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.incident
        
        // If we don't have already have a time set
        // Set label to no time set
        
        if (mainModel.dateTime == nil) {
            setTimeLabel.text = "No date set"
        } else {
            // Else, set it to the saved date
            dateFormatter.dateStyle = DateFormatter.Style.short
            timeFormatter.timeStyle = DateFormatter.Style.short
            let formattedDate = dateFormatter.string(from: mainModel.dateTime!) + " " + timeFormatter.string(from: mainModel.dateTime!)
            
            setTimeLabel.text = "Previous date set: \(formattedDate)"
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
