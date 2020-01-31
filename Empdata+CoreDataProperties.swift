//
//  Empdata+CoreDataProperties.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2020-01-28.
//  Copyright © 2020 sanjeev gupta. All rights reserved.
//
//

import Foundation
import CoreData


extension Empdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Empdata> {
        return NSFetchRequest<Empdata>(entityName: "Empdata")
    }

    @NSManaged public var bonus: String?
    @NSManaged public var city: String?
    @NSManaged public var commissionpercent: String?
    @NSManaged public var country: String?
    @NSManaged public var dateofbirth: String?
    @NSManaged public var empid: String?
    @NSManaged public var empname: String?
    @NSManaged public var fixedamount: String?
    @NSManaged public var hourworked: String?
    @NSManaged public var imagedata: String?
    @NSManaged public var latitude: String?
    @NSManaged public var longitude: String?
    @NSManaged public var rate: String?
    @NSManaged public var salary: String?
    @NSManaged public var schoolname: String?
    @NSManaged public var type: String?
    @NSManaged public var vechicles: NSOrderedSet?
}

// MARK: Generated accessors for vechicles
