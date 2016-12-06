//
//  HttpJSON.swift
//  EmtDoc
//
//  Created by Litthideth Phansiri on 12/6/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import Foundation
import Alamofire

func downloadData(completion: @escaping DownloadComplete) {
    
    Alamofire.request(BASE_URL).responseJSON { response in
        
        let resultJSON = response.result
        
        NSLog("resultJSON: \(resultJSON.value as? [Dictionary<String, AnyObject>])")
        
        completion()
        
    }
}
