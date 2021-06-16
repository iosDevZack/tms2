//
//  ViewController.swift
//  lesson 2 homeWork
//
//  Created by Евгений Закревский  on 15.06.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        
        // task1: Создайте 4 дробных числа в константах.
        let a: Double = 1.5
        let b: Double = 2.7
        let c: Double = 3.9
        let d: Double = 4.2
        
        //task2: Выведите в консоль сумму и произведение целых частей,
        //      а так же сумму и произведение дробных частей этих чисел
        
       //Выведите в консоль сумму целых частей
        let sum = Int(a) + Int(b) + Int(c) + Int(d)
        print("Сумма целых частей:\(sum)")
        
        
        //task3: Выведите в консоль произведение целых частей
        let sum1 = Int(a) * Int(b) * Int(c) * Int(d)
        print("Произведение целых частей:\(sum1)")
        
       
        //task4: Выведите в консоль сумму дробных частей
        let a1 = Int(a)
        let a2 = Int(b)
        let a3 = Int(c)
        let a4 = Int(d)
        
        let one = a - Double(a1)
        let two = b - Double(a2)
        let three = c - Double(a3)
        let four = d - Double(a4)
        
        let sum2 = one + two + three + four
        // Это действие (ниже) для красоты циферок (конечного результата)
        let sum3 = sum2 * 10
        let sum4 = Int(sum3)
        print("Сумма дробных частей:\(sum4)")
        
        
        
        
        //task5: Выведите в консоль произведение дробных частей
        let sum5 = one * two * three * four
        print("Произведение дробных частей:\(sum5)")
        
        
        
        
        //task6: Задайте любое целое число и напишите конструкцию if else, которая будет выводить в консоль является ли это число четным
        
        let numOne: Int = 8
        let numTwo: Int = 4
        let numThree: Int = 2
        
        if numOne / numTwo == numThree {
            print("numOne is even")
        } else {
            print("numOne is not even")
            
        }
        
        

        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }


}

