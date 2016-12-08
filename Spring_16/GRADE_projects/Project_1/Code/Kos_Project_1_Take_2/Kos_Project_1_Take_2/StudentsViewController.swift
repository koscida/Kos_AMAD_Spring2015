//
//  FirstViewController.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Kos on 3/2/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var studentList : StudentList = StudentList();
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = NSBundle.mainBundle().pathForResource("db", ofType: "plist")
        
        studentList = StudentList(path: path!);

        
        // register nib for student table cell
        let nib = UINib(nibName: "StudentTableViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "StudentCell")
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // TABLE VIEW METHODS
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.getTotalStudents()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StudentCell", forIndexPath: indexPath) as! StudentTableViewCell
        
        let student = studentList.allStudents[indexPath.row]
        cell.firstName = student.firstName
        cell.lastName = student.lastName
        cell.numCheckout = student.numCheckout
        cell.numDemerit = student.numDemerit
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let row = indexPath.row
        //print(studentList.allStudents[row])
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        performSegueWithIdentifier("ShowStudentDetail", sender: cell)
    }
    
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowStudentDetail" {
            let indexPath = tableView.indexPathForCell(sender as! UITableViewCell)
            let student = studentList.allStudents[indexPath!.row]
            
            let destination = segue.destinationViewController as! StudentDetailViewController
            
            destination.student = student
            
        }
        
    }

}

