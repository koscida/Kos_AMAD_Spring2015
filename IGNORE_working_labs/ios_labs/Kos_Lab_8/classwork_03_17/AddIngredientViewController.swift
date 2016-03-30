//
//  AddIngredientViewController.swift
//  classwork_03_17
//
//  Created by Brittany Kos on 3/22/16.
//  Copyright © 2016 Brittany Kos. All rights reserved.
//

import UIKit

class AddIngredientViewController: UIViewController {

    var newIngredient = NSDictionary()
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var numPicker: UIPickerView!
    @IBOutlet weak var unitPicker: UIPickerView!
    
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
        if nameText.text?.isEmpty == false {
            newIngredient = [
                "ingredient" : nameText.text!,
                "amount" : "1 cup"
            ]
        }
    }
    

}
