//
//  StudentDetailViewController.swift
//  Kos_Project_1_Take_2
//
//  Created by Brittany Ann Kos on 3/3/16.
//  Copyright © 2016 Kode Studios. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {

    var student : StudentData = StudentData();
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        fullNameLabel.text = student.firstName + " " + student.lastName;
        majorLabel.text = student.major;
        yearLabel.text = student.year;
        emailLabel.text = student.email;
        phoneLabel.text = student.phone;
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
