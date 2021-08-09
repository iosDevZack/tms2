//
//  TableViewCell.swift
//  lesson16 homeWork
//
//  Created by Женя  on 7.08.21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    func rgbTable ( value : Colors) {
        label.attributedText = NSAttributedString(string: value.colorName, attributes:[.foregroundColor: value.color])
    }
    
}
