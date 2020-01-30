//
//  Empdata+CoreDataClass.swift
//  EmpManagement
//
//  Created by sanjeev gupta on 2020-01-28.
//  Copyright © 2020 sanjeev gupta. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Empdata)
public class Empdata: NSManagedObject {

    var vechiclesArray: [Vehdata]? {
        return vechicles?.array as? [Vehdata]
    }
    
}
