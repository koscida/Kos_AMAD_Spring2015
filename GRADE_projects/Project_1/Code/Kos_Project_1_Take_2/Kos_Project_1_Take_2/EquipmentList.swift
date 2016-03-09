//
//  EquipmentList.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/8/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit

class EquipmentList {
    
    private (set) var equipmentList : [EquipmentData] = []
    
    init(path: String) {
        
        // create tmp to store whole db
        var db : [String : [AnyObject]]!
        
        // get db
        db = NSDictionary(contentsOfFile: path) as! [String : [AnyObject]]
        
        // just get equipment
        var db_equipment : [[String : AnyObject]]!
        db_equipment = db["equipment"] as! [[String : AnyObject]]
        //print(db_equipment)
        
        // loop through and create new equipment
        for eq in db_equipment {
            equipmentList.append( EquipmentData(equipmentData: eq) );
        }
        
    }
    
    init() {}
    
    func addEquipment(equipment: EquipmentData) {
        // TODO: test for double equipment
        if(true) {
            equipmentList.append(equipment)
            saveEquipmentList();
        }
    }
    
    func saveEquipmentList() {
        // TODO save to plist
    }
    
    func getTotalEquipment() -> Int {
        return equipmentList.count
    }
    
}