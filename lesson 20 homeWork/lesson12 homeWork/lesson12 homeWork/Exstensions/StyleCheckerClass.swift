//
//  StyleChecker.swift
//  lesson12 homeWork
//
//  Created by Женя  on 22.08.21.
//

import UIKit

class StyleCheckersClass: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var styleCheker: String?
    var position: Bool?
    
    init(styleCheker: String?, position: Bool?) {
        self.styleCheker = styleCheker
        self.position = position
    }
    
    func encode(with coder: NSCoder) { // Кодировка данных
        coder.encode(styleCheker, forKey: "color")
        coder.encode(position, forKey: "position")
    }
    
    required init?(coder: NSCoder) { // Декодировка данных
        self.styleCheker = coder.decodeObject(forKey: "color") as? String
        self.position = coder.decodeObject(forKey: "position") as? Bool
    }
}
