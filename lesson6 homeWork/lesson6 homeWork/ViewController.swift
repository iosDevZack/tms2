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
        
        let groupOfStudents: GroupOfStudents = GroupOfStudents(nameOfGroup: "lawyers",
                                                               nameOfStudents: ["Bob", "Tony", "Andry", "Jane", "Gomer", "Bart"],
                                                               gradeOfStudents: [5.5, 7.8, 6.9, 2.3, 8.7, 9.2])
        print(groupOfStudents.nameOfGroup)
        print(groupOfStudents.nameOfStudents)
        print(groupOfStudents.gradeOfStudents)
        
        
//        3. Напишите метод в группе, которая выведет красиво всех студентов группы.
        
        print("__________________________TASK3__________________________")
        
        groupOfStudents.printAll()
        
        
//        4. Напишите метод который удалит из группы тех студентов, у кого средний бал меньше заданного(бал передать в качестве параметра)
        
        print("__________________________TASK4__________________________")
        
        groupOfStudents.middleGrade(7.0)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }


}

