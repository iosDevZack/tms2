//
//  UIViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 10.10.21.
//

import UIKit

extension UIViewController {
    static func getViewController(by identifier: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        return storyboard.instantiateInitialViewController()
    }
    
}
