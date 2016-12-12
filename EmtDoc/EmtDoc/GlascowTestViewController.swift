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
    
    @IBOutlet weak var eyeButton: UIButton!
    @IBOutlet weak var verbalButton: UIButton!
    @IBOutlet weak var motorButton: UIButton!
    
    
    @IBAction func eyeButton(_ sender: Any) {
        self.present(eyeAlert, animated: true, completion:nil)
    }
    
    @IBAction func verbalButton(_ sender: Any) {
        self.present(verbalAlert, animated: true, completion:nil)
    }
    @IBAction func motorButton(_ sender: Any) {
        self.present(motorAlert, animated: true, completion:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get our glascow descriptions
        let glascowDscp = GlascowDscp()
        
        // Get our saved model
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.vitals
        
        // Set Button labels based on current model
        eyeButton.setTitle(glascowDscp.eyeDscp[mainModel.glascow["Eye"]!], for: .normal)
        verbalButton.setTitle(glascowDscp.verbalDscp[mainModel.glascow["Verbal"]!], for: .normal)
        motorButton.setTitle(glascowDscp.motorDscp[mainModel.glascow["Motor"]!], for: .normal)
        
        // Eye Alert
        for index in 1...glascowDscp.eyeDscp.keys.count - 1 {
            eyeAlert.addAction(UIAlertAction(title: "\(index) : \((glascowDscp.eyeDscp[index])!)", style: .default, handler: { (action) in
                //execute some code when this option is selected
                mainModel.glascow["Eye"] = index
                self.eyeButton.setTitle((glascowDscp.eyeDscp[index])!, for: .normal)
            }))
        }
        
        // Verbal Alert
        for index in 1...glascowDscp.verbalDscp.keys.count - 1 {
            verbalAlert.addAction(UIAlertAction(title: "\(index) : \((glascowDscp.verbalDscp[index])!)", style: .default, handler: { (action) in
                //execute some code when this option is selected
                mainModel.glascow["Verbal"] = index
                self.verbalButton.setTitle((glascowDscp.verbalDscp[index])!, for: .normal)
            }))
        }
        
        // Motor Alert
        for index in 1...glascowDscp.motorDscp.keys.count - 1 {
            motorAlert.addAction(UIAlertAction(title: "\(index) : \((glascowDscp.motorDscp[index])!)", style: .default, handler: { (action) in
                //execute some code when this option is selected
                mainModel.glascow["Motor"] = index
                self.motorButton.setTitle((glascowDscp.motorDscp[index])!, for: .normal)
            }))
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
