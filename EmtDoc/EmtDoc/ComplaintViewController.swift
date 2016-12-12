//
//  ComplaintViewController.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class ComplaintViewController: UIViewController {
    var EmtDocModel = EmtDoc()
    

    @IBOutlet weak var txtChiefComplaint: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Get our model singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        // Display chief complain in text field
        txtChiefComplaint.text = EmtDocModel.chiefComplaint
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Save our field on VC disappear
    override func viewDidDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel
        
        mainModel.chiefComplaint = txtChiefComplaint.text!
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
