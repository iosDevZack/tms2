//
//  ViewController.swift
//  lesson8 homeWorkPart4
//
//  Created by Женя  on 8.07.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    let numberRows = 8;
    let numberColomns = 8;
    view.backgroundColor = .red
    let viewRes = UIView(frame: CGRect(x: 40, y: 250, width: 320, height: 320))
    viewRes.backgroundColor = .white
    view.addSubview(viewRes)

    func chessDesk() {
        for row in 0...numberRows - 1 {
            for colum in 0...numberColomns - 1  {
                let view = UIView(frame: CGRect(x: row * 40, y: colum * 40, width: 40, height: 40))
                viewRes.addSubview(view)
                if (row + colum) % 2 == 0 {
                view.backgroundColor = .black
                    }
                }
            }
        }
        chessDesk()
    }
}

