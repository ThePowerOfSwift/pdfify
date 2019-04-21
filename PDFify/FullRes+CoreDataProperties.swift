//
//  FullRes+CoreDataProperties.swift
//  PDFify
//
//  Created by MKHS on 4/21/19.
//  Copyright © 2019 mkhs. All rights reserved.
//
//

import Foundation
import CoreData


extension FullRes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FullRes> {
        return NSFetchRequest<FullRes>(entityName: "FullRes")
    }

    @NSManaged public var pdf: NSData?
    @NSManaged public var raw: NSData?
    @NSManaged public var thumbnail: Thumbnail?

}
