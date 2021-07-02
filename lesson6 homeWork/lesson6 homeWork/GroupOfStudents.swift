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
    var listStudents: [Student] = []
    
    init(nameOfGroup: String, listStudents: [Student] = []) {
        self.nameOfGroup = nameOfGroup
        self.listStudents = listStudents
    }
 
    
    
//    3. Напишите метод в группе, которая выведет красиво всех студентов группы.
    
    func studentsArray (student: Student) {
        listStudents.append(student)
        print("STUDENT")
        student.printStudent()
        print("Add in Group: \(nameOfGroup)")
        
    }
    
    
    
//   4. Напишите метод который удалит из группы тех студентов, у кого средний бал меньше заданного(бал передать в качестве параметра)
    
    func remove (where gradeStudent: Float) {
        var index = listStudents.count - 1
        
        while index >= 0 {
            if listStudents[index].gradeStudent < gradeStudent {
                listStudents.remove(at: index)
            }
            
            index -= 1
        
        }
    }



}
