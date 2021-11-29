//
//  SelectedNewsViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 24.11.21.
//

import UIKit
import WebKit

class SelectedNewsViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var url: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: url) else { return }
        let request = URLRequest(url: url)
        
        webView.load(request)

    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
