//
//  SecondViewController.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/2/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class EquipmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var equipmentList : EquipmentList = EquipmentList();

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register nib for equipment table cell
        let nib = UINib(nibName: "EquipmentTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "EquipmentCell")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // TABLE VIEW METHODS
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return equipmentList.getTotalEquipment()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EquipmentCell", forIndexPath: indexPath) as! EquipmentTableViewCell
        
        let equipment = equipmentList.equipmentList[indexPath.row]
        cell.name = equipment.name
        cell.checkedOut = equipment.checkedOut
        
        return cell
    }


}

