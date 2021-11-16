//
//  CoreDataManager.swift
//  lesson12 homeWork
//
//  Created by Женя  on 14.11.21.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
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
                print("saved")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveGame(by game: Game) {
        let gameDataBase = GameDataBase(context: persistentContainer.viewContext)
       gameDataBase.dateOfGame = game.dateOfGame
        game.players?.forEach({ player in
            let playerDataBase = PlayerDataBase(context: persistentContainer.viewContext)
            playerDataBase.convert(by: player)
            gameDataBase.addToPlayerDataBase(playerDataBase)
        })
        persistentContainer.viewContext.insert(gameDataBase)
        saveContext()
    }
    
    func getGame() -> [Game] {
        var array: [Game] = []
        do {
            let games = try persistentContainer.viewContext.fetch(GameDataBase.fetchRequest())
            games.forEach { game in
                guard let game = game as? GameDataBase else { return }
                array.append(Game(from: game))
            }
        } catch (let ok) {
            print(ok)
        }
        return array
    }
    
    func deleteAllData() {
        do {
            let games = try persistentContainer.viewContext.fetch(GameDataBase.fetchRequest())
            games.forEach { game in
                guard let game = game as? GameDataBase else { return }
                persistentContainer.viewContext.delete(game)
                saveContext()
            }
        } catch (let ok) {
            print(ok)
        }
        
    }
}


