//
//  ViewController.swift
//  lesson16 homeWork
//
//  Created by Женя  on 3.08.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var rgbColor: [Colors] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<200{
        let green = Int.random(in: 0...255)
        let red = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        rgbColor.append(Colors(color: UIColor(red: CGFloat(green)/255, green: CGFloat(red)/255, blue: CGFloat(blue)/255, alpha: 1),
        colorName: "RGB - \(red) \(green) \(blue)"))
    
        }
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}
// количство ячеек
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell()}
        cell.rgbTable(value: rgbColor[indexPath.row])
        return cell
    }
}
// высота ячеек
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    }

