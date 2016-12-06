//
//  LoaderHelper.swift
//  Life
//
//  Created by Brittany Kos on 11/5/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//


import Foundation
import UIKit
import SpriteKit




// MARK: NSCoding

let directories = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)

// This will save all the item counts to a plist.  All the counts will be stored in a 1D array, so if there is a change in the items, all data will have to be resaved
// for stats, they will be saved as: money, traits
func saveItemsToDisk() {
    //print("saveItemsToDisk")
    
    if let documents = directories.first {
        if let urlDocuments = NSURL(string: documents) {
            let urlItems = urlDocuments.URLByAppendingPathComponent("itemsOwnCount.plist")
            let urlStats = urlDocuments.URLByAppendingPathComponent("stat.plist")
            
            // Create file of own counts
            var ownCounts: [Int] = []
            for level in levelData {
                for item in level.items {
                    ownCounts.append(item.owns)
                }
            }
            
            // create single array that contains money and trait values
            var stats: [CGFloat] = [moneyTotal]
            for t in traitsDataOrigin {
                stats.append(t.value)
            }
            
            
            // cast to NSArray data type
            let writableOwnCountsArray: NSArray = ownCounts
            let writableStats: NSArray = stats
            
            // Write Array to Disk
            writableOwnCountsArray.writeToFile(urlItems.path!, atomically: true)
            writableStats.writeToFile(urlStats.path!, atomically: true)
        }
    }
}

func loadItemsFromDisk() {
    //print("loadItemsFromDisk")
    
    if let documents = directories.first {
        if let urlDocuments = NSURL(string: documents) {
            let urlItems = urlDocuments.URLByAppendingPathComponent("itemsOwnCount.plist")
            let urlStats = urlDocuments.URLByAppendingPathComponent("stat.plist")
            
            // Load from Disk -- items
            let loadedItems = NSArray(contentsOfURL: urlItems)
            if let ownCounts = loadedItems as? [Int] {
                //print(ownCounts)
                
                var index = 0
                for level in levelData {
                    for item in level.items {
                        item.owns = ownCounts[index]
                        index += 1
                    }
                }
            }
            
            // Load from Disk -- stats
            let loadedStats = NSArray(contentsOfURL: urlStats)
            if var stats = loadedStats as? [CGFloat] {
                //print(ownCounts)
                
                moneyTotal = stats[0]
                
                stats.removeAtIndex(0)
                var ind = 0
                for stat in stats {
                    traitsDataOrigin[ind].value = stat
                    ind += 1
                }
            }
            
        }
    }
}



func deleteLoadedItems() {
}


