//
//  Player.swift
//  lesson12 homeWork
//
//  Created by Женя  on 7.11.21.
//

import UIKit

class Player {
    var name: String?
    var checkersColor: String?
    var champion: Bool = false
    var gameDataBase: GameDataBase?
    
    init(name: String?, checkersColor: String?, champion: Bool) {
        self.name = name
        self.checkersColor = checkersColor
        self.champion = champion
    }
}
