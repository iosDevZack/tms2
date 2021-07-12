//
//  ViewController.swift
//  lesson9 homeWork
//
//  Created by Женя  on 10.07.21.
//

import UIKit

protocol ViewController2Delegate: class {
    func finish(Age: Int, Sex: String)
}


class ViewController: UIViewController, ViewController2Delegate {
    func finish(Age: Int, Sex: String) {
        if Age > 50 && Sex == "M" {
            view.backgroundColor = .red
        } else {
            view.backgroundColor = .green
            if Sex == "F" {
                view.backgroundColor = .yellow
            } else {
                view.backgroundColor = .green
            }

        }
       
    }
    

    @IBOutlet weak var enterYourName: UITextField!
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionBatton(_ sender: UIButton) {
        guard let text = enterYourName.text, !text.isEmpty else {
                       print("error")
                       return
                  }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc2 = storyBoard.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 {
            vc2.resultString = "Hello \(text)"
            
            vc2.delegate = self
            
            vc2.modalPresentationStyle = .fullScreen
            present(vc2, animated: true, completion: nil)
        }
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}
