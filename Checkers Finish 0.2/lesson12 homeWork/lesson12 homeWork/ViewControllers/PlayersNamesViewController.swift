//
//  PlayersNamesViewController.swift
//  lesson12 homeWork
//
//  Created by Женя  on 3.11.21.
//

import UIKit

class PlayersNamesViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var notNamesLabel: UILabel!
    @IBOutlet weak var enterNameFirstPlayer: UILabel!
    @IBOutlet weak var enterNameSecondPlayer: UILabel!
    @IBOutlet weak var playerFirst: UITextField!
    @IBOutlet weak var playerSecond: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    var viewControllerDismiss: (() -> ())?
    
    deinit {
        viewControllerDismiss = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerFirst.delegate = self
        playerSecond.delegate = self
        
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: playerFirst, queue: .main) { _ in
            if self.playerFirst.text != "" {
                self.notNamesLabel.text = ""
            }
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification, object: playerSecond, queue: .main) { _ in
            if self.playerSecond.text != "" {
                self.notNamesLabel.text = ""
            }
        }
        
        localized()
    }
    
    func localized() {
        acceptButton.setTitle("accept_button_text".localized, for: .normal)
        cancelButton.setTitle("cancel_button_text".localized, for: .normal)
        enterNameFirstPlayer.text = "enterNameFirstPlayer_text".localized
        enterNameSecondPlayer.text = "enterNameSecondPlayer_text".localized
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == playerFirst {
            textField.resignFirstResponder()
            playerSecond.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func acceptButtonAction() {
        guard !playerFirst.text!.isEmpty, !playerSecond.text!.isEmpty else {
            notNamesLabel.text = "notNames_Label_text".localized
            notNamesLabel.textColor = .red
            return
        }
         SaveData.savedNameOfPlayer(nameFirstPlayer: playerFirst.text!, nameSecondPlayer: playerSecond.text!)
        
        dismiss(animated: true) {
            self.viewControllerDismiss?()
        }
    }
    
    @IBAction func canceButtonAction() {
        dismiss(animated: true, completion: nil)
    }
}
