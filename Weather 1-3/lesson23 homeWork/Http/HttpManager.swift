//
//  HttpManager.swift
//  lesson23 homeWork
//
//  Created by Женя  on 17.09.21.
//

import UIKit
import Alamofire


class HttpManager {
    static let shared = HttpManager()
    
    func getWeather(_ URL: String , _ onCompletion: @escaping ([WeatherClass]) -> Void) {
     
        AF.request(URL, method: .get).response(queue: DispatchQueue.global(qos: .userInteractive)) { response in
            guard let data = response.data else {return}
            onCompletion(ParseManager.shared.parseWeather(data))
        }
    }
    
        
}
