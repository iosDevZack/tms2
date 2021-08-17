//
//  Checker.swift
//  lesson12 homeWork
//
//  Created by Женя  on 17.08.21.
//

import UIKit

class Checker: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var colorTag: Int?
    var positionTag: Int?
    
    init(colorTag: Int?, positionTag: Int?) {
        self.colorTag = colorTag
        self.positionTag = positionTag
    }
    
    func encode(with coder: NSCoder) { // Кодировка данных
        coder.encode(colorTag, forKey: "color")
        coder.encode(positionTag, forKey: "position")
    }
    
    required init?(coder: NSCoder) { // Декодировка данных
        self.colorTag = coder.decodeObject(forKey: "color") as? Int
        self.positionTag = coder.decodeObject(forKey: "position") as? Int

    }
}
