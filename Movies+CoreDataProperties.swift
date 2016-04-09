//
//  Movies+CoreDataProperties.swift
//  my-favorite-moviez
//
//  Created by Mike Piatin on 9/04/2016.
//  Copyright © 2016 Aurora Software. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var image: NSData?
    @NSManaged var title: String?
    @NSManaged var desc: String?
    @NSManaged var story: String?
    @NSManaged var web: String?
    @NSManaged var extra1: String?
    @NSManaged var extra2: String?

}
