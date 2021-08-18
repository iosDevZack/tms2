//
//  Alert.swift
//  lesson12 homeWork
//
//  Created by Женя  on 17.08.21.
//

import UIKit

extension UIViewController {
    
    @discardableResult
    func presentAlertController(with title: String?, message: String, preferredStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) -> UIAlertController {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in })
        
        actions.forEach { alert.addAction($0) }
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
        return alert
    }
}
