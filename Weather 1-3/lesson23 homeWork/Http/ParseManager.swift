//
//  ParseManager.swift
//  lesson23 homeWork
//
//  Created by Женя  on 17.09.21.
//

import UIKit
import SwiftyJSON

class ParseManager {
    static let shared = ParseManager()
    
    func parseWeather(_ data: Data) -> [WeatherClass] {
        
        var weatherArray: [WeatherClass] = []
        guard let json = try? JSON(data: data), json["cod"].intValue != 404 else {return []}
        
        var prognoz = ""
        let temp = json["main"]["temp"].intValue
        var prognozId = json["weather"]
        for i in prognozId { let u = i.1
             prognozId = u["id"]
             prognoz = u["description"].rawValue as! String
        }
        let city = json["name"].string
        
        weatherArray.append(WeatherClass(temp: temp,
                                         prognozId: prognozId.rawValue as! Int,
                                         city: city ?? "",
                                         prognoz: prognoz))
            
        
        
       return weatherArray
    }
}
    

