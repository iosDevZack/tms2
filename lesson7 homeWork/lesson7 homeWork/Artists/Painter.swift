//
//  Painter.swift
//  lesson7 homeWork
//
//  Created by Женя  on 3.07.21.
//

import Foundation

class Painter: Artist {
    var show: String
    let aliasName: String
    let aliasSurname : String
   
    init(name: String, surname: String, show: String, aliasName: String, aliasSurname : String) {
        self.show = show
        self.aliasName = aliasName
        self.aliasSurname = aliasSurname
        super.init(name: name, surname: surname)
    }
    
    
    override func permofance () {
        print("Class Painter, Name: \(name), Surname: \(surname), is \(show)")
        let name = aliasName
        let surname = aliasSurname
        print("Class Painter Switch , Name: \(name), Surname: \(surname)")
    }
}
