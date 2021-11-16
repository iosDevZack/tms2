//
//  SaveData.swift
//  lesson12 homeWork
//
//  Created by Женя  on 7.11.21.
//

import UIKit

let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let manager = FileManager.default

class SaveData:  NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true

    var savedCheckersPosition: [CheckerClass?]
    var savedStyleOfCheckers: StyleCheckersClass?
    var savedCountSeconds: Int?
    var savedCountMinutes: Int?
    var savedCurrentChecker: Int?
    var nameFirstPlayer: String?
    var nameSecondPlayer: String?
    var savedDateOfStartGame: String?


    init(savedCheckersPosition: [CheckerClass?], savedStyleOfCheckers: StyleCheckersClass?, savedCountSeconds: Int?, savedCountMinutes: Int?, savedCurrentChecker: Int?, nameFirstPlayer: String?, nameSecondPlayer: String?, playMusic: Bool, language: Bool, currentLanguage: String) {
        self.savedCheckersPosition = savedCheckersPosition
        self.savedStyleOfCheckers = savedStyleOfCheckers
        self.savedCountSeconds = savedCountSeconds
        self.savedCountMinutes = savedCountMinutes
        self.savedCurrentChecker = savedCurrentChecker
        self.nameFirstPlayer = nameFirstPlayer
        self.nameSecondPlayer = nameSecondPlayer
//        self.playMusic = playMusic
//        self.language = language
//        self.currentLanguage = currentLanguage
    }

    init(savedCheckersPosition: [CheckerClass?], savedCountSeconds: Int?, savedCountMinutes: Int?, savedCurrentChecker: Int?, nameFirstPlayer: String?, nameSecondPlayer: String?, date: String?) {
        self.savedCheckersPosition = savedCheckersPosition
        self.savedCountSeconds = savedCountSeconds
        self.savedCountMinutes = savedCountMinutes
        self.savedCurrentChecker = savedCurrentChecker
        self.nameFirstPlayer = nameFirstPlayer
        self.nameSecondPlayer = nameSecondPlayer
        self.savedDateOfStartGame = date
    }

    func encode(with coder: NSCoder) { // Кодирование данных
        coder.encode(savedCheckersPosition, forKey: "savedCheckersPosition")
        coder.encode(savedStyleOfCheckers, forKey: "savedStyleOfCheckers")
        coder.encode(savedCountSeconds, forKey: "savedCountSeconds")
        coder.encode(savedCountMinutes, forKey: "savedCountMinutes")
        coder.encode(savedCurrentChecker, forKey: "savedCurrentChecker")
        coder.encode(nameFirstPlayer, forKey: "nameFirstPlayer")
        coder.encode(nameSecondPlayer, forKey: "nameSecondPlayer")
        coder.encode(savedDateOfStartGame, forKey: "date")

    }

    required init?(coder: NSCoder) { // Декодирование данных
        self.savedCheckersPosition = coder.decodeObject(forKey: "savedCheckersPosition") as? [CheckerClass] ?? []
        self.savedStyleOfCheckers = coder.decodeObject(forKey: "savedStyleOfCheckers") as? StyleCheckersClass
        self.savedCountSeconds = coder.decodeObject(forKey: "savedCountSeconds") as? Int
        self.savedCountMinutes = coder.decodeObject(forKey: "savedCountMinutes") as? Int
        self.savedCurrentChecker = coder.decodeObject(forKey: "savedCurrentChecker") as? Int
        self.nameFirstPlayer = coder.decodeObject(forKey: "nameFirstPlayer") as? String
        self.nameSecondPlayer = coder.decodeObject(forKey: "nameSecondPlayer") as? String
        self.savedDateOfStartGame = coder.decodeObject(forKey: "date") as? String

    }
    

    
    // Сохраняем имена игроков по ключу
    static func savedNameOfPlayer(nameFirstPlayer:String, nameSecondPlayer: String) {
        let names = [nameFirstPlayer, nameSecondPlayer]
        let data1 = try? NSKeyedArchiver.archivedData(withRootObject: names, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent("savedNames")
        try? data1?.write(to: fileURL)

    }
    // Получаем сохраненные имена игроков по ключу
    static func getNamesOfPlayers() -> [String] {
        let fileURL = documentDirectory.appendingPathComponent("savedNames")
        
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return [] }
        
        let nameOfPlayers = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [String]
        
        return(nameOfPlayers ?? [])
    }
    // Удаляем сохраненные имена игроков
    static func deleteSavedNames() {
        try? manager.removeItem(atPath: documentDirectory.appendingPathComponent("savedNames").path)
    }
    
//__________________________________________________________________________________________________
    
    
    // Сохраняем стиль шашек по ключу
    static func savedStyleCheckers(styleCheckers: [StyleCheckersClass]) {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: styleCheckers, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent("styleOfChecker")
        try? data?.write(to: fileURL)
    }
    // Получаем сохраненный стиль шашек по ключу
    static func getStyleChecker() -> [StyleCheckersClass] {
        let fileURL = documentDirectory.appendingPathComponent("styleOfChecker")
        
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return [] }
        
        let stylesOfChecker = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [StyleCheckersClass]
        return (stylesOfChecker ?? [])
    }
// ______________________________________________________________________________
    
    // Сохраняем фоновое изображение
    static func saveBackgroundImage(image: UIImage) {
        let data = image.pngData()
        
        let fileURL = documentDirectory.appendingPathComponent("BackgroundImage")
            try? data?.write(to: fileURL)
    }
    // Получаем сохраненное фоновое изображение
    static func getBackgroundImage() -> UIImage {
        let fileURL = documentDirectory.appendingPathComponent("BackgroundImage")
            
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return UIImage() }
            
        let image = UIImage(data: data)
        return (image ?? UIImage())
    }
//______________________________________________________________________
    
    // Сохраняем игру по ключу
    static func saveGame(saveData: SaveData) {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: saveData, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent("savedGame")
        try? data?.write(to: fileURL)
    }
    
    

    // Получаем сохраненную игру по ключу
    static func getSaveGame() -> SaveData {
        let test = SaveData(savedCheckersPosition: [], savedCountSeconds: nil, savedCountMinutes: nil, savedCurrentChecker: nil, nameFirstPlayer: "", nameSecondPlayer: "", date: "")
        let fileURL = documentDirectory.appendingPathComponent("savedGame")
        
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return test }
        
        let save = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? SaveData
        
        return(save ?? test)
    }
    
    // Удаляем сохраненную игру по ключу
    static func deleteSavedGame() {
        try? manager.removeItem(atPath: documentDirectory.appendingPathComponent("savedGame").path)
    }
}
