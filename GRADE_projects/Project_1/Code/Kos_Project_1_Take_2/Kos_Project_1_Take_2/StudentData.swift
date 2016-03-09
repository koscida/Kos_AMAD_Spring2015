//
//  StudentsData.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/8/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit

class StudentData {
    
    private(set) var firstName : String = "";
    private(set) var lastName : String = "";
    private(set) var major: String = "";
    private(set) var year : String = "";
    private(set) var email : String = "";
    private(set) var phone: String = "";
    private(set) var sid : Int = 0;
    private(set) var banned: Bool = false;
    
    // TODO classes
    private(set) var classes : String = "";
    // TODO agreement
    private(set) var agreement : String = "";
    // TODO these
    private(set) var numCheckout : Int = 0;
    private(set) var numDemerit : Int = 0;
    
    
    init(studentData: [String : AnyObject]) {
        firstName   = studentData["first"] as! String;
        lastName    = studentData["last"] as! String;
        major       = studentData["major"] as! String;
        year        = studentData["year"] as! String;
        email       = studentData["email"] as! String;
        phone       = studentData["phone"] as! String;
        sid         = studentData["sid"] as! Int;
        banned      = studentData["banned"] as! Bool;
    }
    
    init() {
        
    }
    
}
