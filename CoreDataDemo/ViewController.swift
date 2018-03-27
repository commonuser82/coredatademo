

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        //1.To add Main Initiative
  
        
        DataBaseController.AddMainIntiative(name: "MI 1")
        let allMainInt = DataBaseController.FetchAllMainIntiative()
        for result in allMainInt
        {
            print(result.name ?? "no name")
        }
        
        
//       //To Add
//        let mainInt:MainInitiative = NSEntityDescription.insertNewObject(forEntityName: mainIntClassName, into: DataBaseController.getContext()) as! MainInitiative
//
//        mainInt.name = "Main Intiative 1"
//
//        let subInt1:SubInitiative = NSEntityDescription.insertNewObject(forEntityName: subIntClassName, into: DataBaseController.getContext()) as! SubInitiative
//
//        subInt1.name = "Sub Intiative 1"
//
//        mainInt.addToSubinitiative(subInt1)
//
//
//        let subInt2:SubInitiative = NSEntityDescription.insertNewObject(forEntityName: subIntClassName, into: DataBaseController.getContext()) as! SubInitiative
//
//        subInt2.name = "Sub Intiative 2"
//
//        mainInt.addToSubinitiative(subInt2)
//
//
//        //To Save
//        DataBaseController.saveContext()
//
//        //To Fetch
//        let fetchrequest:NSFetchRequest<MainInitiative> = MainInitiative.fetchRequest()
//        do{
//        let mainIntResults = try DataBaseController.getContext().fetch(fetchrequest)
//            print("No of resuts ",mainIntResults.count)
//
//            for result in mainIntResults as [MainInitiative]
//            {
//                print("\(String(describing: result.name)) has \(String(describing: result.subinitiative?.count)) subinitiative")
//                for subInt in result.subinitiative!
//                {
//                    let s = subInt as! SubInitiative
//                    print("\(s.name ?? "no name")")
//                }
//            }
//        }
//        catch
//        {
//            print("error \(error)")
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

