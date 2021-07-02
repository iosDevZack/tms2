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
        
        student.printStudent()
        
        
        
//        2.Создайте класс группа (студенческая группа, как в универе) с свойствами название группы и массивом студентов (как журнал)
        
        print("__________________________TASK2__________________________")
        
        let list = GroupOfStudents(nameOfGroup: "Lawyers")
        
        let student1 : Student = Student (firstname: "Bob",
                                           lastname: "Talen",
                                           yearWasBorn: 1991,
                                           gradeStudent: 5.5)

        let student2 : Student = Student (firstname: "Tony",
                                           lastname: "Pip",
                                           yearWasBorn: 1992,
                                           gradeStudent: 7.8)

        let student3 : Student = Student (firstname: "Andry",
                                           lastname: "Jakcson",
                                           yearWasBorn: 1994,
                                           gradeStudent: 6.9)

        let student4 : Student = Student (firstname: "Jane",
                                           lastname: "Smith",
                                           yearWasBorn: 1994,
                                           gradeStudent: 2.3)

        let student5 : Student = Student (firstname: "Gomer",
                                           lastname: "Sipm",
                                           yearWasBorn: 1993,
                                           gradeStudent: 8.7)

        let student6 : Student = Student (firstname: "Lawyers",
                                           lastname: "Bart",
                                           yearWasBorn: 1992,
                                           gradeStudent: 9.2)

        let Students  = [student1, student2, student3 , student4 , student5, student6]
        
        print(student1.firstname)
        print(student1.lastname)
        print(student1.yearWasBorn)
        print(student1.gradeStudent)
        
        print(student2.firstname)
        print(student2.lastname)
        print(student2.yearWasBorn)
        print(student2.gradeStudent)
        
        print(student3.firstname)
        print(student3.lastname)
        print(student3.yearWasBorn)
        print(student3.gradeStudent)
        
        print(student4.firstname)
        print(student4.lastname)
        print(student4.yearWasBorn)
        print(student4.gradeStudent)
        
        print(student5.firstname)
        print(student5.lastname)
        print(student5.yearWasBorn)
        print(student5.gradeStudent)
        
        print(student6.firstname)
        print(student6.lastname)
        print(student6.yearWasBorn)
        print(student6.gradeStudent)
        
 
        
//        3. Напишите метод в группе, которая выведет красиво всех студентов группы.
        
        print("__________________________TASK3__________________________")
        
        list.studentsArray(student: student1)
        list.studentsArray(student: student2)
        list.studentsArray(student: student3)
        list.studentsArray(student: student4)
        list.studentsArray(student: student5)
        list.studentsArray(student: student6)
        
        
//        4. Напишите метод который удалит из группы тех студентов, у кого средний бал меньше заданного(бал передать в качестве параметра)
        
        print("__________________________TASK4__________________________")
        
        list.remove(where: 7.7)
       
   
   
    }


}

