//
//  ViewController.swift
//  SiteSee
//
//  Created by Cody Carmichael on 3/23/16.
//  Copyright © 2016 Cody Carmichael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var campgroundInput: UITextField!
    @IBOutlet weak var siteSeeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    @IBAction func nextButton(sender: UIButton) {
        siteSeeLabel.text = "Testing"
    }
}

