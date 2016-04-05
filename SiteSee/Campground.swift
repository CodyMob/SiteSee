//
//  Campground.swift
//  SiteSee
//
//  Created by Pratikbhai Patel on 4/5/16.
//  Copyright © 2016 Cody Carmichael. All rights reserved.
//

import Foundation

enum Available {
    case Yes
    case No
}

enum ContractType {
    case Federal
    case State
}

class Campground {
    
//    var avaialibilityStatus: Available?
//    var contractId: String?
//    var contractType: ContractType?
    var facilityName: String?
    var facilityId: Int?
}

class DataProvider {
    
    static let sharedInstance = DataProvider()
    
    func allCampground() -> [Campground]? {

        let fileName = "campData"
        let filePath = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        guard let jsonFilePath = filePath else {
            return nil
        }
        let campData = NSData(contentsOfFile: jsonFilePath)
        
        guard let actualData = campData else {
            return nil
        }
        
        do {
            let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(actualData, options: .MutableContainers) as! [String:AnyObject]
            
            guard let campgroundDataArray = jsonDictionary["resultset"]?["result"] as? [AnyObject] else {
                return nil
            }
            var campgroundsArray = [Campground]()
            for campground in campgroundDataArray {
                let campgroundObject = Campground()
                campgroundObject.facilityName =  campground.valueForKey("facilityName") as? String
                campgroundObject.facilityId = campground.valueForKey("facilityID") as? Int
                campgroundsArray.append(campgroundObject)
            }
            return campgroundsArray
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }

        return nil
    }
    
}