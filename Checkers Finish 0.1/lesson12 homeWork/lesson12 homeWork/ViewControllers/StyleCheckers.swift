//
//  StyleCheckers.swift
//  lesson12 homeWork
//
//  Created by Женя  on 21.08.21.
//

import UIKit

class StyleCheckers: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var back: UIButton!
    
    var dataSource: [StyleCheckersClass] = [StyleCheckersClass(whiteChecker: "Red1", blackChecker: "Blue1", stateSwitch: true),
                                            StyleCheckersClass(whiteChecker: "Red2", blackChecker: "Blue2", stateSwitch: false),
                                            StyleCheckersClass(whiteChecker: "Red3", blackChecker: "Blue3", stateSwitch: false),
                                            StyleCheckersClass(whiteChecker: "Red4", blackChecker: "Blue4", stateSwitch: false),
                                            StyleCheckersClass(whiteChecker: "Red5", blackChecker: "Blue5", stateSwitch: false),
                                            StyleCheckersClass(whiteChecker: "Red6", blackChecker: "Blue6", stateSwitch: false),
                                            StyleCheckersClass(whiteChecker: "Red7", blackChecker: "Blue7", stateSwitch: false),
                                            StyleCheckersClass(whiteChecker: "Red8", blackChecker: "Blue8", stateSwitch: false)]
                                              
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()

        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("styleOfChecker").path) {
            dataSource = SaveData.getStyleChecker()
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        localized()
    }
    
    func localized() {
        back.setTitle("BackStyle_button_text".localized, for: .normal)
    }
    
    
    private func setCollectionView () {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension StyleCheckers: UICollectionViewDataSource {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return dataSource.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell",
                                                              for: indexPath) as? CollectionViewCell else {
              return CollectionViewCell() }
     
        cell.switchSelector.tag = indexPath.item
        cell.setImageChekers(with: dataSource[indexPath.item])
        cell.delegate = self
         
         return cell
     }
}

extension StyleCheckers: UICollectionViewDelegateFlowLayout  {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             return CGSize(width: 145, height: 125)
     }
}
extension StyleCheckers: CollectionViewCellDelegate {
    func switchSet(_ sender: UISwitch) {
        for value in 0 ..< dataSource.count {
            dataSource[value].stateSwitch = value == sender.tag ? true : false
        }
        collectionView.reloadData()
        SaveData.savedStyleCheckers(styleCheckers: dataSource)
    }
}
