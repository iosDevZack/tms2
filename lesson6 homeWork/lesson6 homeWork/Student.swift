//
//  Student.swift
//  lesson6 homeWork
//
//  Created by Женя  on 29.06.21.
//

import Foundation
//       task1.Создайте класс студент. Дабавтье свойства: имя, фомилия, год рождения, средний бал(1-10)
class Student {
    let firstname: String
    let lastname: String
    let yearWasBorn: Int
    var gradeStudent: Float
    
    init(firstname: String, lastname: String, yearWasBorn: Int, gradeStudent: Float) {
        self.firstname = firstname
        self.lastname = lastname
        self.yearWasBorn = yearWasBorn
        self.gradeStudent = gradeStudent
        
    }
    
    func printStudent() {
        print("Name: \(firstname)")
        print("lastname: \(lastname)")
        print("yearWasBorn: \(yearWasBorn)")
        print("gradeStudent: \(gradeStudent)")
    }
}
