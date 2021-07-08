//
//  ViewController.swift
//  lesson8 homeWorkPart1
//
//  Created by Женя  on 8.07.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueOne: UITextField!
    @IBOutlet weak var valueTwo: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
        
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let numValue1 = valueOne.text, !numValue1.isEmpty else {
            result.text = "Error"
            return
        }
        
        guard let numValue2 = valueTwo.text, !numValue2.isEmpty else {
            result.text = "Error"
            return
        }
        
        
        if let numValue3 = Int(numValue1) {
            if let numValue4 = Int(numValue2) {
                let summa = numValue3 + numValue4
                result.text = String(summa)
            } else {
                result.text = "Error"
            }
            
            } else {
                result.text = "Error"
        }
    }
}

