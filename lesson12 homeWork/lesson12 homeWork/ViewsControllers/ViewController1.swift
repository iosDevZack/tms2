//
//  ViewController1.swift
//  lesson12 homeWork
//
//  Created by Женя  on 24.07.21.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToPlayButton(_ sender: UIButton) {
        let storyboard1 = UIStoryboard(name: "StoryboardPlay", bundle: nil)
        let vc = storyboard1.instantiateInitialViewController()
        
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func goToSettingsButton(_ sender: UIButton) {
        let storyboard1 = UIStoryboard(name: "StoryboardSettings", bundle: nil)
        let vc = storyboard1.instantiateInitialViewController()
        
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func goToResultsButton(_ sender: Any) {
        let storyboard1 = UIStoryboard(name: "StoryboardResults", bundle: nil)
        let vc = storyboard1.instantiateInitialViewController()
        
        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
