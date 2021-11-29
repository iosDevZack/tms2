//
//  NewsViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 26.10.21.
//

import UIKit

enum ChooseNews: Int {
    case newsAmerica = 0
    case newsRussia = 1
}

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    
    var dataSource: [[Articles]] = []
    
    var newsAmerica = News()
    
    var newRussia = News()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNews()
    }
    
    func getNews() {
        let group = DispatchGroup()
        
        group.enter()
        HttpManager.shared.getNews(ApiKey.keysNewsAmerciaURL.rawValue) { news in
            self.newsAmerica = news
            group.leave()
        }
        
        group.enter()
        HttpManager.shared.getNews(ApiKey.keysNewsRussiaURL.rawValue) { news in
            self.newRussia = news
            group.leave()
        }
        
        
        group.notify(queue: .main) {
            self.updateNews(news: self.newsAmerica)
            self.updateNews(news: self.newRussia)
            self.setupTableView()
            
        }
    }
    
    func updateNews(news: News) {
        dataSource.append(news.articles)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ChooseNews(rawValue: section) else { return 0 }
        
        switch section {
            
        case .newsAmerica:
            return dataSource[0].count
        case .newsRussia:
            return dataSource[1].count
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell") as? NewsTableViewCell, let section = ChooseNews(rawValue: indexPath.section) else { return UITableViewCell()
        }
        
        switch section {
            
        case .newsAmerica:
            cell.setData(with: dataSource[0][indexPath.row])
        case .newsRussia:
            cell.setData(with: dataSource[1][indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let section = ChooseNews(rawValue: section) else { return nil }
         
        switch section {
            
        case .newsAmerica:
            return "NEWS OF USA"
        case .newsRussia:
            return "НОВОСТИ МАТУШКИ РОССИИ"
        }
    }
    
    
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { // didSelectRowAt = Выбранная ячейка по нажатию
        
        tableView.deselectRow(at: indexPath, animated: true) // deselectRow = сбрасывание нажатия на ячейку
        
        let storyboard = UIStoryboard(name: "SelectedNewsViewController", bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() as? SelectedNewsViewController else { return }
        
        vc.url = dataSource[indexPath.section][indexPath.row].url ?? ""
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
