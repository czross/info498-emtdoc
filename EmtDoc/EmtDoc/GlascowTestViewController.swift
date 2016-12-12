//
//  GlascowTestViewController.swift
//  EmtDoc
//
//  Created by studentuser on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class GlascowTestViewController: UIViewController {
    
    var EmtDocModel = EmtDoc()
    
    let eyeAlert = UIAlertController(title: "Eye", message: "Please Choose Type of Response", preferredStyle: .actionSheet)
    
    let verbalAlert = UIAlertController(title: "Verbal", message: "Please Choose Type of Response", preferredStyle: .actionSheet)
    
    let motorAlert = UIAlertController(title: "Motor", message: "Please Choose Type of Response", preferredStyle: .actionSheet)
    
    @IBAction func eyeButton(_ sender: Any) {
        self.present(eyeAlert, animated: true, completion:nil)
    }
    
    @IBAction func verblButton(_ sender: Any) {
        self.present(verbalAlert, animated: true, completion:nil)
    }
    
    @IBAction func motorButton(_ sender: Any) {
        self.present(motorAlert, animated: true, completion:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let mainModel = appDelegate.EmtDocModel.vitals
        
        
        // Eye Alert
        
        eyeAlert.addAction(UIAlertAction(title: "1 : None", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Eye"] = 1
        }))
        
        eyeAlert.addAction(UIAlertAction(title: "2 : Opens to pain, not applied to face", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Eye"] = 2
        }))
        
        eyeAlert.addAction(UIAlertAction(title: "3 : Opens to verbal command, speech, or shout", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Eye"] = 3
        }))
        
        eyeAlert.addAction(UIAlertAction(title: "4 : Spontaneous - open with blinking", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Eye"] = 4
        }))
        
        
        
        // Verbal Alert
        
        verbalAlert.addAction(UIAlertAction(title: "1 : None", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Verbal"] = 1
        }))
        
        verbalAlert.addAction(UIAlertAction(title: "2 : Incomplete nonsensible speech", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Verbal"] = 2
        }))
        
        verbalAlert.addAction(UIAlertAction(title: "3 : Inappropriate responses, words discernible", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Verbal"] = 3
        }))
        
        verbalAlert.addAction(UIAlertAction(title: "4 : Confused conversation, but able to answer questions", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Verbal"] = 4
        }))
        
        verbalAlert.addAction(UIAlertAction(title: "5 : Oriented", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Verbal"] = 5
        }))
        
        
        
        // Motor Alert
        
        motorAlert.addAction(UIAlertAction(title: "1 : None", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Motor"] = 1
        }))
        
        motorAlert.addAction(UIAlertAction(title: "2 : Extensor (rigid) response, decerebrate posture", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Motor"] = 2
        }))
        motorAlert.addAction(UIAlertAction(title: "3 : Abnormal (spastic) flexion, decorticate posture", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Motor"] = 3
        }))
        motorAlert.addAction(UIAlertAction(title: "4 : Withdraws from pain", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Motor"] = 4
        }))
        motorAlert.addAction(UIAlertAction(title: "5 : Purposeful movements to painful stimulus", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Motor"] = 5
        }))
        motorAlert.addAction(UIAlertAction(title: "6 : Obeys commands for movement", style: .default, handler: { (action) in
            //execute some code when this option is selected
            mainModel.glascow["Motor"] = 6
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
