//
//  VehicleListTableViewCell.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2019-11-15.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit

class VehicleListTableViewCell: UITableViewCell {
    @IBOutlet var txt_vehicle_type: UILabel!
    @IBOutlet var txt_vehicle_plate: UILabel!
    @IBOutlet var txt_vehicle_model: UILabel!
    
    @IBOutlet var img_list: UIImageView!
    @IBOutlet var txt_comapny: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
