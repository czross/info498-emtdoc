//
//  HomeTableViewController.swift
//  EmtDoc
//
//  Created by iGuest on 12/6/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import MessageUI

class HomeTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    var EmtDocModel = EmtDoc()
//    var email = Email()
    var hospitals: [Dictionary<String,String>]?
    // hospitals array of array structure: [["name": "", "email": ""],[...],[...]]
    
    let confirmAlert = UIAlertController(title: "Are you sure?", message: "Once information is sent, you will no longer be able to make changes to current patient", preferredStyle: .alert)
    
    let failEmailAlert = UIAlertController(title: "This device is not configured to send e-mails", message: "Patient information is still available locally.", preferredStyle: .alert)
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBAction func sendEmailButton(_ sender: UIBarButtonItem) {
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        // If we have a hospital selected, generate email and send
        if appDelegate.EmtDocModel.selectedHospital != nil {
            self.present(confirmAlert, animated: true, completion:nil)
            
        } else {
            NSLog("No Hosptial Checked")
            let checkAction = UIAlertController(title: "Hospital", message: "No hospital designated", preferredStyle: .alert)
            let checkOk = UIAlertAction(title: "Select", style: .default) { (_) in
                self.performSegue(withIdentifier: "HospitalTableViewController", sender: nil)
            }
            checkAction.addAction(checkOk)
            self.present(checkAction, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - Email set up
    
    func sendEmail(email: [String]) {
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        // Check to see if device can send mail
        if MFMailComposeViewController.canSendMail() {
            
            // If it can, generate email
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(email)
            NSLog("Email sending data to: \(email)")
            mail.setSubject("Testing EmtDoc")
            let message = "Chief Complaint: \(EmtDocModel.chiefComplaint)\nGender: \(EmtDocModel.person.gender), Age: \(EmtDocModel.person.age), Weight: \(EmtDocModel.person.weight)\n"
            mail.setMessageBody(message, isHTML: false)
            
            // Present email sender
            present(mail, animated: true)
        } else {
            self.present(failEmailAlert, animated: true, completion:nil)
            // show failure alert
        }
        //to test the MessageBody string
        let message = "Chief Complaint: \(EmtDocModel.chiefComplaint)\nGender: \(EmtDocModel.person.gender), Age: \(EmtDocModel.person.age), Weight: \(EmtDocModel.person.weight)\n"
        print (message)
        /// Regardless of if it can or can't, write person to memory and clear peron
        JsonIO.writePerson(person: EmtDocModel.person)
        appDelegate.clearModel()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    var options : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.EmtDocModel = appDelegate.EmtDocModel
        
        options = self.EmtDocModel.mainChoices
        
        // Email unable to be sent alert
        failEmailAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            //execute some code when this option is selected
            self.dismiss(animated: true, completion: nil)
        }))
        
        // We click confirm
        confirmAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action) in
            // Pop to root
            _ = self.navigationController?.popToRootViewController(animated: true)
            let tempEmail = appDelegate.EmtDocModel.selectedHospital?["email"]
            let emailString = "\(tempEmail!)"
            let arrayEmail: [String] = [emailString]
            NSLog("temp Email \(arrayEmail)")
            // Send Email
            self.sendEmail(email: arrayEmail)
        }))
        
        confirmAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            //execute some code when this option is selected
            self.dismiss(animated: true, completion: nil)
        }))
        
        
        
        // testing http function downloadData
        updateHospitalData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Http helper functions
    
    // grabs the hotel json object from github and stores it into a local variable
    func downloadData(completed: @escaping DownloadComplete) {
        Alamofire.request(BASE_URL).responseJSON { response in
//            NSLog("inside alamofire")
            let result = response.result
            NSLog("HTTP Request: \(result)")
            if let hospitalList = result.value as? [Dictionary<String, String>] {
                self.hospitals = hospitalList
            }
            completed()
        }
        
    }
    
    func updateHospitalData() {
        self.hospitals?.removeAll()
        downloadData {
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return options.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeTableViewCell

        // Configure the cell...
        cell.titleLabel.text = options[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let choice = options[indexPath.row]
        if indexPath.row == 0 {
            performSegue(withIdentifier: "ComplaintViewController", sender: nil)
        } else if indexPath.row == 1 {
            performSegue(withIdentifier: "VitalsViewController", sender: nil)
        } else if indexPath.row == 2 {
            performSegue(withIdentifier: "ExamViewController", sender: nil)
        } else if indexPath.row == 3 {
            performSegue(withIdentifier: "ProcedureViewController", sender: nil)
        }
            
        NSLog("Choice picked: \(choice)")
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ComplaintViewController" {
            if segue.destination is ComplaintViewController { }
        } else if segue.identifier == "VitalsViewController" {
            if segue.destination is VitalsViewController { }
        } else if segue.identifier == "ExamViewController" {
            if segue.destination is ExamViewController { }
        } else if segue.identifier == "ProcedureViewController" {
            if segue.destination is ProcedureViewController { }
        } else if segue.identifier == "HospitalTableViewController" {
            if let destination = segue.destination as? HospitalTableViewController {
                destination.hospitals = self.hospitals
            }
        }
    }
    

}
