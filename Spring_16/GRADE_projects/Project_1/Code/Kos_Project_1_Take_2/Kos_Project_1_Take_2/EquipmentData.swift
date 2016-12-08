//
//  EquipmentData.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/8/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit

class EquipmentData {
    
    private(set) var id : String = "";
    private(set) var name : String = "";
    // TODO checkedOut
    private(set) var checkedOut: Bool = false;
    
    
    init(equipmentData: [String : AnyObject]) {
        id      = equipmentData["id"] as! String;
        name    = equipmentData["name"] as! String;
    }
    
}