//
//  NewsTableViewCell.swift
//  lesson23 homeWork
//
//  Created by Женя  on 23.11.21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setData(with news: Articles) {
        title.text = news.title
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        title.text = ""
    }
    
}
