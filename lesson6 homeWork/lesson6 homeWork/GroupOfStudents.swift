//
//  GroupOfStudents.swift
//  lesson6 homeWork
//
//  Created by Женя  on 30.06.21.
//

import Foundation

//   task2.Создайте класс группа (студенческая группа, как в универе) с свойствами название группы и массивом студентов (как журнал)

class GroupOfStudents {
    let nameOfGroup: String
    let nameOfStudents: [String]
    var gradeOfStudents: [Float]
    
    init(nameOfGroup: String, nameOfStudents: [String], gradeOfStudents: [Float]) {
        self.nameOfGroup = nameOfGroup
        self.nameOfStudents = nameOfStudents
        self.gradeOfStudents = gradeOfStudents
    }
    
    //        3. Напишите метод в группе, которая выведет красиво всех студентов группы.
    
    func printAll () {
        print("Hello: \(self.nameOfGroup)")
        print("Student: \(self.nameOfStudents[0]), Your middle grade: \(self.gradeOfStudents[0])")
        print("Student: \(self.nameOfStudents[1]), Your middle grade: \(self.gradeOfStudents[1])")
        print("Student: \(self.nameOfStudents[2]), Your middle grade: \(self.gradeOfStudents[2])")
        print("Student: \(self.nameOfStudents[3]), Your middle grade: \(self.gradeOfStudents[3])")
        print("Student: \(self.nameOfStudents[4]), Your middle grade: \(self.gradeOfStudents[4])")
        print("Student: \(self.nameOfStudents[5]), Your middle grade: \(self.gradeOfStudents[5])")
        
    }
    
    //   4. Напишите метод который удалит из группы тех студентов, у кого средний бал меньше заданного(бал передать в качестве параметра)
    
    
    func middleGrade(_ grade: Float ) {
        
        if self.gradeOfStudents[5] >= grade { // 5.5
            print("Student: \(self.nameOfStudents[5]), Your middle grade: \(self.gradeOfStudents[5])")
        } else {
            self.gradeOfStudents.remove(at: 5)
        }
        
        if self.gradeOfStudents[4] >= grade { // 7.8
            print("Student: \(self.nameOfStudents[4]), Your middle grade: \(self.gradeOfStudents[4])")
        } else {
            self.gradeOfStudents.remove(at: 4)
        }
    
        if self.gradeOfStudents[3] >= grade { // 6.9
            print("Student: \(self.nameOfStudents[3]), Your middle grade: \(self.gradeOfStudents[3])")
        } else {
            self.gradeOfStudents.remove(at: 3)
        }
        
        if self.gradeOfStudents[2] >= grade { // 2.3
            print("Student: \(self.nameOfStudents[2]), Your middle grade: \(self.gradeOfStudents[2])")
        } else {
            self.gradeOfStudents.remove(at: 2)
        }
    
        if self.gradeOfStudents[1] >= grade { // 8.7
            print("Student: \(self.nameOfStudents[1]), Your middle grade: \(self.gradeOfStudents[1])")
        } else {
            self.gradeOfStudents.remove(at: 1)
        }
    
        if self.gradeOfStudents[0] >= grade { // 9.2
            print("Student: \(self.nameOfStudents[0]), Your middle grade: \(self.gradeOfStudents[0])")
        } else {
            self.gradeOfStudents.remove(at: 0)
        }
}
}
