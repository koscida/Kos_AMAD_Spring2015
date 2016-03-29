//
//  CountryTableViewController.swift
//  kos_lab_7
//
//  Created by Brittany Kos on 3/28/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class CountryTableViewController: UITableViewController {
    
    var countries : [Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // load in json country file
        loadCountriesFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadCountriesFile() {
        print("in loadCountriesFile()")
        // get data
        let filePath = NSBundle.mainBundle().pathForResource("city.list",ofType:"json")
        let data = NSData(contentsOfFile: filePath!)
        
        
        // store as array
        var json: [[String: AnyObject]] = []
        do {
            json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions()) as! [[String: AnyObject]]
        } catch {
            print("Error loading JSON file: \(error)")
        }
        //print(json)
        
        // parse json, store in tmp
        var tmp_countries = [String: Country]()
        for city in json {
            // get city data
            let cityCountry = city["country"] as! String
            
            // create a new city
            let newCity = City(id: city["_id"] as! Int, name: city["name"] as! String, lon: city["coord"]!["lon"] as! Float, lat: city["coord"]!["lat"] as! Float)
            
            // test country
            if tmp_countries[cityCountry] == nil {
                let newCountry = Country(name: cityCountry, cities: [])
                tmp_countries[cityCountry] = newCountry
            }
            
            tmp_countries[cityCountry]?.cCities.append(newCity)
        }
        print(tmp_countries)
        
        // go through tmp, store in perm
        for c in tmp_countries {
            countries.append(c.1)
        }

        
        tableView.reloadData()
        print("exit loadCountriesFile()")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("countryCell", forIndexPath: indexPath)

        let country = countries[indexPath.row]
        cell.textLabel?.text = country.cName

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
