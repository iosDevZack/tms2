//
//  ViewController.swift
//  lesson5 homeWork
//
//  Created by Женя  on 25.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        
        
        //        task1. Создайте строку английский алфавит, все буквы малые от а до z
        //
        //        задайте константу - один из символов этого алфавита
        //
        //        Используя цикл for определите под каким индексом в строке находится этот символ.
        
        
        
        print("_______________task1_______________")
        let english = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let oneChar = "j"
        print(english)
        
        for (index, value) in english.enumerated() {
            print("index - \(index), value - \(value)")
            
            if index == 9 {
                print("J - nine index")
            }
        }
//      tsak1 variant2
        
//        func getChar(from string: String, at index: Int) -> String? {
//            guard string.count > index else {return nil}
//            for (indexString, value) in english.enumerated() {
//                if indexString == index {
//                    return String(value)
//                }
//            }
//            return nil
//        }
//
//        print(getChar(from: english, at: 9) ?? 0)
        
        
        
//                  task2. Создать массив "дни в месяцах"
//                  12 элементов содержащих количество дней в соответствующем месяце используя
//                  цикл for и этот массив
//                  -выведите количество дней в каждом месяце (без имен месяцев)
//                  -используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
//                  -сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
//                  -сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
//                  -для произвольно выбранной даты (месяц и день) посчитайте посчитайте количество дней до этой даты отначала года

        print("_______________task2_______________")
//      Создать массив "дни в месяцах" 12 элементов содержащих количество дней в соответствующем месяце
 
        var days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        print(days)
        
//        -выведите количество дней в каждом месяце (без имен месяцев)
        
        for value in days {
            print(value)
        }
//      -используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
 
        var months = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
        
        for (value, months) in months.enumerated() {
            print("\(months) have \(days[value])")
        }
        
//      -сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
        
        var arrayTuple = [("jan", 31), ("feb", 28), ("mar", 31), ("apr", 30), ("may", 31), ("jun", 30), ("jul", 31), ("aug", 31),
                                 ("sep", 30),( "oct", 31), ("nov", 30), ("dec", 31)]
        
        for (months, days) in arrayTuple {
            print("\(months) have \(days)")
            
        }
        
//       -сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)

        for value in 1...arrayTuple.count {
           var (months, days) = arrayTuple[arrayTuple.count - value]
            print("\(months) have \(days)")
        }
        
        
//        -для произвольно выбранной даты (месяц и день) посчитайте посчитайте количество дней до этой даты отначала года

        let daysOfBirth = (day: 8, month: 6)
        var daysBeforeBirth = 0
        
        for value in 0..<(daysOfBirth.month - 1) {
            daysBeforeBirth += days[value]
        }
        
        daysBeforeBirth += daysOfBirth.day
        print("\(daysBeforeBirth)")
            
            
            
        
//        task3. Создайте строку алфавит и пустой массив строк
//
//        в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и
//        добавляйте в массив, причем так, чтобы на выходите получился массив с алфавитом задом-наперед.
        
        print("_______________task3_______________")
        
        let stroka = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var arrayStrok = [String]()
        
        for value in stroka {
            arrayStrok.insert(String(value), at: 0)
        }
        print(arrayStrok)
        
        
        
  


//        task4. Создать строку произвольного текста, минимум 200 символов.
        
//               Используя цикл и оператор свич посчитать количество букв, цифр и символов.

       print("_______________task4_______________")
        
        let numString = "qwerwertyuio/qwertyuiop';.,./.,mnbvcxzdtyuiop[poiuytsd/.,mnbvcxcvbnm,;'poiuytrtyuio;lknbvcz"
        var one: Int = 0
        var two: Int = 0
        var three: Int = 0
        
        for value in numString {
            switch value {
            case "a"..."z":
                two += 1
            case "/", ";", ".", ",", "'":
                three += 1
            default:
                one += 1
            }
        }
        
        
        print(one)
        print(two)
        print(three)

        
        
        
        
        
        
        
//        task5. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну. которая принимает последовательность и возвращает массив в обратном порядке.
//                Чтобы не дублировать код, сделайте так, чтобы функция с последовательностю вызвала первую
        
        
       print("_______________task5_______________")
        
        func numMassOne() -> Any {
            var mass = [1, 5, 8, 4, 3, 10, 57]
            print(mass)
            return  mass = mass.reversed()
        }
        numMassOne()
       
        
        
        
        
//
//        task6. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, а согласные маленькими, а цифры меняет на соответствующие слова (9->nine и т.д)

//        task7. Создайте функцию которая принимает массив чисел и возвращает максимальное число из этого массива. Функцию мах не использовать.

        print("_______________task7_______________")
        
        let arrayFive: [Int] = [2, 5, 6, 4, 7, 8]
        
        func arrayMax (_ arrayFive: [Int]) -> Int {
            var numMax = arrayFive[0]
            for value in arrayFive {
                numMax = (numMax > value) ? numMax: value
        }
            return numMax
        }
         print(arrayMax(arrayFive))
        
        
        
        
        
        
        
//        task8. Создайте функцию, которая принимает массив чисел и возвращает новый массив булевых значений.
//                Где true - число четное, false - число не четное.
//                Например: массив [2,3,6,8,7], результат функции [true,false,true,true,false]
        
        
        print("_______________task8_______________")

        var arrayOne: [Int] = [2,3,6,8,7]
        print(arrayOne)

        func numMassTwo(_ arrayOne : [Int]) -> [Bool] {
            var bool: [Bool] = []

            for value in arrayOne {
                _ = (value % 2 == 0) ? bool.append(true) : bool.append(false)
            }

            return bool
        }

        print(numMassTwo(arrayOne))
            

            
        
        
           
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
}


}




