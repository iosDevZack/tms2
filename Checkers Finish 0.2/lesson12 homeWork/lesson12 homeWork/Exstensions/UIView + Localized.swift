//
//  UIView + Localized.swift
//  lesson12 homeWork
//
//  Created by Женя  on 21.09.21.
//
import UIKit

extension UIView {
    @IBInspectable var localizedName: String {
        get {
            return self.localizedName
        }

        set {
            if let label = self as? UILabel {
                label.text = NSLocalizedString(newValue, comment: "")
            }

            if let button = self as? UIButton {
                button.setTitle(NSLocalizedString(newValue, comment: ""), for: .normal)
            }
        }
    }
}
