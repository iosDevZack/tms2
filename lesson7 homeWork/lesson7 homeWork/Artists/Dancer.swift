//
//  Dancer.swift
//  lesson7 homeWork
//
//  Created by Женя  on 3.07.21.
//

import Foundation


class Dancer: Artist {
    var show: String
    init(name: String, surname: String, show: String) {
        self.show = show
        super.init(name: name, surname: surname)
    }
    
    
    override func permofance () {
        print("Class Dancer, Name: \(name), Surname: \(surname), is  \(show)")
    }
}
