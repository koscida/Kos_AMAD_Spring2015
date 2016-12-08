//
//  StoresTableViewController.swift
//  Kos_Midterm
//
//  Created by Brittany Ann Kos on 3/10/16.
//  Copyright © 2016 Brittany Ann Kos. All rights reserved.
//

import UIKit

class StoresTableViewController: UITableViewController {

    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        
        //use a NSBundle object of the directory for our application to
        let path = NSBundle.mainBundle().pathForResource("stores", ofType: "plist")
        
        //load the data of the plist file into the dictionary
        // load into temp list
        var tmp_stores : [String : [String]];
        tmp_stores = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        //print(tmp_stores)
        
        // process temp list
        for s in tmp_stores {
            let new_store = Store();
            new_store.storeName = s.0 as! String
            new_store.itemsList = s.1 as! [String]
            stores.append(new_store)
        }
        //print(stores);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("storeCell", forIndexPath: indexPath)

        cell.textLabel?.text = stores[indexPath.row].storeName
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "showItemsList") {
            let destination = segue.destinationViewController as! ItemTableViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
            
            destination.store = stores[indexPath!.row]
            destination.stores = stores
        }
    }
    

}
