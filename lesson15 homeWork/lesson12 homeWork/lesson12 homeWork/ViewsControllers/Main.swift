//
//  ViewController1.swift
//  lesson12 homeWork
//
//  Created by Женя  on 24.07.21.
//

import UIKit

class ViewController1: UIViewController {
    let nextPage: [String] = ["StoryboardPlay", "StoryboardSettings", "StoryboardResults", "StoryboardAbout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getNextPage(from sb: String) -> UIViewController? {
        let storyboard1 = UIStoryboard(name: sb, bundle: nil)
        guard let vc = storyboard1.instantiateInitialViewController() else { return nil }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        return vc
    }
    

    @IBAction func goToPlayButton(_ sender: UIButton) {
        let storyboard1 = UIStoryboard(name: nextPage[sender.tag], bundle: nil)
        let vc = storyboard1.instantiateInitialViewController()

        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)

    }
}


