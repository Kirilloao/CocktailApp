//
//  StorageManager.swift
//  CocktailCraft
//
//  Created by Kirill Taraturin on 20.12.2023.
//

import CoreData

final class StorageManager {
    
    // MARK: - Static Properties
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    private let persistentContainter: NSPersistentContainer = {
        let contrainer = NSPersistentContainer(name: "CocktailData")
        contrainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return contrainer
    }()
    
    private let viewContext: NSManagedObjectContext
    
    // MARK: - Init
    private init() {
        viewContext = persistentContainter.viewContext
    }
    
    // MARK: - CRUD
    func create(_ cocktail: Cocktail) {
        let cocktailData = CocktailData(context: viewContext)
        cocktailData.name = cocktail.name
        cocktailData.instruction = cocktail.instructions
        
        do {
            let ingredientsData = try JSONSerialization.data(withJSONObject: cocktail.ingredients)
            print(ingredientsData)
            cocktailData.ingredients = String(data: ingredientsData, encoding: .utf8)
            print("SAVED")
        } catch {
            print("Ошибка при сериализации ингредиентов: \(error)")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("Saved"), object: nil)
        
        saveContext()
    }
    
    func fetchCocktails(completion: (Result<[CocktailData], Error>) -> Void ) {
        let fetchRequest = CocktailData.fetchRequest()
        
        do {
            let cocktailsData = try viewContext.fetch(fetchRequest)
            completion(.success(cocktailsData))
        } catch let error {
            print(error)
        }
    }
    
    func deleteCocktail(with cocktailName: String) {
        let fetchRequest = CocktailData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", cocktailName)
        
        do {
            let results = try viewContext.fetch(fetchRequest)
            if let objectToDelete = results.first {
                viewContext.delete(objectToDelete)
                saveContext()
            }
        } catch let error {
            print(error)
        }
    }
    
    // MARK: - Core Data Saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
