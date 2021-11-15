//
//  GameDataBase+CoreDataProperties.swift
//  lesson12 homeWork
//
//  Created by Женя  on 14.11.21.
//
//

import Foundation
import CoreData


extension GameDataBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameDataBase> {
        return NSFetchRequest<GameDataBase>(entityName: "GameDataBase")
    }

    @NSManaged public var dateOfGame: Date?
    @NSManaged public var playerDataBase: NSSet?

}

// MARK: Generated accessors for playerDataBase
extension GameDataBase {

    @objc(addPlayerDataBaseObject:)
    @NSManaged public func addToPlayerDataBase(_ value: PlayerDataBase)

    @objc(removePlayerDataBaseObject:)
    @NSManaged public func removeFromPlayerDataBase(_ value: PlayerDataBase)

    @objc(addPlayerDataBase:)
    @NSManaged public func addToPlayerDataBase(_ values: NSSet)

    @objc(removePlayerDataBase:)
    @NSManaged public func removeFromPlayerDataBase(_ values: NSSet)

}

extension GameDataBase : Identifiable {

}
