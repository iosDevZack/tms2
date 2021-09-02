//
//  CustomButton.swift
//  lesson12 homeWork
//
//  Created by Женя  on 23.08.21.
//

import UIKit

protocol CustomButtonDelegate: AnyObject { // позволяет добавить нажатие на основном вью контроллере
    func buttonDidTap(_ sender: CustomButton)
}

@IBDesignable// Позволяет использовать этот класс в сториборде
class CustomButton: UIView {
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet var contentView: UIView!
    
    @IBInspectable var cornerRadius: CGFloat { // Позволяет добавить данные в настройки сториборда (создает окно с значениями)
        set {self.layer.cornerRadius = newValue} // Позволяет изменять значение
        get {return self.layer.cornerRadius} // Позволяет получить значение
}
        
    @IBInspectable var borderWidth: CGFloat {
        set {self.layer.borderWidth = newValue}
        get {return self.layer.borderWidth}
    }
    
    @IBInspectable override var backgroundColor: UIColor? {
        set { self.layer.backgroundColor = newValue?.cgColor}
        get { if let cgColor = self.layer.backgroundColor {
                return UIColor(cgColor: cgColor)
            }
            return .clear
        }
    }
    
    @IBInspectable var borderColor : UIColor{
        set {self.layer.borderColor = newValue.cgColor}
        get {
            if let cgColor = self.layer.borderColor {
                return UIColor(cgColor: cgColor)
            }
            return .clear
        }
    }
    
    @IBInspectable var font: UIFont {
        set { self.font = newValue }
        get { return self.font  }
    }
    
    @IBInspectable var isAnimated_: Bool = false
    
    weak var delegate: CustomButtonDelegate?
    
    @IBInspectable var text: String {
        set {self.startLabel.text = newValue}
        get {return self.startLabel.text ?? ""}
    }
    
    @IBInspectable var textColor: UIColor {
        set { self.startLabel.textColor = newValue }
        get { return self.startLabel.textColor  }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createAnimationIfNeed()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    
    // Функция инициализации
    private func setup() {
        Bundle(for: CustomButton.self).loadNibNamed("CustomButton", owner: self, options: nil)
        contentView.frame = self.bounds
        self.addSubview(contentView)
    }
    
    private func createAnimationIfNeed() {
        guard isAnimated_ else {return}
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.repeat, .autoreverse]) {
            self.contentView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }
    
    @IBAction func startButtonAction(_ sender: UIButton){
        delegate?.buttonDidTap(self)
        
    }
}


