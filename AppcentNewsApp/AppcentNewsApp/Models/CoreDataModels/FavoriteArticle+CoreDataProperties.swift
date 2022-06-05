//
//  FavoriteArticle+CoreDataProperties.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import Foundation
import CoreData

extension FavoriteArticle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteArticle> {
        return NSFetchRequest<FavoriteArticle>(entityName: "FavoriteArticle")
    }

    @NSManaged public var sourceId: String?
    @NSManaged public var title: String?
    @NSManaged public var desc: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var publishedDate: String?
    @NSManaged public var sourceUrl: String?
    @NSManaged public var content: String?
    @NSManaged public var author: String?

}
