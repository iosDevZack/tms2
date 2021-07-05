//
//  Car.swift
//  lesson7 homeWork
//
//  Created by Женя  on 4.07.21.
//

import Foundation

class Car: Transport {
    
     override init(type: String, speed: Float, capacity: Int, costOneKm: Float) {
        super.init(type: type, speed: speed, capacity: capacity, costOneKm: costOneKm)
        
    }
    
    override func costAndTimeWithDastance(distance: Double, forPeoples peoples: Int) {
        let rides = peoples / capacity + (peoples % capacity == 0 ? 0 : 1)
        let time = Float(distance) / speed * Float(rides)
        let cost = Float(distance) * costOneKm * Float(rides)
        print("\(type) rides: \(rides), time: \(time), cost: \(cost)")
    }
}
