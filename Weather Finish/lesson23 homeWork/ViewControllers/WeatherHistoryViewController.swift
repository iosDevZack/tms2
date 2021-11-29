//
//  WeatherHistoryViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 2.10.21.
//

import UIKit
import RealmSwift
import UserNotifications
import RxSwift
import RxCocoa

class WeatherHistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var weatherHistory: [UserHistory] = []

    let disposeBag = DisposeBag()

    var dataSource = BehaviorSubject<[UserHistory]>(value: [])


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.dataSource = nil
        weatherHistory = RealmManager.shared.getCityAndTemp()
        setTableView()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        weatherHistory = []
    }

    private func setTableView() {
        tableView.delegate = self
        tableView.register(UINib(nibName: "HistoryUserTableViewCelll", bundle: nil), forCellReuseIdentifier: "HistoryUserTableViewCelll") // Регистрируем ячейку как обычно
        dataSource.bind(to: tableView.rx.items(cellIdentifier: "HistoryUserTableViewCelll", cellType: HistoryUserTableViewCelll.self)) { index, model, cell in
            cell.nameCityLabel.text = String(model.cityName)
            cell.temperature.text = String(model.temperature-273)

        }.disposed(by: disposeBag)
            dataSource
        .onNext(weatherHistory)
    }
}

extension WeatherHistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}
