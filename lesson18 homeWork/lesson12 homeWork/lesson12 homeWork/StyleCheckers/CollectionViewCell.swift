//
//  CollectionViewCell.swift
//  lesson12 homeWork
//
//  Created by Женя  on 22.08.21.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    func switchSet(_ sender: UISwitch)
}


class CollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switchSelector: UISwitch!
    
    weak var delegate: CollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
   
    }
    
    func setImageChekers (value: StyleCheckersClass) {
        imageView.image = UIImage(named: value.styleCheker ?? "blue")
        switchSelector.isOn = value.position == true ? true : false 
         }
    
    
    @IBAction func setSwitch(_ sender: Any) {
        delegate?.switchSet(switchSelector)
        }
    }

