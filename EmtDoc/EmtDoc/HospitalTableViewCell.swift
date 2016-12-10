//
//  HospitalTableViewCell.swift
//  EmtDoc
//
//  Created by Brian Ross on 12/8/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit

class HospitalTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
