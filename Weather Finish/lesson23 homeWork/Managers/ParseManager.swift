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
        for i in prognozId {
            let u = i.1
             prognozId = u["id"]
             prognoz = u["description"].rawValue as! String
        }
        let city = json["name"].string
        
        weatherArray.append(WeatherClass(temp: temp,
                                         prognozId: prognozId.rawValue as? Int ?? 0,
                                         city: city ?? "",
                                         prognoz: prognoz))
            
       return weatherArray
    }
    
    func parseNews(_ data: Data) -> News {
        var news = News()
        
        guard let json = try? JSON(data: data) else { return News()}
        
        var arrayArticles: [Articles] = []
        let articles = json["articles"]
        
        for i in 0..<articles.count {
            var article = Articles()
            article = Articles(title: articles[i]["title"].string ?? "",
                               description: articles[i]["description"].string ?? "",
                               url: articles[i]["url"].string ?? "")
            arrayArticles.append(article)
        }
        news = News(articles: arrayArticles)
        
        return news
    }
}
    

