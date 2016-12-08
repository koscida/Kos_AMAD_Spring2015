//
//  Item.swift
//  Life
//
//  Created by Brittany Ann Kos on 11/18/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Item: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String = ""
    
    var resourceName: String = ""
    
    var detailName: String = ""
    var detailDescription: String = ""
    var detailCost: CGFloat = 0
    
    var tryMessages: [String] = [""]
    
    var buyMinAttempts: Int = 0
    var buyAttempts: Int = 0
    
    var owns: Int = 0
    
    var traitValueChanges: [CGFloat] = [0, 0, 0, 0]
	
	var traitLimitValues: [CGFloat] = [0, 0, 0, 0]
	var traitLimited: Bool = false
    
    
    
    // MARK: Initialization
    
    init(name: String, resourceName: String, detailName: String, detailDescription: String, detailCost: CGFloat, tryMessages: [String], buyMinAttempts: Int, buyAttempts: Int, owns: Int, traitValueChanges: [CGFloat]) {
        
        super.init()
        
        // Initialize stored properties.
        self.name = name
        
        self.resourceName = resourceName
         
        self.detailName = detailName
        self.detailDescription = detailDescription
        self.detailCost = detailCost
         
        self.tryMessages = tryMessages
         
        self.buyMinAttempts = buyMinAttempts
        self.buyAttempts = buyAttempts
         
        self.owns = owns
         
        self.traitValueChanges = traitValueChanges
    }
	
	init(name: String, resourceName: String, detailName: String, detailDescription: String, detailCost: CGFloat, tryMessages: [String], buyMinAttempts: Int, buyAttempts: Int, owns: Int, traitValueChanges: [CGFloat], traitLimitValues: [CGFloat], traitLimited: Bool) {
		
		super.init()
		
		// Initialize stored properties.
		self.name = name
		
		self.resourceName = resourceName
		
		self.detailName = detailName
		self.detailDescription = detailDescription
		self.detailCost = detailCost
		
		self.tryMessages = tryMessages
		
		self.buyMinAttempts = buyMinAttempts
		self.buyAttempts = buyAttempts
		
		self.owns = owns
		
		self.traitValueChanges = traitValueChanges
		
		self.traitLimitValues = traitLimitValues
		self.traitLimited = traitLimited
		
	}

    
    override init() {}
    
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("items")
    
    
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        
        static let resourceNameKey = "resourceName"
        
        static let detailNameKey = "detailName"
        static let detailDescriptionKey = "detailDescription"
        static let detailCostKey = "detailCost"
        
        static let tryMessagesKey = "tryMessages"
        
        static let buyMinAttemptsKey = "buyMinAttempts"
        static let buyAttemptsKey = "buyAttempts"
        
        static let ownsKey = "owns"
        
        static let traitValueChangesKey = "traitValueChanges"
    }
    
    
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        
        aCoder.encodeObject(resourceName, forKey: PropertyKey.resourceNameKey)
        
        aCoder.encodeObject(detailName, forKey: PropertyKey.detailNameKey)
        aCoder.encodeObject(detailDescription, forKey: PropertyKey.detailDescriptionKey)
        aCoder.encodeObject(detailCost, forKey: PropertyKey.detailCostKey)
        
        aCoder.encodeObject(tryMessages, forKey: PropertyKey.tryMessagesKey)
        
        aCoder.encodeInteger(buyMinAttempts, forKey: PropertyKey.buyMinAttemptsKey)
        aCoder.encodeInteger(buyAttempts, forKey: PropertyKey.buyAttemptsKey)
        
        aCoder.encodeInteger(owns, forKey: PropertyKey.ownsKey)
        
        aCoder.encodeObject(traitValueChanges, forKey: PropertyKey.traitValueChangesKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        let resourceName = aDecoder.decodeObjectForKey(PropertyKey.resourceNameKey) as! String
        
        let detailName = aDecoder.decodeObjectForKey(PropertyKey.detailNameKey) as! String
        let detailDescription = aDecoder.decodeObjectForKey(PropertyKey.detailDescriptionKey) as! String
        let detailCost = aDecoder.decodeObjectForKey(PropertyKey.detailCostKey) as! CGFloat
        
        let tryMessages = aDecoder.decodeObjectForKey(PropertyKey.tryMessagesKey) as! [String]
        
        let buyMinAttempts = aDecoder.decodeObjectForKey(PropertyKey.buyMinAttemptsKey) as! Int
        let buyAttempts = aDecoder.decodeObjectForKey(PropertyKey.buyAttemptsKey) as! Int
        
        let owns = aDecoder.decodeObjectForKey(PropertyKey.ownsKey) as! Int
        
        let traitValueChanges = aDecoder.decodeObjectForKey(PropertyKey.traitValueChangesKey) as! [CGFloat]
        
        
        // Must call designated initializer.
        self.init(name: name, resourceName: resourceName, detailName: detailName, detailDescription: detailDescription, detailCost: detailCost, tryMessages: tryMessages, buyMinAttempts: buyMinAttempts, buyAttempts: buyAttempts, owns: owns, traitValueChanges: traitValueChanges)
    }
}
