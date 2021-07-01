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
    let nameOfStudents: String
    var gradeOfStudents: Float
 
    
    init(nameOfGroup: String, nameOfStudents: String, gradeOfStudents: Float) {
        self.nameOfGroup = nameOfGroup
        self.nameOfStudents = nameOfStudents
        self.gradeOfStudents = gradeOfStudents
    }
    
//    3. Напишите метод в группе, которая выведет красиво всех студентов группы.
    
    func studentsArray () {
        print("Name of group: \(self.nameOfGroup)")
        print("Name of student: \(self.nameOfStudents)")
        print("You middle grade: \(self.gradeOfStudents)")
        print("")
    }
    
    
    
//   4. Напишите метод который удалит из группы тех студентов, у кого средний бал меньше заданного(бал передать в качестве параметра)
    
    func middleGrade(_ grade: Float)  {
        if self.gradeOfStudents >= grade {
            print("Name of group: \(self.nameOfGroup)")
            print("Name of student: \(self.nameOfStudents)")
            print("You middle grade: \(self.gradeOfStudents)")
        } else {
            print("delete")
        }
    }


}
