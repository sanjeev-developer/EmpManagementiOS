//
//  EmpDescTabelTableViewCell.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit

class EmpDescTabelTableViewCell: UITableViewCell {

    @IBOutlet var txt_plate: UILabel!
    @IBOutlet var img_vehicle: UIImageView!
    @IBOutlet var txt_year: UILabel!
    @IBOutlet var txt_Model: UILabel!
    @IBOutlet var txt_company: UILabel!
    @IBOutlet var txt_title_type: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
