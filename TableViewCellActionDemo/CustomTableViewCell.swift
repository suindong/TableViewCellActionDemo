//
//  CustomTableViewCell.swift
//  TableViewCellActionDemo
//
//  Created by Dong on 2018/3/10.
//  Copyright © 2018年 Dong. All rights reserved.
//

import UIKit

public enum StepperStatus {
    case plus, minus
}

class CustomTableViewCell: UITableViewCell {
    
    open var stepperChanged: ((StepperStatus) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        if sender.value == 0 {
            stepperChanged?(.minus)
        } else {
            stepperChanged?(.plus)
        }
        sender.value = 1
    }
}
