//
//  ViewController.swift
//  lesson11 homeWork
//
//  Created by Женя  on 17.07.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var plusAndMinus: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var comma: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var buttons = [UIButton]()
        
        buttons.append(zero)
        buttons.append(one)
        buttons.append(two)
        buttons.append(three)
        buttons.append(four)
        buttons.append(five)
        buttons.append(six)
        buttons.append(seven)
        buttons.append(eight)
        buttons.append(nine)
        buttons.append(clear)
        buttons.append(plusAndMinus)
        buttons.append(percent)
        buttons.append(enter)
        buttons.append(plus)
        buttons.append(minus)
        buttons.append(multiplication)
        buttons.append(division)
        buttons.append(comma)
        
        
        for corner in buttons {
            corner.layer.cornerRadius = 42
            
        }
        
        
        
    }


}

