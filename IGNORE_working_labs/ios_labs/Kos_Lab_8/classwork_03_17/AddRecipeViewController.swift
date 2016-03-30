//
//  AddRecipeViewController.swift
//  classwork_03_17
//
//  Created by Brittany Kos on 3/17/16.
//  Copyright © 2016 Brittany Kos. All rights reserved.
//

import UIKit

class AddRecipeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameText: UITextField!
    
    var recipe = Recipe()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.ingredients.count
    }
    
    //func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String!
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath)
        
        let ing = recipe.ingredients[indexPath.row]
        cell.textLabel!.text = ing["ingredient"]
        
        return cell
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(nameText.text?.isEmpty == false) {
            recipe.name = nameText.text!
        }
    }
    
    @IBAction func cancelAddIngredient(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveAddIngredient(segue:UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddIngredientViewController
        
        let newIngredient = source.newIngredient
        
        // check fields
        if newIngredient["ingredient"]!.isEmpty == false {
            //add recipe to recipes array
            recipe.ingredients.append(newIngredient as! [String : String])
        }

    }
    

}
