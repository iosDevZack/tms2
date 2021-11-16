//
//  SettingsManager.swift
//  lesson12 homeWork
//
//  Created by Женя  on 24.09.21.
//

import UIKit

class SettingsManager {
    static let shared = SettingsManager()
    
    var currentLanguageCode: String {
        set {
            UserDefaults.standard.setValue(newValue, forKey: "currentLanguageCode")
        }
        
        get {
            return UserDefaults.standard.string(forKey: "currentLanguageCode") ?? "en"
        }
    }
}
