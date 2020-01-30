//
//  Vehdata+CoreDataProperties.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2020-01-28.
//  Copyright © 2020 sanjeev gupta. All rights reserved.
//
//

import Foundation
import CoreData


extension Vehdata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vehdata> {
        return NSFetchRequest<Vehdata>(entityName: "Vehdata")
    }

    @NSManaged public var company: String?
    @NSManaged public var empid: String?
    @NSManaged public var model: String?
    @NSManaged public var plate: String?
    @NSManaged public var vehicletype: String?
    @NSManaged public var year: String?
    @NSManaged public var emp: Empdata?

}
