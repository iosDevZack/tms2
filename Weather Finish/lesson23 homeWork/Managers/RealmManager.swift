//
//  RealmManager.swift
//  lesson23 homeWork
//
//  Created by Женя  on 2.10.21.
//

import UIKit
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    let localRealm = try! Realm()
    func createHistoryWeather(cityName: String, temperarture: Int) {
        let userHistory = UserHistory(cityName: cityName, temperature: temperarture)
        
        do {
            try localRealm.write {
                localRealm.add(userHistory)
                
                print("Added History")
            }
        } catch(let e) {
            print(e)
        }
    }
    
    func getCityAndTemp() -> [UserHistory] {
        let history = localRealm.objects(UserHistory.self)
        return history.reversed()
    }
}
