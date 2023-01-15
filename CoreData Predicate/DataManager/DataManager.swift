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
    private func createCatEntity(picture: String, name: String, color: String, lovelinessRate: Int, heartRate: Int, funRate: Int, age: Int) -> Cat {
        let cat = Cat(context: persistentContainer.viewContext)
        cat.picture = picture
        cat.name = name
        cat.color = color
        cat.lovelinessRate = Int16(lovelinessRate)
        cat.heartRate = Int16(heartRate)
        cat.funRate = Int16(funRate)
        cat.age = Int16(age)
        return cat
    }
    
    func createCat() -> Cat {
        let pictures = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9", "cat10", "cat11"]
        let names = ["Archie", "Buck" , "Boomer", "Duke", "Felix", "Lucky", "Hunter", "Eva", "Flora", "Betty", "Alma", "Vivian", "Olive", "Lucy", "Lois", "Jane", "June", "Isadora", "Grace", "Enid"]
        let colors = ["Black", "White", "Red", "Green", "Brown", "Gray", "Blue"]
        
        let picture = pictures.randomElement()!
        let name = names.randomElement()!
        let color = colors.randomElement()!
        
        let lovelinessRate = Int.random(in: 1...5)
        let heartRate = Int.random(in: 1...5)
        let funRate = Int.random(in: 1...5)
        let age = Int.random(in: 1...15)
        
        let cat = createCatEntity(picture: picture, name: name, color: color, lovelinessRate: lovelinessRate, heartRate: heartRate, funRate: funRate, age: age)
        saveContext()
        return cat
        
    }
    
    //MARK: - Fetch
    
    func fetchAllCats() -> [Cat] {
        let request: NSFetchRequest<Cat> = Cat.fetchRequest()
        var cats: [Cat] = []
        
        do {
            try cats = persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("error = \(error)")
        }
        
        return cats
    }
    
}
