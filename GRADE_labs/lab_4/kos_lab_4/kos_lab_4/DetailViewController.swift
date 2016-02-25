//
//  DetailViewController.swift
//  kos_lab_4
//
//  Created by Brittany Ann Kos on 2/25/16.
//  Copyright © 2016 Brittany Ann Kos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = imageName {
            imageView.image = UIImage(named: name)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    

}
