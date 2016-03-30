//
//  DetailViewController.swift
//  Kos_Lab_3
//
//  Created by Brittany Kos on 2/15/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var cookies = [String]()
    var selectedCookieCategory = 0
    var cookieListDetail = Cookies()
    
    override func viewWillAppear(animated: Bool) {
        
        // we do this becasue we aren't actually sending the data, but only the selected category
        // we reload all the data again once we get to this detail view, or something . . .
        cookieListDetail.cookieCategories = Array(cookieListDetail.allCookieData.keys)
        
        let chosenCookieCategory = cookieListDetail.cookieCategories[selectedCookieCategory]
        
        cookies = cookieListDetail.allCookieData[chosenCookieCategory]! as [String]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // want to edit
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
        return cookies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = cookies[indexPath.row]
        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    
    
    
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //Delete the country from the array
            cookies.removeAtIndex(indexPath.row)
            let chosenCookieCategory = cookieListDetail.cookieCategories[selectedCookieCategory]
            
            //Delete from the data model
            cookieListDetail.allCookieData[chosenCookieCategory]?.removeAtIndex(indexPath.row)
            
            // Delete the row from the table
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let fromRow = fromIndexPath.row //row being moved from
        let toRow = toIndexPath.row //row being moved to
        let moveCountry = cookies[fromRow] //country being moved
        
        //move in array
        cookies.removeAtIndex(fromRow)
        cookies.insert(moveCountry, atIndex: toRow)
        
        //move in data model
        let chosenCookieCategory = cookieListDetail.cookieCategories[selectedCookieCategory]
        cookieListDetail.allCookieData[chosenCookieCategory]?.removeAtIndex(fromRow)
        cookieListDetail.allCookieData[chosenCookieCategory]?.insert(moveCountry, atIndex: toRow)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        
        if segue.identifier == "doneAddingCookieSegue"{
            let source = segue.sourceViewController as! AddCookieViewController
            
            //only add a country if there is text in the textfield
            if ((source.addedCookie.isEmpty) == false){
                cookies.append(source.addedCookie)
                tableView.reloadData()
                
                let chosenCookieCategory = cookieListDetail.cookieCategories[selectedCookieCategory]
                cookieListDetail.allCookieData[chosenCookieCategory]?.append(source.addedCookie)
            }
        }
        
    }

}
