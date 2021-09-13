//
//  ViewController3.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pageStyleAction (_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "StyleCheckers", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
}



