

import CoreData

public extension NSManagedObject {
  
  convenience init(ctx: NSManagedObjectContext) {
    let name = String(describing: type(of: self))
    let entity = NSEntityDescription.entity(forEntityName: name, in: ctx)!
    self.init(entity: entity, insertInto: ctx)
  }
}
