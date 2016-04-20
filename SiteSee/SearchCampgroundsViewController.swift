//
//  SearchCampgroundsViewController.swift
//  SiteSee
//
//  Created by Pratikbhai Patel on 4/5/16.
//  Copyright © 2016 Cody Carmichael. All rights reserved.
//

import UIKit
import Foundation

class SearchCampgroundsViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)

    @IBOutlet weak var tableView: UITableView!
    var campgrounds: [Campground]? {
       return DataProvider.sharedInstance.allCampground()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
    var filtered: [Campground]? = nil
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filtered = self.campgrounds?.filter {
            //True if facilityName contains search bar text (case-sensative)
            $0.facilityName!.rangeOfString(searchController.searchBar.text!) != nil
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension SearchCampgroundsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchController.active {
        return self.filtered?.count ?? 0
        }
        return self.campgrounds?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("campgroundCell")! as UITableViewCell
        if self.searchController.active && self.searchController.searchBar.text != "" {
        cell.textLabel?.text = campgrounds?[indexPath.row].facilityName ?? "NO NAME FOR THIS FACILITY"
        } else {
            cell.textLabel?.text = campgrounds?[indexPath.row].facilityName ?? "NO NAME FOR THIS FACILITY"
        }
        return cell
    }
}
