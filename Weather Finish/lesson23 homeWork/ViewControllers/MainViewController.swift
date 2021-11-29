//
//  ViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 8.09.21.
//

import UIKit
import AVFoundation // отвечает за представление классов AVAsset, AVPlayer
import AVKit // отвечает за классы представления на контроллере
import UserNotifications // отвечает за нотификации
import CoreLocation

class MainViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        activityIndicator.startAnimating()
    }
}
