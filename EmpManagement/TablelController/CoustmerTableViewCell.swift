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
    @IBOutlet var profileimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // self.profileimage.layer.cornerRadius = profileimage.bounds.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.profileimage.layer.cornerRadius = profileimage.bounds.width/2
        // Configure the view for the selected state
    }

}
