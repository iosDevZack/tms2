//
//  RCManager.swift
//  lesson23 homeWork
//
//  Created by Женя  on 27.11.21.
//

import UIKit
import FirebaseRemoteConfig
import RxSwift

enum RCValues: String {
    case chooseGoogleMaps
}

class RCManager {
    static let shared = RCManager()
    
    var defaultValue: [String: Any?] = [RCValues.chooseGoogleMaps.rawValue: false]
    
    var remoteConfigConnetced: (() -> ())?
    var isActivated: Bool = false
    
    init() {
        
        RemoteConfig.remoteConfig().setDefaults(defaultValue as? [String: NSObject])
   
    }
    
    func connected() { //подключение к remoteConfig
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0.0) { status , error in
            guard status == .success else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            RemoteConfig.remoteConfig().activate { result, error in
                self.isActivated = result
                
                if !result {
                    print(error?.localizedDescription ?? "")
                }
                
                self.remoteConfigConnetced?()
            }
        }
    }
    
    func getBoolValue(from key: RCValues) -> Bool {
        return RemoteConfig.remoteConfig()[key.rawValue].boolValue
    }
}
