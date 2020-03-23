//
//  coreDataViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 21/03/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import CoreData
class coreDataViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Example1", in: context)
        let newTask = NSManagedObject(entity: entity!, insertInto: context)
        
        
        newTask.setValue("goten", forKey: "user1")
        newTask.setValue("123", forKey: "pass1")
        
        do {
            try context.save()
            print("saved")
        } catch {
            print("Failed saving")
        }
        
        // retrive data
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Example1")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "user1") as! String)
            }
        } catch {
            
            print("Failed")
        }
        
        // delete data
        do{
        let test = try context.fetch(request)
        let objectToDelete = test[0] as! NSManagedObject
            context.delete(objectToDelete)
            
            do{
                try context.save()
            }
            catch
            {
                print(error)
            }
        }
        catch{
            print(error)
        }
    }
    
}
