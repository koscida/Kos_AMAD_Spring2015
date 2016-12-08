//
//  ViewController.swift
//  Kos_Lab_3
//
//  Created by Brittany Kos on 2/15/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var cookiesFromPlist = Cookies()
    let kfilename = "cookies.plist"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let path:String?
        let filePath = docFilePath(kfilename) //path to data file
        
        //if the data file exists, use it
        if NSFileManager.defaultManager().fileExistsAtPath(filePath!){
            path = filePath
            print(path)
        }
        else {
            // get path for plist
            path = NSBundle.mainBundle().pathForResource("cookies", ofType: "plist")
            print(path)
        }
        
        // store plist data into cookiesFromPlist's allCookieData (this will only be the sub-cookies' names
        cookiesFromPlist.allCookieData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        
        // store the names of the categories (keys) into cookiesFromPlist's cookieCategories
        cookiesFromPlist.cookieCategories = Array(cookiesFromPlist.allCookieData.keys)
    }
    
    // # rows in section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookiesFromPlist.allCookieData.count
    }
    
    // display table cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // configure cell
        let cell = tableView.dequeueReusableCellWithIdentifier("CellId", forIndexPath: indexPath)
        
        // name the cell the cookie category names
        cell.textLabel?.text = cookiesFromPlist.cookieCategories[indexPath.row]
        
        // do things
        return cell
    }
    
    
    
    // MARK: Segue
    // from detail view
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "cookieDetailSegue") {
            let detailVC = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)!
            
            // sets the data for the destination controller
            // sets the title to cell just clicked
            detailVC.title = cookiesFromPlist.cookieCategories[indexPath.row]
            
            // sent the cookie category array
            detailVC.cookieListDetail = cookiesFromPlist
            detailVC.selectedCookieCategory = indexPath.row
        }
        
    }
    
    
    func docFilePath(filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        let dir = path[0] as NSString //document directory
        
        //creates the full path to our data file
        return dir.stringByAppendingPathComponent(filename)
    }
    
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    func applicationWillResignActive(notification: NSNotification){
        
        let filePath = docFilePath(kfilename)
        let data = NSMutableDictionary()
        
        //adds our whole dictionary to the data dictionary
        data.addEntriesFromDictionary(cookiesFromPlist.allCookieData)
        print(data)
        
        //write the contents of the array to our plist file
        data.writeToFile(filePath!, atomically: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

