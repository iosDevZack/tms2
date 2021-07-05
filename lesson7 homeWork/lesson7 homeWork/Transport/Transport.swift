//
//  Transport.swift
//  lesson7 homeWork
//
//  Created by Женя  on 4.07.21.
//

import Foundation

class Transport {
    var type: String
    var speed: Float
    var capacity: Int
    var costOneKm: Float 
    
    init(type: String, speed: Float, capacity: Int, costOneKm: Float) {
        self.type = type
        self.speed = speed
        self.capacity = capacity
        self.costOneKm = costOneKm
        
    }
    

    
    func costAndTimeWithDastance(distance: Double, forPeoples peoples: Int) {
        let rides = peoples / capacity + (peoples % capacity == 0 ? 0 : 1)
        let time = Float(distance) / speed * Float(rides)
        let cost = Float(distance) * costOneKm * Float(rides)
        print("rides: \(rides), time: \(time), cost: \(cost)")
        
    }
    
}

