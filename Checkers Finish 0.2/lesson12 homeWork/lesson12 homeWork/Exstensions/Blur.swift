//
//  Blur.swift
//  lesson12 homeWork
//
//  Created by Женя  on 29.08.21.
//

import UIKit

extension UIView {

func addBlurView() {
    let blurEffect = UIBlurEffect(style: .light)
    let blurView = UIVisualEffectView(effect: blurEffect)
    blurView.frame = bounds
    blurView.tag = 222
    addSubview(blurView)
}

func removeBlurView() {
    self.subviews.first(where: {$0.tag == 222})?.removeFromSuperview()
    }
}
