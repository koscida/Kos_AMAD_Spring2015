//
//  AddViewController.swift
//  Kos_Midterm
//
//  Created by Brittany Ann Kos on 3/10/16.
//  Copyright © 2016 Brittany Ann Kos. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var itemName: UITextField!
    var addedItem = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "saveItemSegue"{
            //only add a country if there is text in the textfield
            if ((itemName.text?.isEmpty) == false){
                addedItem = itemName.text!
            }
        }
    }

}
