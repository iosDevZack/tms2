//
//  WeatherClass.swift
//  lesson23 homeWork
//
//  Created by Женя  on 17.09.21.
//

import UIKit

class WeatherClass {
    var temp: Int
    var prognozId: Int
    var prognoz: String
    var city: String
    
    init(temp: Int, prognozId: Int, city: String, prognoz: String) {
        
        
        self.temp = temp
        self.prognozId = prognozId
        self.city = city
        self.prognoz = prognoz
        
    }

}
