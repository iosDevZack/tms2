//
//  ViewController1.swift
//  lesson12 homeWork
//
//  Created by Женя  on 24.07.21.
//

import UIKit

class ViewController1: UIViewController {
    let storyboards: [String] = ["StoryboardPlay", "StoryboardSettings", "StoryboardResults", "StoryboardAbout"]
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let manager = FileManager.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getViewController(with sb: String) -> UIViewController {
        let currentStoryboard = UIStoryboard(name: sb, bundle: nil)
        let currentViewController = currentStoryboard.instantiateInitialViewController()
        currentViewController?.modalPresentationStyle = .fullScreen
        return currentViewController!
    }
    

    @IBAction func goToPlayButton(_ sender: UIButton) {
        if sender.tag == 0 && manager.fileExists(atPath: documentDirectory.appendingPathComponent("checkers").path)  {
            presentAlertController(with: "Start game", message: "Do you want to continue?",
                                   actions: UIAlertAction(title: "New game",
                                                          style: .default, handler: { _ in
                                                            try? self.manager.removeItem(atPath: self.documentDirectory.appendingPathComponent("checkers").path)
                                                            self.present(self.getViewController(with: self.storyboards[0]), animated: true, completion: nil)}),
                                    UIAlertAction(title: "Continue",style:
                                                    .default,handler: { _ in
                                                        self.present(self.getViewController(with: self.storyboards[0]), animated: true, completion: nil)}))
        } else {
        present(getViewController(with: storyboards[sender.tag]), animated: true, completion: nil)
    }
}


}
