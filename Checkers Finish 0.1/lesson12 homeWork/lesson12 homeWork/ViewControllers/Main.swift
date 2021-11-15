//
//  ViewController1.swift
//  lesson12 homeWork
//
//  Created by Женя  on 24.07.21.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var customBottonPlay: CustomButton!
    @IBOutlet weak var customButtonSettings: CustomButton!
    @IBOutlet weak var customButtonResults: CustomButton!
    @IBOutlet weak var custonButtonAbout: CustomButton!
    
    
    
    
    let storyboards: [String] = ["PlayersNamesViewController", "StoryboardSettings", "StoryboardResults", "StoryboardAbout"]
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let manager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBottonPlay.delegate = self
        customButtonSettings.delegate = self
        customButtonResults.delegate = self
        custonButtonAbout.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        localized()
    }
    
    func getViewController(with sb: String) -> UIViewController {
        let currentStoryboard = UIStoryboard(name: sb, bundle: nil)
        let currentViewController = currentStoryboard.instantiateInitialViewController()
        currentViewController?.modalPresentationStyle = .fullScreen
        return currentViewController!
    }
    
    func localized () {
        customBottonPlay.text = "startGame_button_text".localized
        customButtonSettings.text = "setting_button_text".localized
        customButtonResults.text = "results_button_text".localized
        custonButtonAbout.text = "about_button_text".localized
    }
        

    
}

extension ViewController1: CustomButtonDelegate {
    func buttonDidTap(_ sender: CustomButton) {
        let vc = self.getViewController(with: storyboards[sender.tag])
        
        (vc as? PlayersNamesViewController)?.viewControllerDismiss = {
            self.present(self.getViewController(with: "ViewControllerPlay"), animated: true, completion: nil)
        }
        
        if sender.tag == 0 {
            guard manager.fileExists(atPath: documentDirectory.appendingPathComponent("savedGame").path) else {
                present(vc, animated: true, completion: nil)
                return
            }
            presentAlertController(with: nil, message: "alert_message_text".localized,
                                   actions: UIAlertAction(title: "alert_title1_text".localized,
                                                          style: .default,
                                                          handler: { _ in
                                                                SaveData.deleteSavedGame()
                                                                self.view.removeBlurView()
                                                                self.present(vc, animated: true, completion: nil)}),
                                   UIAlertAction(title: "alert_title2_text".localized,style:
                                                    .default,handler: { _ in
                                                        self.present(self.getViewController(with: "ViewControllerPlay"), animated: true, completion: nil)}))
        } else {
        present(vc, animated: true, completion: nil)
        }
    }
}
