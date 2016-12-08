//
//  AddCookieViewController.swift
//  Kos_Lab_3
//
//  Created by Brittany Kos on 2/15/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class AddCookieViewController: UIViewController {

    @IBOutlet weak var cookieName: UITextField!
    var addedCookie = String()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "doneAddingCookieSegue"{
            
            //only add a country if there is text in the textfield
            if ((cookieName.text?.isEmpty) == false){
                addedCookie = cookieName.text!
            }
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
