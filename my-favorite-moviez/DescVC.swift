//
//  DescVC.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 9/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//

import UIKit
import CoreData

class DescVC: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var storyLbl: UILabel!
    @IBOutlet weak var webLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func backBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
