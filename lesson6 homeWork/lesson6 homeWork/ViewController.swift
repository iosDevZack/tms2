//
//  ViewController.swift
//  lesson6 homeWork
//
//  Created by Женя  on 29.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
//        task1.Создайте класс студент. Дабавтье свойства: имя, фомилия, год рождения, средний бал (1-10)
        
        print("__________________________TASK1__________________________")
        
        let student: Student = Student(firstname: "John",
                                       lastname: "Smith",
                                       yearWasBorn: 2000,
                                       gradeStudent: 8.5)
        
        print(student.firstname)
        print(student.lastname)
        print(student.yearWasBorn)
        print(student.gradeStudent)
        
        
//        2.Создайте класс группа (студенческая группа, как в универе) с свойствами название группы и массивом студентов (как журнал)
        
        print("__________________________TASK2__________________________")
        
        let students1 : GroupOfStudents = GroupOfStudents (nameOfGroup: "Lawyers",
                                                          nameOfStudents: "Bob",
                                                          gradeOfStudents: 5.5)
        
        let students2 : GroupOfStudents = GroupOfStudents (nameOfGroup: "Lawyers",
                                                           nameOfStudents: "Tony",
                                                           gradeOfStudents: 7.8)
        
        let students3 : GroupOfStudents = GroupOfStudents (nameOfGroup: "Lawyers",
                                                           nameOfStudents: "Andry",
                                                           gradeOfStudents: 6.9)
        
        let students4 : GroupOfStudents = GroupOfStudents (nameOfGroup: "Lawyers",
                                                           nameOfStudents: "Jane",
                                                           gradeOfStudents: 2.3)
        
        let students5 : GroupOfStudents = GroupOfStudents (nameOfGroup: "Lawyers",
                                                           nameOfStudents: "Gomer",
                                                           gradeOfStudents: 8.7)
        
        let students6 : GroupOfStudents = GroupOfStudents (nameOfGroup: "Lawyers",
                                                           nameOfStudents: "Bart",
                                                           gradeOfStudents: 9.2)
        
        let groupOfStudentsArray :[GroupOfStudents] = [students1, students2, students3 , students4 , students5, students6]
        
        print(students1.nameOfGroup)
        print(students1.nameOfStudents)
        print(students1.gradeOfStudents)

        print(students2.nameOfGroup)
        print(students2.nameOfStudents)
        print(students2.gradeOfStudents)

        print(students3.nameOfGroup)
        print(students3.nameOfStudents)
        print(students3.gradeOfStudents)

        print(students4.nameOfGroup)
        print(students4.nameOfStudents)
        print(students4.gradeOfStudents)

        print(students5.nameOfGroup)
        print(students5.nameOfStudents)
        print(students5.gradeOfStudents)

        print(students6.nameOfGroup)
        print(students6.nameOfStudents)
        print(students6.gradeOfStudents)
        
        
        
//        3. Напишите метод в группе, которая выведет красиво всех студентов группы.
        
        print("__________________________TASK3__________________________")
        
        groupOfStudentsArray[0].studentsArray()
        groupOfStudentsArray[1].studentsArray()
        groupOfStudentsArray[2].studentsArray()
        groupOfStudentsArray[3].studentsArray()
        groupOfStudentsArray[4].studentsArray()
        groupOfStudentsArray[5].studentsArray()
        
        
        
//        4. Напишите метод который удалит из группы тех студентов, у кого средний бал меньше заданного(бал передать в качестве параметра)
        
        print("__________________________TASK4__________________________")
        
        groupOfStudentsArray[0].middleGrade(8)
        groupOfStudentsArray[1].middleGrade(8)
        groupOfStudentsArray[2].middleGrade(8)
        groupOfStudentsArray[3].middleGrade(8)
        groupOfStudentsArray[4].middleGrade(8)
        groupOfStudentsArray[5].middleGrade(8)
        
        
       
        
        
        
        
        
        
        
    }


}

