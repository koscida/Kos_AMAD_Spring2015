//
//  Level.swift
//  Life
//
//  Created by Brittany Ann Kos on 12/4/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Level {
	
	// MARK: Properties
	
	var name: String = ""

	var moneyMax: CGFloat = 0
	var moneyAddValue: CGFloat = 0
	
	var items = [Item]()
	
	
	// MARK: Initialization
	
	init(name: String, moneyMax: CGFloat, moneyAddValue: CGFloat, items: [Item]) {
		self.name = name
		self.moneyMax = moneyMax
		self.moneyAddValue = moneyAddValue
		self.items = items
	}

}