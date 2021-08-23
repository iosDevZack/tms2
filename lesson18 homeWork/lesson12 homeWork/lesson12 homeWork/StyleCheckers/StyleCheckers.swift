//
//  StyleCheckers.swift
//  lesson12 homeWork
//
//  Created by Женя  on 21.08.21.
//

import UIKit

class StyleCheckers: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fileManager = FileManager.default
    
    var styleOfCheckers: [StyleCheckersClass] = [StyleCheckersClass(styleCheker: "Blue2", position: false),
                                                 StyleCheckersClass(styleCheker: "blue", position: false),
                                                 StyleCheckersClass(styleCheker: "Red2", position: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        getDataSave()
        

    }
    
    private func setCollectionView () {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func saveData()  {
        let data = try? NSKeyedArchiver.archivedData(withRootObject: styleOfCheckers, requiringSecureCoding: true)
        let fileUrl = documentDirectory.appendingPathComponent(KeysUserDefaults.styleCheckerKey.rawValue)
        try? data?.write(to: fileUrl)
    }

    func getDataSave() {
        if fileManager.fileExists(atPath: documentDirectory.appendingPathComponent(KeysUserDefaults.styleCheckerKey.rawValue).path) {
                  let fileURL = documentDirectory.appendingPathComponent(KeysUserDefaults.styleCheckerKey.rawValue)
                  guard let data  = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else {return}
                  
                  let newObject = try?  NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [StyleCheckersClass]
                  
            styleOfCheckers = newObject ?? []
    }
    }
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        saveData()
        self.dismiss(animated: true, completion: nil)
    }
    
    

}

extension StyleCheckers: UICollectionViewDataSource {
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return styleOfCheckers.count
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
                     return UICollectionViewCell()
          }
     
        cell.switchSelector.tag = indexPath.item
        cell.setImageChekers(value: styleOfCheckers[indexPath.item])
        cell.delegate = self
          return cell
     }
}

extension StyleCheckers: UICollectionViewDelegateFlowLayout  {
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
             return CGSize(width: 100, height: 100)
 }
    

}
extension StyleCheckers: CollectionViewCellDelegate {
    func switchSet(_ sender: UISwitch) {
        for value in 0 ..< styleOfCheckers.count {
            styleOfCheckers[value].position = value == sender.tag ? true : false
        }
        collectionView.reloadData()
    }
}
