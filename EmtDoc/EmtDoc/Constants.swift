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


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
