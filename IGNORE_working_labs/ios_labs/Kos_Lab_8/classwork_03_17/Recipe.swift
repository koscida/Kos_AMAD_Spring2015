//
//  Recipe.swift
//  classwork_03_17
//
//  Created by Brittany Kos on 3/17/16.
//  Copyright © 2016 Brittany Kos. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
    
    var name: String = ""
    var ingredients : [[String: String]] = []
    
    init(newName: String, newIngredients: [[String: String]]){
        name = newName
        ingredients = newIngredients
    }
    
    init(newName: String){
        name = newName
    }
    
    init() {
    }
    
    func getDict() -> NSDictionary {
        let dict = [
            "Name" : name,
            "Ingredients" : ingredients
        ]
        
        return dict
        
    }
    
    
}
