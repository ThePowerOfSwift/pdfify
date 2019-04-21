//
//  Thumbnail+CoreDataProperties.swift
//  PDFify
//
//  Created by MKHS on 4/21/19.
//  Copyright © 2019 mkhs. All rights reserved.
//
//

import Foundation
import CoreData


extension Thumbnail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thumbnail> {
        return NSFetchRequest<Thumbnail>(entityName: "Thumbnail")
    }

    @NSManaged public var pdf: NSData?
    @NSManaged public var id: NSData?
    @NSManaged public var fullRes: FullRes?

}
