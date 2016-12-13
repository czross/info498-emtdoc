//
//  ExamViewController.swift
//  EmtDoc
//
//  Created by phansiri on 12/11/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class ExamViewController: UIViewController {
    
    var EmtDocModel = EmtDoc()

  // @IBOutlet weak var mentalStatusTextField: UITextField!
    let mentalAlert = UIAlertController(title: "Mental Status", message: "Please choose status", preferredStyle: .actionSheet)
    
    @IBAction func mentalButton(_ sender: AnyObject) {
        self.present(mentalAlert, animated: true, completion:nil)
    }

  // @IBOutlet weak var skinTextField: UITextField!
    let skinAlert = UIAlertController(title: "Skin Status", message: "Please choose status", preferredStyle: .actionSheet)
  
    @IBAction func skinButton(_ sender: AnyObject) {
        self.present(skinAlert, animated: true, completion:nil)
    }
    
    for index in 1...glascowDscp.eyeDscp.keys.count - 1 {
    eyeAlert.addAction(UIAlertAction(title: "\(index) : \((glascowDscp.eyeDscp[index])!)", style: .default, handler: { (action) in
    //execute some code when this option is selected
    mainModel.glascow["Eye"] = index
    self.eyeButton.setTitle((glascowDscp.eyeDscp[index])!, for: .normal)
    }))
    }
    
  @IBOutlet weak var headTextField: UITextField!
  
  @IBOutlet weak var pupilsTextField: UITextField!
  
  @IBOutlet weak var earsTextField: UITextField!
  
  @IBOutlet weak var throatTextField: UITextField!
  
  @IBOutlet weak var noseTextField: UITextField!
  
  @IBOutlet weak var heartSoundsTextField: UITextField!
  
  @IBOutlet weak var lungsTextField: UITextField!
  
  @IBOutlet weak var abdomenTextField: UITextField!
  
  @IBOutlet weak var pelvicTextField: UITextField!
  
  @IBOutlet weak var leftUpperExtremityTextField: UITextField!
  
  @IBOutlet weak var rightUpperExtremityTextField: UITextField!
  
  @IBOutlet weak var leftLowerExtremityTextField: UITextField!
  
  @IBOutlet weak var rightLowerExtremityTextField: UITextField!
  
  @IBOutlet weak var neuroTextField: UITextField!
  
  @IBAction func updateButtonClicked(_ sender: Any) {
    let exam = EmtDocModel.exam
    exam.mentalStatus = mentalStatusTextField.text!
    exam.skin = skinTextField.text!
    exam.facial["pupils"] = pupilsTextField.text!
    exam.facial["ears"] = earsTextField.text!
    exam.facial["throat"] = throatTextField.text!
    exam.facial["nose"] = noseTextField.text!
    exam.facial["head"] = headTextField.text!
    exam.chest["lungs"] = lungsTextField.text!
    exam.chest["heartSounds"] = heartSoundsTextField.text!
    exam.abdomen = abdomenTextField.text!
    exam.pelvic = pelvicTextField.text!
    exam.neuro = neuroTextField.text!
    exam.extremities["leftLower"] = leftLowerExtremityTextField.text!
    exam.extremities["rightLower"] = rightLowerExtremityTextField.text!
    exam.extremities["leftUpper"] = leftUpperExtremityTextField.text!
    exam.extremities["rightUpper"] = rightUpperExtremityTextField.text!
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        EmtDocModel = appDelegate.EmtDocModel

        // Do any additional setup after loading the view.
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
