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
    
    @IBOutlet weak var mentalStatusLabel: UIButton!
    @IBOutlet weak var skinStatusLabel: UIButton!
    @IBOutlet weak var earStatusLabel: UIButton!
    @IBOutlet weak var pupilStatusLabel: UIButton!
    @IBOutlet weak var noseStatusLabel: UIButton!
    @IBOutlet weak var lungStatusLabel: UIButton!
    @IBOutlet weak var leftUpExtremityLabel: UIButton!
    @IBOutlet weak var rightUpExtremityLabel: UIButton!
    @IBOutlet weak var leftLowExtremityLabel: UIButton!
    @IBOutlet weak var rightLowExtremityLabel: UIButton!
    
    var mentalBool = true
    var skinBool = true
    var earBool = true
    var pupilBool = true
    var noseBool = true
    var lungBool = true
    var leftUpBoo = true
    var rightUpBool = true
    var leftLowBool = true
    var rightLowBool = true

// @IBOutlet weak var mentalStatusTextField: UITextField!
    let mentalAlert = UIAlertController(title: "Mental Status", message: "Please choose status", preferredStyle: .alert)
    @IBOutlet weak var mentalBtn: UIButton!
    
    @IBAction func mentalPress(_ sender: UIButton!) {
        if mentalBool {
            mentalStatusLabel.backgroundColor = UIColor(hexString: "#51CABD")
            mentalBool = false
        } else {
            mentalStatusLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            mentalBool = true
        }
        self.present(mentalAlert, animated: true, completion:nil)
    }

  // @IBOutlet weak var skinTextField: UITextField!
    let skinAlert = UIAlertController(title: "Skin Status", message: "Please choose status", preferredStyle: .alert)
  
    @IBOutlet weak var skinBtn: UIButton!
    
    @IBAction func skinPress(_ sender: AnyObject) {
        if skinBool {
            skinStatusLabel.backgroundColor = UIColor(hexString: "#51CABD")
            skinBool = false
        } else {
            skinStatusLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            skinBool = true
        }
        self.present(skinAlert, animated: true, completion:nil)
    }
    
    
    
  @IBOutlet weak var headTextField: UITextField!
    
    let pupilAlert = UIAlertController(title: "Pupil Status", message: "Please choose status", preferredStyle: .alert)
  
    @IBOutlet weak var pupilsBtn: UIButton!
    
    @IBAction func pupilPress(_ sender: AnyObject) {
        if pupilBool {
            pupilStatusLabel.backgroundColor = UIColor(hexString: "#51CABD")
            pupilBool = false
        } else {
            pupilStatusLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            pupilBool = true
        }
        self.present(pupilAlert, animated: true, completion:nil)
    }
    
    let earsAlert = UIAlertController(title: "Ear Status", message: "Please choose status", preferredStyle: .alert)
    
    @IBOutlet weak var earsBtn: UIButton!
    
    @IBAction func earPress(_ sender: AnyObject) {
        if earBool {
            earStatusLabel.backgroundColor = UIColor(hexString: "#51CABD")
            earBool = false
        } else {
            earStatusLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            earBool = true
        }
        self.present(earsAlert, animated: true, completion:nil)
    }
    
  
  @IBOutlet weak var throatTextField: UITextField!
  
    let noseAlert = UIAlertController(title: "Nose Status", message: "Please choose status", preferredStyle: .alert)

    @IBOutlet weak var noseBtn: UIButton!
    
    @IBAction func nosePress(_ sender: AnyObject) {
        if noseBool {
            noseStatusLabel.backgroundColor = UIColor(hexString: "#51CABD")
            noseBool = false
        } else {
            noseStatusLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            noseBool = true
        }
        self.present(noseAlert, animated: true, completion:nil)
    }
  
  @IBOutlet weak var heartSoundsTextField: UITextField!
    
     let lungAlert = UIAlertController(title: "Lung Status", message: "Please choose status", preferredStyle: .alert)
  
    @IBOutlet weak var lungsBtn: UIButton!
    
    @IBAction func lungPress(_ sender: AnyObject) {
        if lungBool {
            lungStatusLabel.backgroundColor = UIColor(hexString: "#51CABD")
            lungBool = false
        } else {
            lungStatusLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            lungBool = true
        }
        self.present(lungAlert, animated: true, completion:nil)
    }
  
  @IBOutlet weak var abdomenTextField: UITextField!
  
  @IBOutlet weak var pelvicTextField: UITextField!
    
    let lUpExtAlert = UIAlertController(title: "Left Upper Extremity Status", message: "Please choose status", preferredStyle: .alert)
  
    @IBOutlet weak var leftUpperExtBtn: UIButton!
    
    @IBAction func lUpExtPress(_ sender: AnyObject) {
        if leftUpBoo {
            leftUpExtremityLabel.backgroundColor = UIColor(hexString: "#51CABD")
            leftUpBoo = false
        } else {
            leftUpExtremityLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            leftUpBoo = true
        }
        self.present(lUpExtAlert, animated: true, completion:nil)
    }
  
    let rUpExtAlert = UIAlertController(title: "Right Upper Extremity Status", message: "Please choose status", preferredStyle: .alert)
    
    @IBOutlet weak var rightUpperExtBtn: UIButton!
    
    @IBAction func rUpExtPress(_ sender: AnyObject) {
        if rightUpBool {
            rightUpExtremityLabel.backgroundColor = UIColor(hexString: "#51CABD")
            rightUpBool = false
        } else {
            rightUpExtremityLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            rightUpBool = true
        }
        self.present(rUpExtAlert, animated: true, completion:nil)
    }
    
    let lLoExtAlert = UIAlertController(title: "Left Lower Extremity Status", message: "Please choose status", preferredStyle: .alert)
  
    @IBOutlet weak var leftLowerExtBtn: UIButton!
    
    @IBAction func lLoExtPress(_ sender: AnyObject) {
        if leftLowBool {
            leftLowExtremityLabel.backgroundColor = UIColor(hexString: "#51CABD")
            leftLowBool = false
        } else {
            leftLowExtremityLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            leftLowBool = true
        }
        self.present(lLoExtAlert, animated: true, completion:nil)
    }
  
    let rLoExtAlert = UIAlertController(title: "Right Lower Extremity Status", message: "Please choose status", preferredStyle: .alert)
    
    @IBOutlet weak var rightLowerExtBtn: UIButton!
    
    @IBAction func rLoExtPress(_ sender: AnyObject) {
        if rightLowBool {
            rightLowExtremityLabel.backgroundColor = UIColor(hexString: "#51CABD")
            rightLowBool = false
        } else {
            rightLowExtremityLabel.backgroundColor = UIColor(hexString: "#A8F4EC")
            rightLowBool = true
        }
        self.present(rLoExtAlert, animated: true, completion:nil)
    }
  
  @IBOutlet weak var neuroTextField: UITextField!
  
    @IBAction func updateBtnClicked(_ sender: AnyObject) {
        exam.facial["throat"] = throatTextField.text!
        //    exam.facial["nose"] = noseTextField.text!
        exam.facial["head"] = headTextField.text!
        //    exam.chest["lungs"] = lungsTextField.text!
        exam.chest["heartSounds"] = heartSoundsTextField.text!
        exam.abdomen = abdomenTextField.text!
        exam.pelvic = pelvicTextField.text!
        exam.neuro = neuroTextField.text!
        _ = navigationController?.popViewController(animated: true)
    }
    
