//
//  Dogs.swift
//  lesson7 homeWork
//
//  Created by Женя  on 5.07.21.
//

import Foundation

class Dogs: Life {
    
    override init(countLeg: Int, animal: Bool, lifeIs: Bool) {
        super.init(countLeg: countLeg, animal: animal, lifeIs: lifeIs)
        
    }
    
    override func getInfo() {
        print("Dog Count Leg: \(countLeg), Animal?: \(animal), Life is?: \(lifeIs)")
        
    }
}
