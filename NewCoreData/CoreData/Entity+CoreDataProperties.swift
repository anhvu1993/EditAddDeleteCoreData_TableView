//
//  Entity+CoreDataProperties.swift
//  NewCoreData
//
//  Created by Anh vũ on 4/11/19.
//  Copyright © 2019 anh vu. All rights reserved.
//
//

import UIKit
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var image: UIImage?
    
}
