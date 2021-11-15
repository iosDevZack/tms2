//
//  Checker.swift
//  lesson12 homeWork
//
//  Created by Женя  on 17.08.21.
//

import UIKit

class CheckerClass: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var colorTag: Int?
    var positionTag: Int? 
    var queen: Bool
    
    init(colorTag: Int?, positionTag: Int?, queen: Bool) {
        self.colorTag = colorTag
        self.positionTag = positionTag
        self.queen = queen
    }
    
    func encode(with coder: NSCoder) { // Кодировка данных
        coder.encode(colorTag, forKey: "color")
        coder.encode(positionTag, forKey: "positionTag")
        coder.encode(queen, forKey: "queen")
    }
    
    required init?(coder: NSCoder) { // Декодировка данных
        self.colorTag = coder.decodeObject(forKey: "color") as? Int
        self.positionTag = coder.decodeObject(forKey: "positionTag") as? Int
        self.queen = coder.decodeBool(forKey: "queen")

    }
}
