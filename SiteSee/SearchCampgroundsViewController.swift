//
//  SearchCampgroundsViewController.swift
//  SiteSee
//
//  Created by Pratikbhai Patel on 4/5/16.
//  Copyright © 2016 Cody Carmichael. All rights reserved.
//

import UIKit

class SearchCampgroundsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var campgrounds: [Campground]? {
       return DataProvider.sharedInstance.allCampground()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SearchCampgroundsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.campgrounds?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("campgroundCell")! as UITableViewCell
        cell.textLabel?.text = campgrounds?[indexPath.row].facilityName ?? "NO NAME FOR THIS FACILITY"
        return cell
    }
}
