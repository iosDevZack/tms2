//
//  ViewController4.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//

import UIKit

class ViewControllerResults: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var backButtonAction: UIButton!
    
    var dataSource: [Game] = []
    var players: [Player] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let game = CoreDataManager.shared.getGame()
        dataSource = game

        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        localized()
    }
    
    func setupTableView() {
        resultTableView.dataSource = self
        resultTableView.delegate = self
        resultTableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
        resultTableView.tableFooterView = UIView()
        
    }
    
    func localized() {
        resultLabel.text = "resultLabel_label_text".localized
        backButtonAction.setTitle("backButtonAction_button_text".localized, for: .normal)
        clearButton.setTitle("clearHistory_button_text".localized, for: .normal)
    }
    
    @IBAction func deleteResult(_ sender: UIButton) {
        CoreDataManager.shared.deleteAllData()
        dataSource = []
        resultTableView.reloadData()
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewControllerResults: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell") as? ResultTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setData(with: dataSource[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}



extension ViewControllerResults: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0
    }
    
}


