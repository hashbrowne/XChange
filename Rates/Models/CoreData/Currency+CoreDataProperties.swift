//
//  Currency+CoreDataProperties.swift
//  XChange
//
//  Created by Walker Browne-Student on 5/24/21.
//

import Foundation
import CoreData

extension Currency {
  
  @nonobjc public class func fetchRequest(searchText:String = "") -> NSFetchRequest<Currency> {
    let request = NSFetchRequest<Currency>(entityName: "Currency")
    request.fetchBatchSize = 30
    let nameSort = NSSortDescriptor(keyPath: \Currency.name, ascending: true)
    request.sortDescriptors = [nameSort]
    if !searchText.isEmpty {
      let predicate = NSPredicate(searchText: searchText)
      request.predicate = predicate
    }
  
    return request
  }
  
  @NSManaged public var code: String?
  @NSManaged public var name: String?
  @NSManaged public var rate: Rate?
}

extension NSPredicate {
  convenience init(searchText:String) {
    self.init(format: "code CONTAINS[cd] %@ OR name CONTAINS[cd] %@",searchText, searchText)
  }
}
