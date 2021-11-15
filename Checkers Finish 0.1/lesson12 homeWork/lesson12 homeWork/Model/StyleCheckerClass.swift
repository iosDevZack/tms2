//
//  StyleChecker.swift
//  lesson12 homeWork
//
//  Created by Женя  on 22.08.21.
//

import UIKit

class StyleCheckersClass: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var whiteChecker: String?
    var blackChecker: String?
    var stateSwitch: Bool
    
    init(whiteChecker: String, blackChecker: String, stateSwitch: Bool) {
        self.whiteChecker = whiteChecker
        self.blackChecker = blackChecker
        self.stateSwitch = stateSwitch
    }
    
    func encode(with coder: NSCoder) { // КОДИРОВКА
        coder.encode(whiteChecker, forKey: "whiteChecker")
        coder.encode(blackChecker, forKey: "blackChecker")
        coder.encode(stateSwitch, forKey: "stateSwitch")
    }
    
    required init?(coder: NSCoder) { // ДЕКОДИРОВКА
        self.whiteChecker = coder.decodeObject(forKey: "whiteChecker") as? String
        self.blackChecker = coder.decodeObject(forKey: "blackChecker") as? String
        self.stateSwitch = coder.decodeBool(forKey: "stateSwitch")

    }
}
