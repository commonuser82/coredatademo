
import Foundation
import CoreData


extension SubInitiative {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubInitiative> {
        return NSFetchRequest<SubInitiative>(entityName: "SubInitiative")
    }

    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var completion: Int16
    @NSManaged public var notes: String?
    @NSManaged public var desc: String?
    @NSManaged public var maininitiative: NSSet?

}

// MARK: Generated accessors for maininitiative
extension SubInitiative {

    @objc(addMaininitiativeObject:)
    @NSManaged public func addToMaininitiative(_ value: MainInitiative)

    @objc(removeMaininitiativeObject:)
    @NSManaged public func removeFromMaininitiative(_ value: MainInitiative)

    @objc(addMaininitiative:)
    @NSManaged public func addToMaininitiative(_ values: NSSet)

    @objc(removeMaininitiative:)
    @NSManaged public func removeFromMaininitiative(_ values: NSSet)

}
