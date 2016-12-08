//
//  WeatherViewController.swift
//  kos_lab_7
//
//  Created by Brittany Kos on 3/28/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var city = City()
    var apiKey = "208df7dbccb3da755cdf0bd3b917afdd"
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var subWeatherLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadJSON() {
        let urlPath = "http://api.openweathermap.org/data/2.5/weather?id=\(city.id)&APPID=" + apiKey + "&units=imperial"
        print(urlPath)
        
        guard
            let url = NSURL(string: urlPath)
        else {
            print("url error")
            return
        }
        
        let session = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            (data, response, error) in
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            guard
                statusCode == 200
            else {
                print("file read error")
                return
            }
            
            print("download successful")
            dispatch_async(dispatch_get_main_queue()) {
                self.parseJSON(data!)
            }
        
        })
        
        session.resume()
        
    }
    
    func parseJSON(data: NSData) {
        do {
            let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            
            
            /*
            let meta = json["metadata"] as! NSDictionary
            let response = meta.objectForKey("responseInfo") as! NSDictionary
            let status = response.objectForKey("status") as! Int
            
            if status == 200 {
                let allresults = json["results"] as! NSArray
                print(allresults)
                
            }
*/
            
            
            
            let weatherArray = json["weather"] as! NSArray
            let weatherDict = weatherArray[0] as! NSDictionary
            let weather_main = weatherDict.objectForKey("main") as! String
            let weather_description = weatherDict.objectForKey("description") as! String
            
            let main = json["main"] as! NSDictionary
            let main_temp = main.objectForKey("temp") as! Float
            //let main_pressure = main.objectForKey("pressure") as! Float
            //let main_humidity = main.objectForKey("humidity") as! Float
            let main_temp_min = main.objectForKey("temp_min") as! Float
            let main_temp_max = main.objectForKey("temp_max") as! Float
            
            let wind = json["wind"] as! NSDictionary
            //let wind_speed = wind.objectForKey("speed") as! Float
            //let wind_deg = wind.objectForKey("deg") as! Float
            
            cityNameLabel.text = city.name
            tempLabel.text =  "\(main_temp)"
            highTempLabel.text = "\(main_temp_max)"
            lowTempLabel.text = "\(main_temp_min)"
            weatherLabel.text = weather_main
            subWeatherLabel.text = weather_description
        } catch {
            print("error with json parse: \(error)")
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
    }


}
