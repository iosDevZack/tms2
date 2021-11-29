//
//  HistoryUserTableViewCelll.swift
//  lesson23 homeWork
//
//  Created by Женя  on 2.10.21.
//

import UIKit
import RxSwift
import RxCocoa

class HistoryUserTableViewCelll: UITableViewCell {
    
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    func setupUserHistory(by userHistory: UserHistory) {
        nameCityLabel.text = userHistory.cityName
        temperature.text = String(userHistory.temperature)
    }
}
