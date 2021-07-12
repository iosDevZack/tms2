//
//  ViewController2.swift
//  lesson9 homeWork
//
//  Created by Женя  on 10.07.21.
//

import UIKit


class ViewController2: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var enterYourAge: UITextField!
    @IBOutlet weak var enterYourSex: UITextField!
    
    
    var resultString: String = ""
    
    
    weak var delegate: ViewController2Delegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = resultString
    
        enterYourAge.delegate = self
        enterYourSex.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              if textField == enterYourAge {
                enterYourSex.becomeFirstResponder()
              } else {
                enterYourSex.resignFirstResponder()
              }
            return true
         }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard !string.isEmpty else{return true}
        if textField == enterYourAge {
                       switch string {
                       case "0"..."9":
                       return true
                       default:
                            return false
                       }
                       }
                  if textField == enterYourSex {
                       switch string {
                       case "M", "F":
                       return true
                       default:
                            return false
                       }
                       }
                  return true
             }

        
                
    @IBAction func CloseButtonAction(_ sender: UIButton) {
          guard let age = enterYourAge.text, !age.isEmpty,
                let age1 = Int(age),
                let sex = enterYourSex.text, !sex.isEmpty else {
                print("error")
          return
          }
    delegate?.finish(Age: age1, Sex: sex)
        
    dismiss(animated: true, completion: nil)
    
    
}

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

