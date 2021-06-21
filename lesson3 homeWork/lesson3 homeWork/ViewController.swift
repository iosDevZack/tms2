//
//  ViewController.swift
//  lesson3 homeWork
//
//  Created by Женя  on 18.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
//       task 1. Создать тюпл с тремя параметрами:
//        - максимальное количество отжиманий
//        - максимальное количество подтягиваний
//        - максимальное количество приседаний
//        Заполните его своими достижениями и распечатайте его через print()
        
        var one = (pushUp: 50 , pullUps: 20, squats: 30)
        print(one)
        

//        task 2.Также сделайте три отдельных вывода в консоль для каждого параметра. При том одни значения доставайте по индексу, а другие по параметру

        print(one.0)
        print(one.1)
        print(one.2)
        
        print(one.pushUp)
        print(one.pullUps)
        print(one.squats)
        
        
//        task 3. Создайте такой же тюпл для другого человека (например друга) с такими же параметрами, но с другими значениями. Используйте промежуточную переменную чтобы поменять соответствующие значения первого тюпла на значения второго
        
        var two = (pushUp: 52 , pullUps: 22, squats: 32)
        
        print(two)
        var three = one
        one = two
        two = three
        print(one)
        print(two)
        
        
//        task 4.Создайте третий тюпл с теми же параметрами, но значения это разница между соответствующими значениями первого и второго тюплов. Результат выведите в консоль
        
        let dif = (pushUp:(one.pushUp - two.pushUp), pullUps:(one.pullUps - two.pullUps), squats:(one.squats - two.squats))
        print(dif)

        
//        task 5. Создать пять строковых констант. Одни константы это только цифры, другие содержат еще и буквы. Найти сумму всех этих констант приведя их к Int. (Используйте и optional binding-это if let, и forced unwrapping-это использование !, и оператор ??)
//        Когда посчитаете сумму, то представьте свое
//        выражение в виде строки
//        Например: 5 + nil + 2 + 3 + nil = 10.
        
        let numOne: String = "num1"
        let numTwo: String = "num2"
        let numThree: String = "64"
        let numFour: String = "4"
        let numFive: String = "num5"

        var sum =  (Int(numTwo) ?? 0) + (Int(numFour) ?? 0)
                if Int(numThree) != nil {


                    sum += Int(numThree)!

                }

                if Int(numFour) != nil {

                } else  {


                    sum += 0


                }

                if let numFive = Int(numFive) {

                    sum += numFive

                }


                print ("\(Int(numOne)) + \(Int(numTwo)) + \(Int(numThree)!) + \(Int(numFour)!) + \(Int(numFive)) = \(sum)")

        
        
//       task 6. Создать тюпл с тремя параметрами:
//        сode, message, errorMessage (число, строка и строка). В этом тюпле code всегда содержит данные, но сама
//        строка приходит
//        только в одном поле. Если code от 200 до 300 исключительно, то выводите
//        message, в противном случает выводите errorMessage. После этого
//        проделайте тоже самое только без участия code.

        
        let tuple1: (code: Int, message: String?, errorMessage: String?) = (Int.random(in: 200..<300), "Message", nil)

        if Int.random(in: 200..<300) != nil {
            print(tuple1.message!)
        } else {
            print(tuple1.errorMessage!)
    }
        let (_, message, errorMassage) = tuple1
        if message != nil {
            print(message!)
        } else {
            print(errorMassage!)
        }

        