//  @IBAction func updateButtonClicked(_ sender: Any) {
//    let exam = EmtDocModel.exam
////    exam.mentalStatus = mentalStatusTextField.text!
////    exam.skin = skinTextField.text!
////    exam.facial["pupils"] = pupilsTextField.text!
////    exam.facial["ears"] headTextFieldld.text!
//    exam.facial["throat"] = throatTextField.text!
////    exam.facial["nose"] = noseTextField.text!
//    exam.facial["head"] = headTextField.text!
////    exam.chest["lungs"] = lungsTextField.text!
//    exam.chest["heartSounds"] = heartSoundsTextField.text!
//    exam.abdomen = abdomenTextField.text!
//    exam.pelvic = pelvicTextField.text!
//    exam.neuro = neuroTextField.text!
////    exam.extremities["leftLower"] = leftLowerExtremityTextField.text!
////    exam.extremities["rightLower"] = rightLowerExtremityTextField.text!
////    exam.extremities["leftUpper"] = leftUpperExtremityTextField.text!
////    exam.extremities["rightUpper"] = rightUpperExtremityTextField.text!
//  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        EmtDocModel = appDelegate.EmtDocModel
        exam = EmtDocModel.exam
        self.hideKeyboardWhenTappedAround()

        for index in 0...exam.mentalStatusChoices.count - 1 {
            mentalAlert.addAction(UIAlertAction(title: "\(exam.mentalStatusChoices[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.mentalStatus = self.exam.mentalStatusChoices[index]
                self.mentalBtn.setTitle((self.exam.mentalStatus), for: .normal)
            }))
        }
        
        for index in 1...exam.skinChoices.count - 1 {
            skinAlert.addAction(UIAlertAction(title: "\(exam.skinChoices[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.skin = self.exam.skinChoices[index]
                self.skinBtn.setTitle((self.exam.skin), for: .normal)
            }))
        }
    
        
        let pupilArray = exam.facialChoices["pupils"]!
        for index in 0...pupilArray.count - 1 {
            pupilAlert.addAction(UIAlertAction(title: "\(pupilArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["pupils"] = pupilArray[index]
                self.pupilsBtn.setTitle((self.exam.facial["pupils"]), for: .normal)
            }))
        }
        
        let earArray = exam.facialChoices["ears"]!
        for index in 0...earArray.count - 1 {
            earsAlert.addAction(UIAlertAction(title: "\(earArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["ears"] = earArray[index]
                self.earsBtn.setTitle((self.exam.facial["ears"]), for: .normal)
            }))
        }
        
        let noseArray = exam.facialChoices["nose"]!
        for index in 0...noseArray.count - 1 {
            noseAlert.addAction(UIAlertAction(title: "\(noseArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["nose"] = noseArray[index]
                self.noseBtn.setTitle((self.exam.facial["nose"]), for: .normal)
            }))
        }
        
        let lungArray = exam.chestChoices["lungs"]!
        for index in 0...lungArray.count - 1 {
            lungAlert.addAction(UIAlertAction(title: "\(lungArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.facial["lungs"] = lungArray[index]
                self.lungsBtn.setTitle((self.exam.facial["lungs"]), for: .normal)
            }))
        }
        
        let extArray = exam.extremityChoices["leftUpper"]!
        for index in 0...extArray.count - 1 {
            lUpExtAlert.addAction(UIAlertAction(title: "\(extArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.extremities["leftUpper"] = extArray[index]
                self.leftUpperExtBtn.setTitle((self.exam.extremities["leftUpper"]), for: .normal)
            }))
        }
        
        for index in 0...extArray.count - 1 {
            rUpExtAlert.addAction(UIAlertAction(title: "\(extArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.extremities["rightUpper"] = extArray[index]
                self.rightUpperExtBtn.setTitle((self.exam.extremities["rightUpper"]), for: .normal)
            }))
        }
        
        for index in 0...extArray.count - 1 {
            lLoExtAlert.addAction(UIAlertAction(title: "\(extArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.extremities["leftLower"] = extArray[index]
                self.leftLowerExtBtn.setTitle((self.exam.extremities["leftLower"]), for: .normal)
            }))
        }
        
        for index in 0...extArray.count - 1 {
            rLoExtAlert.addAction(UIAlertAction(title: "\(extArray[index])", style: .default, handler: { (action) in
                //execute some code when this option is selected
                self.exam.extremities["rightLower"] = extArray[index]
                self.rightLowerExtBtn.setTitle((self.exam.extremities["rightLower"]), for: .normal)
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
