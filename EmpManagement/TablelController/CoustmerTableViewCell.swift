//
//  CoustmerTableViewCell.swift
//  AgeCalculator
//
//  Created by sanjeev gupta on 2019-10-31.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit

class CoustmerTableViewCell: UITableViewCell {

    @IBOutlet var txtCellName: UILabel!
    @IBOutlet var txtCellEmail: UILabel!
    @IBOutlet var txtCellPhone: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