//        task 7. Создайте 5 тюплов с тремя параметрами: имя, номер машины, оценка за контрольную. При создании этих тюплов не должно быть никаких данных. После создания каждому студенту установите имя.
//        Некоторым установите номер машины. Некоторым установите результат контрольной. Выведите в консоль:
//        - имена студента
//        - есть ли у него машина
//        - если да, то какой номер
//        - был ли на контрольной
//        - если да, то какая оценка
        
        let studentTuple1: (name: String?, carNumber: String?, grade: Int?)
        let studentTuple2: (name: String?, carNumber: String?, grade: Int?)
        let studentTuple3: (name: String?, carNumber: String?, grade: Int?)
        let studentTuple4: (name: String?, carNumber: String?, grade: Int?)
        let studentTuple5: (name: String?, carNumber: String?, grade: Int?)
        
        studentTuple1.name = "John"
        studentTuple2.name = "Bob"
        studentTuple3.name = "Gomer"
        studentTuple4.name = "Bart"
        studentTuple5.name = "Jane"
        
        studentTuple1.carNumber = "1234"
        studentTuple2.carNumber = "5678"
        studentTuple3.carNumber = "9012"
        studentTuple4.carNumber = nil
        studentTuple5.carNumber = nil
        
        studentTuple1.grade = nil
        studentTuple2.grade = nil
        studentTuple3.grade = nil
        studentTuple4.grade = 5
        studentTuple5.grade = 8
        
        print(studentTuple1.name!)
        print(studentTuple2.name!)
        print(studentTuple3.name!)
        print(studentTuple4.name!)
        print(studentTuple5.name!)
        
        //        - есть ли у него машина
        //        - если да, то какой номер
        if studentTuple1.carNumber != nil {
            print("John have a car, car number-\(studentTuple1.carNumber!)")
        } else {
            print("John not have a car")
        }
        
        if studentTuple2.carNumber != nil {
            print("Bob have a car, car number-\(studentTuple2.carNumber!)")
        } else {
            print("Bob not have a car")
        }
        
        if studentTuple3.carNumber != nil {
            print("Gomer have a car, car number-\(studentTuple3.carNumber!)")
        } else {
            print("Gomer not have a car")
        }
        
        if studentTuple4.carNumber != nil {
            print("Bart have a car, car number-\(studentTuple4.carNumber!)")
        } else {
            print("Bart not have a car")
        }
        
        if studentTuple5.carNumber != nil {
            print("Jane have a car, car number-\(studentTuple5.carNumber!)")
        } else {
            print("Jane not have a car")
        }
        
        //        - был ли на контрольной
        //        - если да, то какая оценка
        
        
        if studentTuple1.grade != nil {
            print("Grade of John - \(studentTuple1.grade!)")
        } else {
            print("John was not on the test")
        }
        
        if studentTuple2.grade != nil {
            print("Grade of Bob - \(studentTuple2.grade!)")
        } else {
            print("Bob was not on the test")
        }
        
        if studentTuple3.grade != nil {
            print("Grade of Gomer - \(studentTuple3.grade!)")
        } else {
            print("Gomer was not on the test")
        }
        
        if studentTuple4.grade != nil {
            print("Grade of Bart - \(studentTuple4.grade!)")
        } else {
            print("Bart was not on the test")
        }
        
        if studentTuple5.grade != nil {
            print("Grade of Jane- \(studentTuple5.grade!)")
        } else {
            print("Jane was not on the test")
        }
        
        
//       task 8. Создайте тюпл из 5-ти опциональных Int. (Подсказка - опциональный Int это Int?). Посчитайте сумму этих 5- ти элементов используя:
//        - в одном случае используйте optional binding - в другом forced unwrapping
//        - а в третьем оператор ??
        
        let tupleEight: (one:Int?, two:Int?, three:Int?, four:Int?, five:Int?) = (1 , 2, 3, 4, 5)
        
        //forced unwrapping
        let tupleSum1 = Int(tupleEight.one!) + Int(tupleEight.two!) + Int(tupleEight.three!) + Int(tupleEight.four!) + Int(tupleEight.five!)
        print(tupleSum1)
        
        // оператор ??
        let tupleSum2 = Int(tupleEight.one ?? 0) + Int(tupleEight.two ?? 0) + Int(tupleEight.three ?? 0 ) + Int(tupleEight.four ?? 0) + Int(tupleEight.five ?? 0)
        print(tupleSum2)
        
        //optional binding
        var tupleSum3 = tupleSum1
        
        if tupleEight.one != nil {
            tupleSum3 += 0
            print("\(tupleEight.one!) + \(tupleEight.two!) + \(tupleEight.three!) + \(tupleEight.four!) + \(tupleEight.five!) = \(tupleSum1)" )
        } else {
    print("error")
        }
        
        // и так дальше для каждого элемента
        
        if tupleEight.two != nil {
            tupleSum3 += 0
            print("\(tupleEight.one!) + \(tupleEight.two!) + \(tupleEight.three!) + \(tupleEight.four!) + \(tupleEight.five!) = \(tupleSum1)" )
        } else {
    print("error")
        }
        
        if tupleEight.three != nil {
            tupleSum3 += 0
            print("\(tupleEight.one!) + \(tupleEight.two!) + \(tupleEight.three!) + \(tupleEight.four!) + \(tupleEight.five!) = \(tupleSum1)" )
        } else {
    print("error")
        }
        
        if tupleEight.four != nil {
            tupleSum3 += 0
            print("\(tupleEight.one!) + \(tupleEight.two!) + \(tupleEight.three!) + \(tupleEight.four!) + \(tupleEight.five!) = \(tupleSum1)" )
        } else {
    print("error")
        }
        
        if tupleEight.five != nil {
            tupleSum3 += 0
            print("\(tupleEight.one!) + \(tupleEight.two!) + \(tupleEight.three!) + \(tupleEight.four!) + \(tupleEight.five!) = \(tupleSum1)" )
        } else {
    print("error")
        }
//        let numOne: String = "num1"
//        let numTwo: String = "num2"
//        let numThree: String = "64"
//        let numFour: String = "4"
//        let numFive: String = "num5"
//
//        var sum =  (Int(numTwo) ?? 0) + (Int(numFour) ?? 0)
//                if Int(numThree) != nil {
//
//
//                    sum += Int(numThree)!
//
//                }
//
//                if Int(numFour) != nil {
//
//                } else  {
//
//
//                    sum += 0
//
//
//                }
//
//                if let numFive = Int(numFive) {
//
//                    sum += numFive
//
//                }
//
//
//                print ("\(Int(numOne)) + \(Int(numTwo)) + \(Int(numThree)!) + \(Int(numFour)!) + \(Int(numFive)) = \(sum)")

        
        
        
        
        
        
        
        
        
        
        
}
}
