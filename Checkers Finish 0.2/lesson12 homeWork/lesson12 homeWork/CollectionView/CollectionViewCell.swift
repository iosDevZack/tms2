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
     
    @IBOutlet weak var whiteChecker: UIImageView!
    @IBOutlet weak var blackChecker: UIImageView!
    @IBOutlet weak var switchSelector: UISwitch!
    
    weak var delegate: CollectionViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setImageChekers (with style: StyleCheckersClass) {
        whiteChecker.image = UIImage(named: style.whiteChecker!)
        blackChecker.image = UIImage(named: style.blackChecker!)
        switchSelector.setOn(style.stateSwitch, animated: true)
         }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        whiteChecker.image = nil
        blackChecker.image = nil
    }
    
    
    @IBAction func setSwitch(_ sender: Any) {
        delegate?.switchSet(switchSelector)
        }
    }
