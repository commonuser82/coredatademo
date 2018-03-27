
import Foundation
import CoreData


extension MainInitiative {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MainInitiative> {
        return NSFetchRequest<MainInitiative>(entityName: "MainInitiative")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var subinitiative: NSSet?

}

// MARK: Generated accessors for subinitiative
extension MainInitiative {

    @objc(addSubinitiativeObject:)
    @NSManaged public func addToSubinitiative(_ value: SubInitiative)

    @objc(removeSubinitiativeObject:)
    @NSManaged public func removeFromSubinitiative(_ value: SubInitiative)

    @objc(addSubinitiative:)
    @NSManaged public func addToSubinitiative(_ values: NSSet)

    @objc(removeSubinitiative:)
    @NSManaged public func removeFromSubinitiative(_ values: NSSet)

}
