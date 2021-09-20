//
//  WeatherViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 8.09.21.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var nameOfCityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var decribingLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var fellLikesLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func backButtonAction (_sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

