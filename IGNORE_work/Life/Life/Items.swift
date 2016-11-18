//
//  Items.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation

var femTraits = ["Receptive", "Empathy", "Patience", "Nuturing"]
var masTraits = ["Independence", "Logic", "Confidence", "Disclipline"]
var allTraits = femTraits + masTraits

struct Item {
    var name: String = ""
    
    var resourceName: String = ""
    
    var detailName: String = ""
    var detailDescription: String = ""
    var detailCost: Int = 0
    
    var messageTry1: String = ""
    var messageTry2: String = ""
    var messageTry3: String = ""
    
    var buyMinAttempts: Int = 0
    var buyAttempts: Int = 0
    
    var owns: Int = 0
    
    var traitRecChange: Int = 0
    var traitEmpChange: Int = 0
    var traitPatChange: Int = 0
    var traitNutChange: Int = 0
    var traitIndChange: Int = 0
    var traitLogChange: Int = 0
    var traitConChange: Int = 0
    var traitDisChange: Int = 0
}

var inventoryItems = [Item]()

var infantItems = [
    // toys
    Item(
        name: "plushie", resourceName: "",
        detailName: "Plushie", detailDescription: "This is a stuffed animal.", detailCost: 1,
        messageTry1: "Cute!", messageTry2: "", messageTry3: "",
        buyMinAttempts: 1, buyAttempts: 0, owns: 0,
        traitRecChange: 1, traitEmpChange: 1, traitPatChange: 1, traitNutChange: 1,
        traitIndChange: 1, traitLogChange: 1, traitConChange: 1, traitDisChange: 1),
    Item(
        name: "walker", resourceName: "",
        detailName: "Walker", detailDescription: "Learn how to walk.", detailCost: 1,
        messageTry1: "Great idea!", messageTry2: "", messageTry3: "",
        buyMinAttempts: 1, buyAttempts: 0, owns: 0,
        traitRecChange: 1, traitEmpChange: 1, traitPatChange: 1, traitNutChange: 1,
        traitIndChange: 1, traitLogChange: 1, traitConChange: 1, traitDisChange: 1),
    Item(
        name: "donut", resourceName: "",
        detailName: "Donut Thing", detailDescription: "Every baby had this thing.", detailCost: 1,
        messageTry1: "Fun!", messageTry2: "", messageTry3: "",
        buyMinAttempts: 1, buyAttempts: 0, owns: 0,
        traitRecChange: 1, traitEmpChange: 1, traitPatChange: 1, traitNutChange: 1,
        traitIndChange: 1, traitLogChange: 1, traitConChange: 1, traitDisChange: 1),
    
    // clothes
    Item(
        name: "onesie_superhero", resourceName: "",
        detailName: "Superhero Onsie", detailDescription: "Onsie for a baby", detailCost: 1,
        messageTry1: "What a cute onsie for a boy.  Why don't you pick out a different one for a girl?", messageTry2: "You won't look cute in that, pick something else.", messageTry3: "This onsie is for a boy.  Are you sure you want it?",
        buyMinAttempts: 3, buyAttempts: 0, owns: 0,
        traitRecChange: 1, traitEmpChange: 1, traitPatChange: 1, traitNutChange: 1,
        traitIndChange: 1, traitLogChange: 1, traitConChange: 1, traitDisChange: 1),
    Item(
        name: "onsie_future", resourceName: "",
        detailName: "Future Trophy Wife Onsie", detailDescription: "Onsie for a baby", detailCost: 1,
        messageTry1: "How funny!", messageTry2: "", messageTry3: "",
        buyMinAttempts: 1, buyAttempts: 0, owns: 0,
        traitRecChange: 1, traitEmpChange: 1, traitPatChange: 1, traitNutChange: 1,
        traitIndChange: 1, traitLogChange: 1, traitConChange: 1, traitDisChange: 1)
]