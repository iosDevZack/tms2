//
//  Game.swift
//  lesson12 homeWork
//
//  Created by Женя  on 14.11.21.
//

import UIKit

class Game {
    var dateOfGame: Date?
    var players: [Player]?
    
    init(from game: GameDataBase) {
        self.dateOfGame = game.dateOfGame
        self.players = game.playerDataBase?.allObjects.compactMap({ player -> Player in
            let player = player as! PlayerDataBase
            let playerOne = Player(name: player.playerName, checkersColor: player.colorOfCheckers, champion: player.winner)
            return playerOne
        })
    }
    
    init(dateOfGame: Date, players: [Player]) {
        self.dateOfGame = dateOfGame
        self.players = players
    }
}
