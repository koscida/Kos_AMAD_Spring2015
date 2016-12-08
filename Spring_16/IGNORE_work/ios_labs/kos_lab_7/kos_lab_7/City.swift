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
    
    var id: Int = 0
    var name: String = ""
    var lon: Float = 0
    var lat: Float = 0
    
    init() {}
    
    init(countryId: Int, countryName: String, countryLon: Float, countryLat: Float) {
        id = countryId
        name = countryName
        lon = countryLon
        lat = countryLat
    }
}