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
    
    var name: String = ""
    var cities = [City]()
    
    init() {}
    
    
    init(countryName: String, countryCities : [City]) {
        name = countryName
        cities = countryCities
    }
    
}