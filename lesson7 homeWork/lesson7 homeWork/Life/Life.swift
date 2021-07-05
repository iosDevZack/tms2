//
//  Life.swift
//  lesson7 homeWork
//
//  Created by Женя  on 5.07.21.
//

import Foundation

class Life {
    var countLeg: Int
    var animal: Bool
    var lifeIs: Bool
    
    init(countLeg: Int, animal: Bool, lifeIs: Bool ) {
        self.countLeg = countLeg
        self.animal = animal
        self.lifeIs = lifeIs
        
    }
    func getInfo() {
        print(" Count Leg: \(countLeg), Animal?: \(animal), Life is?: \(lifeIs)")
    }
    }

