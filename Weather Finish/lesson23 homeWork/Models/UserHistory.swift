//
//  UserHistory.swift
//  lesson23 homeWork
//
//  Created by Женя  on 2.10.21.
//

import UIKit
import RealmSwift
import AVFoundation

class UserHistory: Object {
    @Persisted var cityName: String = ""
    @Persisted var temperature: Int = 0
    
    convenience init(cityName: String, temperature: Int) {
        self.init()
        self.cityName = cityName
        self.temperature = temperature
    }
    
    var prettyPrinted: String {
        return "\(cityName) - \(temperature)"
    }
}
