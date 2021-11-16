//
//  ViewControllerAbout.swift
//  lesson12 homeWork
//
//  Created by Женя  on 31.07.21.
//

import UIKit

class ViewControllerAbout: UIViewController {
    @IBOutlet weak var historyLabel: UILabel!
    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        localized()
    }
    
    func localized() {
        historyLabel.text = "historyLabel_label_text".localized
        back.setTitle("bakButtonAction_button_text".localized, for: .normal)
    }
    
    @IBAction func bakButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
