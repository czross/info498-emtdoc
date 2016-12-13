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
    var exam = EmtDoc().exam

// @IBOutlet weak var mentalStatusTextField: UITextField!
    let mentalAlert = UIAlertController(title: "Mental Status", message: "Please choose status", preferredStyle: .actionSheet)
    @IBOutlet weak var mentalBtn: UIButton!
    
    @IBAction func mentalPress(_ sender: UIButton!) {
        self.present(mentalAlert, animated: true, completion:nil)
    }

  // @IBOutlet weak var skinTextField: UITextField!
    let skinAlert = UIAlertController(title: "Skin Status", message: "Please choose status", preferredStyle: .actionSheet)
  
    @IBOutlet weak var skinBtn: UIButton!
    
    @IBAction func skinPress(_ sender: AnyObject) {
        self.present(skinAlert, animated: true, completion:nil)
    }
    
    
    
  @IBOutlet weak var headTextField: UITextField!
    
    let pupilAlert = UIAlertController(title: "Pupil Status", message: "Please choose status", preferredStyle: .actionSheet)
  
    @IBOutlet weak var pupilsBtn: UIButton!
    
    @IBAction func pupilPress(_ sender: AnyObject) {
        self.present(pupilAlert, animated: true, completion:nil)
    }
    
    let earsAlert = UIAlertController(title: "Ear Status", message: "Please choose status", preferredStyle: .actionSheet)
    
    @IBOutlet weak var earsBtn: UIButton!
    
    @IBAction func earPress(_ sender: AnyObject) {
        self.present(earsAlert, animated: true, completion:nil)
    }
    
  
  @IBOutlet weak var throatTextField: UITextField!
  
    let noseAlert = UIAlertController(title: "Nose Status", message: "Please choose status", preferredStyle: .actionSheet)

    @IBOutlet weak var noseBtn: UIButton!
    
    @IBAction func nosePress(_ sender: AnyObject) {
        self.present(noseAlert, animated: true, completion:nil)
    }
  
  @IBOutlet weak var heartSoundsTextField: UITextField!
    
     let lungAlert = UIAlertController(title: "Lung Status", message: "Please choose status", preferredStyle: .actionSheet)
  
    @IBOutlet weak var lungsBtn: UIButton!
    
    @IBAction func lungPress(_ sender: AnyObject) {
        self.present(lungAlert, animated: true, completion:nil)
    }
  
  @IBOutlet weak var abdomenTextField: UITextField!
  
  @IBOutlet weak var pelvicTextField: UITextField!
  
  @IBOutlet weak var leftUpperExtremityTextField: UITextField!
  
  @IBOutlet weak var rightUpperExtremityTextField: UITextField!
  
  @IBOutlet weak var leftLowerExtremityTextField: UITextField!
  
  @IBOutlet weak var rightLowerExtremityTextField: UITextField!
  
  @IBOutlet weak var neuroTextField: UITextField!
  
  @IBAction func updateButtonClicked(_ sender: Any) {
    let exam = EmtDocModel.exam
//    exam.mentalStatus = mentalStatusTextField.text!
//    exam.skin = skinTextField.text!
//    exam.facial["pupils"] = pupilsTextField.text!
//    exam.facial["ears"] headTextFieldld.text!
    exam.facial["throat"] = throatTextField.text!
//    exam.facial["nose"] = noseTextField.text!
    exam.facial["head"] = headTextField.text!
//    exam.chest["lungs"] = lungsTextField.text!
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
        exam = EmtDocModel.exam
        self.hideKeyboardWhenTappedAround()

        for index in 0...exam.mentalStatusChoices.count {
            mentalAlert.addAction(UIAlertAction(title: "\(exam.mentalStatusChoices[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.mentalStatus = self.exam.mentalStatusChoices[index]
                self.mentalBtn.setTitle((self.exam.mentalStatus), for: .normal)
            }))
        }
        
        for index in 0...exam.skinChoices.count {
            mentalAlert.addAction(UIAlertAction(title: "\(exam.skinChoices[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.mentalStatus = self.exam.skinChoices[index]
                self.skinBtn.setTitle((self.exam.skin), for: .normal)
            }))
        }
        
        for index in 0...exam.skinChoices.count {
            mentalAlert.addAction(UIAlertAction(title: "\(exam.skinChoices[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.mentalStatus = self.exam.skinChoices[index]
                self.skinBtn.setTitle((self.exam.skin), for: .normal)
            }))
        }
        
        let pupilArray = exam.facialChoices["pupils"]!
        for index in 0...pupilArray.count {
            mentalAlert.addAction(UIAlertAction(title: "\(pupilArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["pupils"] = pupilArray[index]
                self.pupilsBtn.setTitle((self.exam.facial["pupils"]), for: .normal)
            }))
        }
        
        let earArray = exam.facialChoices["Ears"]!
        for index in 0...earArray.count {
            mentalAlert.addAction(UIAlertAction(title: "\(earArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["Ears"] = earArray[index]
                self.earsBtn.setTitle((self.exam.facial["Ears"]), for: .normal)
            }))
        }
        
        let noseArray = exam.facialChoices["Nose"]!
        for index in 0...noseArray.count {
            mentalAlert.addAction(UIAlertAction(title: "\(noseArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["Nose"] = noseArray[index]
                self.earsBtn.setTitle((self.exam.facial["Nose"]), for: .normal)
            }))
        }
        
        let lungArray = exam.chestChoices["Lungs"]!
        for index in 0...lungArray.count {
            mentalAlert.addAction(UIAlertAction(title: "\(lungArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["Lungs"] = lungArray[index]
                self.earsBtn.setTitle((self.exam.facial["Lungs"]), for: .normal)
            }))
        }

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
