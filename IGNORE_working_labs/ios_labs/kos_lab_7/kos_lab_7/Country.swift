//
//  Country.swift
//  kos_lab_7
//
//  Created by Brittany Kos on 3/28/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit

class Country {
    
    var cName: String = ""
    var cCities = [City]()
    
    init() {}
    
    
    init(name: String, cities : [City]) {
        cName = name
        cCities = cities
    }
    
}