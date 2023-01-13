//
//  DataManager.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 21.12.2022.
//

import Foundation
import CoreData

class DataManager{
    
    static let shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData_Predicate")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func delete<T>(_ object: T) {
        let context = persistentContainer.viewContext
        guard let object = object as? NSManagedObject else {return}
   
        context.delete(object)
        saveContext()
    }
    
    //MARK: - Create Entity
    
    
    
    //MARK: - Fetch
    
    
}
