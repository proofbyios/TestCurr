//
//  PrivatBankTableViewCell.swift
//  TestCurr
//
//  Created by Alex on 1/23/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit

class PrivatBankTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencySymbolLabel: UILabel!
    @IBOutlet weak var currencyBuyLabel: UILabel!
    @IBOutlet weak var currencySellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
