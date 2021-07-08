//
//  ViewController.swift
//  lesson8 homeWorkPart2
//
//  Created by Женя  on 8.07.21.
//

import UIKit

class ViewController: UIViewController {

    let valueOne = UITextField(frame: CGRect(x: 141.0, y: 203.0, width: 133.0, height: 34.0))
    let labelPlus = UILabel(frame: CGRect(x: 200.0, y: 275.0, width: 46.0, height: 21.0))
    let valueTwo = UITextField(frame: CGRect(x: 141.0, y: 337.0, width: 133.0, height: 34.0))
    let buttonAction = UIButton(frame: CGRect(x: 192.0, y: 401.0, width: 30.0, height: 34.0))
    let valueResult = UILabel(frame: CGRect(x: 141.0, y: 475.0, width: 133.0, height: 28.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    view.addSubview(valueOne)
    view.addSubview(labelPlus)
    view.addSubview(valueTwo)
    view.addSubview(buttonAction)
    view.addSubview(valueResult)
    
        
    view.backgroundColor = .gray
    valueOne.placeholder = "Enter you value1"
    valueOne.textAlignment = .center
    valueOne.backgroundColor = .white
    
    valueTwo.placeholder = "Enter your value2"
    valueTwo.textAlignment = .center
    valueTwo.backgroundColor = .white
    
    labelPlus.text = "+"
    labelPlus.textColor = .blue
    
    buttonAction.setTitle("=", for: .normal)
    buttonAction.setTitleColor(.blue, for: .normal)
        
    
    valueResult.text = ""
    valueResult.textColor = .black
    valueResult.textAlignment = .center
    
    
    
    
    
    buttonAction.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside) }
    
            @objc
        func buttonTapped(_ sender: UIButton) {
            guard let numValue1 = valueOne.text, !numValue1.isEmpty else {
                valueResult.text = "Eror"
                return
            }
            guard let numValue2 = valueTwo.text, !numValue2.isEmpty else {
                valueResult.text = "Eror"
                return
            }
    
    
            if let numValue3 = Int(numValue1) {
                if let numValue4 = Int(numValue2) {
                    let summa = numValue3  + numValue4
                    valueResult.text = String(summa)
                } else {
                    valueResult.text = "Eror"
                }
            } else {
                valueResult.text = "Eror"
        }
    
    }
    
}



