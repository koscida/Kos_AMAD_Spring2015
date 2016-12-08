//
//  AddIngredientViewController.swift
//  classwork_03_17
//
//  Created by Brittany Kos on 3/22/16.
//  Copyright © 2016 Brittany Kos. All rights reserved.
//

import UIKit

class AddIngredientViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var newIngredient = NSDictionary()
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var unitPicker: UIPickerView!
    
    var unitArray = [
        [
            "1/6",
            "1/5", "2/5", "3/5", "4/5",
            "1/4", "3/4",
            "1/3", "2/3",
            "1/2",
            "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
        ],
        [
            "teaspoon", "tablespoon", "cup",
            "g", "oz", "fl oz", "lb",
            "box", "can", "package", "unit"
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.unitPicker.dataSource = self;
        self.unitPicker.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return unitArray[component].count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return unitArray[component][row]
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "saveAddIngredient") {
            //print("in prepareForSegue - saveAddIngredient")
            //print(nameText.text)
            
            if nameText.text?.isEmpty == false {
                newIngredient = [
                    "ingredient" : nameText.text!,
                    "amount" : unitArray[0][unitPicker.selectedRowInComponent(0)] + " " + unitArray[1][unitPicker.selectedRowInComponent(1)]
                ]
            }
            //print(newIngredient)
        }
        
    }
    

}
