//
//  RecipeListTableViewController.swift
//  classwork_03_17
//
//  Created by Brittany Kos on 3/17/16.
//  Copyright © 2016 Brittany Kos. All rights reserved.
//

import UIKit
import Firebase

class RecipeListTableViewController: UITableViewController {
    
    var recipes = [Recipe]()
    
    
    let ref = Firebase(url: "https://fiery-fire-6605.firebaseio.com/")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //set up a listener for Firebase data change events
        //this event will fire with the initial data and then all data changes
        ref.observeEventType(FEventType.Value, withBlock: {
            snapshot in self.recipes=[]
            //FDataSnapshot represents the Firebase data at a given time
            //gets all the child data nodes
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for item in snapshots {
                    let recipeName = item.value["Name"] as! String
                    let recipeIngredient = item.value["Ingredients"] as! [[String: String]]
                    //print(recipeIngredient)
                    
                    //create new recipe object
                    let newRecipe = Recipe(newName: recipeName, newIngredients: recipeIngredient)
                    //print(newRecipe.ingredients)
                    
                    //add recipe to recipes array
                    self.recipes.append(newRecipe)
                    
                }
            }
            self.tableView.reloadData()

        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipeCell", forIndexPath: indexPath)

        let cellRecipe = recipes[indexPath.row]
        cell.textLabel!.text = cellRecipe.name

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if segue.identifier == "showRecipe" {
            let indexPath = (tableView.indexPathForSelectedRow!).row
            let selectedRecipe = recipes[indexPath]
            let destination = segue.destinationViewController as? RecipeTableViewController
            destination?.recipe = selectedRecipe
            
        } else if segue.identifier == "addRecipe" {

        }
    }
    
    
    override func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        
    }
    
    @IBAction func cancelAddRecipe(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveAddRecipe(segue:UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddRecipeViewController
        
        let newRecipe = source.recipe
        
        // check fields
        if newRecipe.name.isEmpty == false {
            
            //add recipe to recipes array
            recipes.append(newRecipe)
            
            //create a child reference in Firebase where the key value is the recipe name
            let recipeRef = ref.childByAppendingPath(newRecipe.name)
            
            //write data to Firebase
            recipeRef.setValue(newRecipe.getDict())
        }
    }

}
