//
//  NBUTableViewCell.swift
//  TestCurr
//
//  Created by Alex on 1/23/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class NBUTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var currencyIncomeLabel: UILabel!
    @IBOutlet weak var currencyOutcomeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
