//
//  Extension + getStoryboard.swift
//  lesson23 homeWork
//
//  Created by Женя  on 15.09.21.
//

import UIKit

extension UIViewController {
      
     func getViewController (_ id: String) -> UIViewController  {
          
          let storyBoard  = UIStoryboard(name: id, bundle: nil)
          let vc = storyBoard.instantiateViewController(withIdentifier: id)
          vc.modalTransitionStyle = .crossDissolve
          vc.modalPresentationStyle = .fullScreen
          return vc
          
     }
}
