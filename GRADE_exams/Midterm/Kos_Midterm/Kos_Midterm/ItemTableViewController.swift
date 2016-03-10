//
//  ItemTableViewController.swift
//  Kos_Midterm
//
//  Created by Brittany Ann Kos on 3/10/16.
//  Copyright © 2016 Brittany Ann Kos. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {

    var store = Store()
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return store.itemsList.count
        return store.itemsList.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("storeListCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = store.itemsList[indexPath.row]
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // delete from object
            store.itemsList.removeAtIndex(indexPath.row)
            
            
            // persist data in plist
            let path = NSBundle.mainBundle().pathForResource("stores", ofType: "plist")
            let stores_ns = (stores as NSArray) as NSArray
            stores_ns.writeToFile(path!, atomically: true)
            
            
            // Delete from view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


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
    }
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        
        if segue.identifier == "saveItemSegue"{
            let source = segue.sourceViewController as! AddViewController
            
            // if not empty, add to table and object
            if ((source.addedItem.isEmpty) == false){
                // add t object
                store.itemsList.append(source.addedItem)
                
                
                // persist data in plist
                let path = NSBundle.mainBundle().pathForResource("stores", ofType: "plist")
                let stores_ns = (stores as NSArray) as NSArray
                stores_ns.writeToFile(path!, atomically: true)
                
                
                // add to table
                tableView.reloadData()
            }
            
            
            
        } 
    }

}
