//
//  StudentsList.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/8/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import Foundation
import UIKit

class StudentList {
    
    private (set) var allStudents : [StudentData] = []
    
    init(path: String) {
    
        // create tmp to store whole db
        var db : [String : [AnyObject]]!
        
        // get db
        db = NSDictionary(contentsOfFile: path) as! [String : [AnyObject]]
        
        // just get students
        var db_students : [[String : AnyObject]]!
        db_students = db["students"] as! [[String : AnyObject]]
        //print(db_students)
        
        // loop through and create new students
        for student in db_students {
            allStudents.append( StudentData(studentData: student) );
        }

    }
    
    init() {}
    
    func addStudent(student: StudentData) {
        // TODO: test for double student
        if(true) {
            allStudents.append(student)
            saveStudentList();
        }
    }
    
    func saveStudentList() {
        // TODO save to plist
    }
    
    func getTotalStudents() -> Int {
        return allStudents.count
    }
    
}