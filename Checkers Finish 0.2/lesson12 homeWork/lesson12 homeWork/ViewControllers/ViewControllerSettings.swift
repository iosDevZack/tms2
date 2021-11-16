//
//  ViewController3.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//

import UIKit

enum Language: Int {
    case english = 0
    case russian = 1
}

class ViewControllerSettings: UIViewController {
    @IBOutlet weak var settingsLable: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var styleCheckersButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var languageControl: UISegmentedControl!
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileManager = FileManager.default
    
    let iCodes: [String] = ["en", "ru"]
    
    var currentLanguage : Language = .english {
        didSet {
            switch self.currentLanguage {
            case .english: SettingsManager.shared.currentLanguageCode = "en"
            case .russian: SettingsManager.shared.currentLanguageCode = "ru"
            }
            localized()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let indexCode = iCodes.firstIndex(of: SettingsManager.shared.currentLanguageCode) {
            languageControl.selectedSegmentIndex = indexCode
            currentLanguage = Language(rawValue: indexCode) ?? .english
        }
        
    }
    
        
    
    private func selectChooseImageBackgroung () {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    @IBAction func backgroundStyle (_ sender: UIButton){
        selectChooseImageBackgroung()
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
    
    
    @IBAction func languageDidChange(_ sender: UISegmentedControl) {
        guard let selectedLanguage = Language(rawValue: sender.selectedSegmentIndex), selectedLanguage != currentLanguage else { return }
        currentLanguage = selectedLanguage
        
        }
    
    func localized() {
        
        settingsLable.text = "settingsLabel_label_text".localized
        languageLabel.text = "languageLabel_label_text".localized
        backgroundButton.setTitle("backgroundStyle_button_text".localized, for: .normal)
        styleCheckersButton.setTitle("pageStyleAction_button_text".localized, for: .normal)
        backButton.setTitle("Back_button_text".localized, for: .normal)
    }
}



extension ViewControllerSettings: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      
        guard let image = info[.originalImage] as? UIImage else {return}
        let data = image.pngData()
           
           let fileURL = documentDirectory.appendingPathComponent("BackgroundImage")
               try? data?.write(to: fileURL)
        print("choose")
        picker.dismiss(animated: true, completion: nil)
  
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("exit")
        picker.dismiss(animated: true, completion: nil)
    }
}
