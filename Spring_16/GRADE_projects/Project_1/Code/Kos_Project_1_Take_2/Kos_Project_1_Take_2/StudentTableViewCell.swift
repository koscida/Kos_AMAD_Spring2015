//
//  StudentTableViewCell.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/2/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numDemeritLabel: UILabel!
    @IBOutlet weak var numCheckoutLabel: UILabel!
    
    
    var setFirst = false
    var setLast = false
    
    
    var firstName : String = "" {
        didSet {
            if(firstName != oldValue) {
                setFirst = true
                setName()
            }
        }
    }
    
    var lastName : String = "" {
        didSet {
            if(lastName != oldValue) {
                setLast = true
                setName()
            }
        }
    }
    
    var numDemerit : Int = 0 {
        didSet {
            if(numDemerit != oldValue) {
                numDemeritLabel.text = String(numDemerit)
            }
        }
    }
    
    var numCheckout : Int = 0 {
        didSet {
            if(numCheckout != oldValue) {
                numCheckoutLabel.text = String(numCheckout)
            }
        }
    }
    
    
    func setName() {
        if(setFirst && setLast) {
            nameLabel.text = firstName + " " + lastName
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
