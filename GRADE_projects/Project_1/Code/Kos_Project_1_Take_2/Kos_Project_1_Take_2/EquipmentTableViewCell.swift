//
//  EquipmentTableViewCell.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/8/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class EquipmentTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkedOutLabel: UILabel!
    
    var name : String = "" {
        didSet {
            if(name != oldValue) {
                nameLabel.text = name
            }
        }
    }
    
    var checkedOut : Bool = false {
        didSet {
            if(nameLabel != oldValue) {
                checkedOutLabel.text = (checkedOut ? "Checked Out" : "Available");
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
