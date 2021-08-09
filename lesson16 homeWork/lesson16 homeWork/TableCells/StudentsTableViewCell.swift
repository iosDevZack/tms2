//
//  StudentsTableViewCell.swift
//  lesson16 homeWork
//
//  Created by Женя  on 8.08.21.
//

import UIKit

class StudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func printStudent ( value : Students) {
              labelName.text = "Name: \(value.name)"
              labelAverage.text = "\((value.averageMark * 10).rounded()/10)"
     }
    
    override func prepareForReuse() {
         super .prepareForReuse()
         
         labelName.text = ""
         labelAverage.text =  ""
    }
}
