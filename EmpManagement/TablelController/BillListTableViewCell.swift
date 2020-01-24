//
//  BillListTableViewCell.swift
//  AgeCalculator
//
//  Created by sanjeev gupta on 2019-11-05.
//  Copyright © 2019 sanjeev gupta. All rights reserved.
//

import UIKit

class BillListTableViewCell: UITableViewCell {
    @IBOutlet var txtpnameMin: UILabel!
    @IBOutlet var txtcpmMin: UILabel!
    @IBOutlet var txtpminconsumedMin: UILabel!
    @IBOutlet var viewMin: UIView!
    @IBOutlet var viewGb: UIView!
    @IBOutlet var viewHydro: UIView!
    @IBOutlet var txtpnameGb: UILabel!
    @IBOutlet var txtgconsumedGb: UILabel!
    @IBOutlet var txtdate: UILabel!
    
    @IBOutlet var txtpucHydro: UILabel!
    @IBOutlet var txtuconsumedHydro: UILabel!
    @IBOutlet var txtanameHydro: UILabel!
    @IBOutlet var txtcpgGb: UILabel!
    
    @IBOutlet var txtbillidlist: UILabel!
    
    @IBOutlet var txtcidbill: UILabel!
    
    @IBOutlet var txttotalbill: UILabel!
    @IBOutlet var txtbillemail: UILabel!
    
    @IBOutlet var txtbilltype: UILabel!
    @IBOutlet var txtphonenobill: UILabel!
    @IBOutlet var txtbillname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
