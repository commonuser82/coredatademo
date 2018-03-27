
import Foundation
import CoreData

//Entity Name
let mainIntClassName:String = String(describing: MainInitiative.self)
let subIntClassName:String = String(describing: SubInitiative.self)

class DataBaseController
{
    private init()
    {
        
    }
    class func getContext() -> NSManagedObjectContext
    {
        return DataBaseController.persistentContainer.viewContext
    }
    // MARK: - Core Data stack
    
    static var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        
        let container = NSPersistentContainer(name: "CoreDataDemo")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
            
        })
        return container
    }()
   
   class func path() {
   let persistentContainer = NSPersistentContainer(name: "CoreDataDemo")
    persistentContainer.loadPersistentStores { (data, error) in
        if let error = error {
            fatalError("Failed to load Core Data stack: \(error)")
        }
        print(data)
    }
    }
    
    // MARK: - Core Data Saving support
    
  class func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    class func AddMainIntiative(name:String)
    {
        //To Add
        let mainInt:MainInitiative = NSEntityDescription.insertNewObject(forEntityName: mainIntClassName, into: DataBaseController.getContext()) as! MainInitiative
        
        mainInt.name = name
        
        //To Save
        DataBaseController.saveContext()
        
    }
    class func AddSubIntiative(mainInt:MainInitiative,name:String,desc:String,startDate:Date,endDate:Date,notes:String,completion:Int)
    {
        //To Add
        let subInt:SubInitiative = NSEntityDescription.insertNewObject(forEntityName: subIntClassName, into: DataBaseController.getContext()) as! SubInitiative
        
        subInt.name = name
        subInt.desc = desc
        subInt.startDate = startDate
        subInt.endDate = endDate 
        subInt.notes = notes
        subInt.completion = Int16(completion)
        
        mainInt.addToSubinitiative(subInt)
        
        //To Save
        DataBaseController.saveContext()
    }
    class func FetchAllMainIntiative() -> [MainInitiative]
    {
        //To Fetch
        let fetchrequest:NSFetchRequest<MainInitiative> = MainInitiative.fetchRequest()
        do{
            let mainIntResults = try DataBaseController.getContext().fetch(fetchrequest)
            print("No of resuts ",mainIntResults.count)
            return mainIntResults
        }
        catch
        {
            print("error \(error)")
        }
        return []
    }
    class func FetchSubIntiative(mainInt:MainInitiative) -> NSSet
    {
        return mainInt.subinitiative?.count != 0 ? mainInt.subinitiative! : NSSet()
    }
    class func EditSubInitiative(mainInt:MainInitiative,subInt:SubInitiative,desc:String,startDate:Date,endDate:Date,notes:String,completion:Int,name:String)
    {
        subInt.removeFromMaininitiative(mainInt)
        
        //To Add
        let subInt:SubInitiative = NSEntityDescription.insertNewObject(forEntityName: subIntClassName, into: DataBaseController.getContext()) as! SubInitiative
        
        subInt.name = name
        subInt.desc = desc
        subInt.startDate = startDate
        subInt.endDate = endDate
        subInt.notes = notes
        subInt.completion = Int16(completion)
        
        mainInt.addToSubinitiative(subInt)
        
        //To Save
        DataBaseController.saveContext()
    }
    class func DeleteMainInitiative(mainInt:MainInitiative)
    {
        DataBaseController.getContext().delete(mainInt)
        //To Save
        DataBaseController.saveContext()
    }
}
