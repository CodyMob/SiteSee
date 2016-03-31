//
//  ModalViewController.swift
//  SiteSee
//
//  Created by Cody Carmichael on 3/31/16.
//  Copyright © 2016 Cody Carmichael. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    
    @IBAction func close(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func ok(sender: UIButton) {
        //TODO: add functionality
        dismissViewControllerAnimated(true, completion: nil)
    }
}
