//
//  Trait.swift
//  Life
//
//  Created by Brittany Ann Kos on 12/3/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Trait {
	
	// MARK: Properties
	
	var name: String = ""
	var fem: Bool = false
	var value: CGFloat = 0
	var valueGoal: CGFloat = 0
	var valueTmp: CGFloat = 0
	var max: CGFloat = 0
	
	
	// MARK: Initialization
	
	init(name: String, fem: Bool, value: CGFloat, max: CGFloat) {
		self.name = name
		self.fem = fem
		self.value = value
		self.max = max
	}
}

