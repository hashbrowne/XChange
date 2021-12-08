//
//  Rate+CoreDataProperties.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//

import Foundation
import CoreData

extension Rate {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Rate> {
    let request = NSFetchRequest<Rate>(entityName: "Rate")
    request.predicate = NSPredicate(format: "active = true")
    request.fetchBatchSize = 30
    let nameSort = NSSortDescriptor(keyPath: \Rate.currencyCode, ascending: true)
    request.sortDescriptors = [nameSort]
    return request
  }
  
  @nonobjc public class func find(currencyCode: String, in context: NSManagedObjectContext) -> Rate? {
    let fetchRequest:NSFetchRequest<Rate> = Rate.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "currencyCode = %@", currencyCode)
    fetchRequest.fetchLimit = 1
    return try? context.fetch(fetchRequest).first
  }
  
  @nonobjc public class func findOrCreate(currencyCode: String, in context: NSManagedObjectContext) -> Rate {
    guard let result = Rate.find(currencyCode: currencyCode, in: context) else {
      return Rate(ctx: context)
    }
    return result
  }

  
  @NSManaged public var value: NSDecimalNumber?
  @NSManaged public var currencyCode: String?
  @NSManaged public var active: Bool
}

