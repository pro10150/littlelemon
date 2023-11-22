//
//  Dish+CoreDataProperties.swift
//  LittleLemonRestaurant
//
//  Created by noppakun.a on 22/11/2566 BE.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var category: String?
	@NSManaged public var desc: String?

}

extension Dish : Identifiable {

}
