//
//  City.swift
//  kos_lab_7
//
//  Created by Brittany Kos on 3/28/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit

class City {
    
    var cId: Int = 0
    var cName: String = ""
    var cLon: Float = 0
    var cLat: Float = 0
    
    init() {}
    
    init(id: Int, name: String, lon: Float, lat: Float) {
        cId = id
        cName = name
        cLon = lon
        cLat = lat
    }
}