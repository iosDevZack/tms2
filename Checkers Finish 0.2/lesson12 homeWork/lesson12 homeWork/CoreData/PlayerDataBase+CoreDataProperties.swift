//
//  PlayerDataBase+CoreDataProperties.swift
//  lesson12 homeWork
//
//  Created by Женя  on 14.11.21.
//
//

import Foundation
import CoreData


extension PlayerDataBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlayerDataBase> {
        return NSFetchRequest<PlayerDataBase>(entityName: "PlayerDataBase")
    }

    @NSManaged public var colorOfCheckers: String?
    @NSManaged public var playerName: String?
    @NSManaged public var winner: Bool
    @NSManaged public var gameDataBase: GameDataBase?
    
    func convert(by player: Player) {
        self.playerName = player.name
        self.colorOfCheckers = player.checkersColor
        self.winner = player.champion
        
    }

}

extension PlayerDataBase : Identifiable {

}
