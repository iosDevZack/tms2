//
//  Singer.swift
//  lesson7 homeWork
//
//  Created by Женя  on 4.07.21.
//

import Foundation

class Singer : Artist {
    var show: String
    init(name: String, surname: String, show: String) {
        self.show = show
        super.init(name: name, surname: surname)
    }
    
    
    override func permofance () {
        print("Class Singer, Name: \(name), Surname: \(surname), is  \(show)")
    }
}
