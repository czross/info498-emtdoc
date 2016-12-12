//
//  Constants.swift
//  EmtDoc
//
//  Created by Litthideth Phansiri on 12/6/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation
import MessageUI


// MARK: - URL

var baseURL = "https://raw.githubusercontent.com/czross/info498-emtdoc/master/JSON/testing.json"
let BASE_URL = URL(string: baseURL)!
typealias DownloadComplete = () -> ()

// MARK: - Email
class Email: MFMailComposeViewController, MFMailComposeViewControllerDelegate {
    
    func prepareEmail() {
        NSLog("Inside prepare Email")
    }
    
    func sendEmail(email: [String]) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(email)
            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: false)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
