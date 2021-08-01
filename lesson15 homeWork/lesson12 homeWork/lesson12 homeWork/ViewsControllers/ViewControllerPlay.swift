//
//  ViewController2.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//

import UIKit

enum allChekers: Int {
    case red = 0
    case blue = 1
}

class ViewController2: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var chessBoard: UIView!
    var checker: UIImageView!
    
    var timer: Timer?
    var countSec: Int = 0
    var countMin: Int = 0
    
    var current: allChekers = .blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createChessBoard()
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        timerLabel.attributedText = NSAttributedString(string: "\(countMin) min : \(countSec) sec",
                                                       attributes:
                                                        [NSAttributedString.Key.foregroundColor : UIColor.blue,
                                                        NSAttributedString.Key.strokeWidth: -5,
                                                        NSAttributedString.Key.font: UIFont(name: "Khand-Regular", size: 45)
                                                        ??  UIFont.systemFont(ofSize: 5),
                                                        NSAttributedString.Key.strokeColor: UIColor.white])
        
        
    }
    
    func createChessBoard() {
        
        chessBoard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.size.width, height: view.bounds.size.width)))
        chessBoard.backgroundColor = .white
        let sizeCell = view.bounds.size.width / 8
        
        for row in 0..<8 {
            for colum in 0..<8 {
                let cell = UIView(frame: CGRect(x: sizeCell * CGFloat(colum), y: sizeCell * CGFloat(row),
                                                width: sizeCell, height: sizeCell))
                
                cell.backgroundColor = ((row + colum) % 2) == 0 ?.white : .black
                chessBoard.addSubview(cell)
                
                guard row < 3 || row > 4, cell.backgroundColor == .black else { continue }
                
 
                
//                let checker = UIView(frame: CGRect(x: 5, y: 5, width: sizeCell - 10, height: sizeCell - 10))
//                checker.backgroundColor = row > 3 ? .white : .lightGray
                //                Добавить на шашку изображение
                let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: sizeCell - 10, height: sizeCell - 10))
                checker.tag = row > 3 ? 0 : 1 // поочередность перемещения
                checker.image = row > 3 ? UIImage(named: "blue") : UIImage(named: "red")
                checker.isUserInteractionEnabled = true // Чтобы можно было двигать изображение
//                checker.layer.cornerRadius = checker.bounds.size.width / 2.0
                cell.addSubview(checker)
                
                let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGesture(_:)))
                longGesture.minimumPressDuration = 0.3
                longGesture.delegate = self
                checker.addGestureRecognizer(longGesture)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                panGesture.delegate = self
                checker.addGestureRecognizer(panGesture)
            }
        }
        
        view.addSubview(chessBoard)
        chessBoard.center = view.center
    }
    
    
    @objc func longGesture(_ sender: UILongPressGestureRecognizer) {
        
        guard let cheker = sender.view else { return }
        switch sender.state {
        case .began:
            UIView.animate(withDuration: 0.3) {
            cheker.transform = cheker.transform.scaledBy(x: 1.3, y: 1.3)
            }
        case .ended:
            UIView.animate(withDuration: 0.3) {
                cheker.transform = .identity
            }
        default:
            break
        }
    }
    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        
        guard  sender.view?.tag ==  current.rawValue else { return }
        
        let location = sender.location(in: chessBoard)
        let translation = sender.translation(in: chessBoard)
        
        switch sender.state {
        case .changed:
            guard let column = sender.view?.superview, let cellOrigin = sender.view?.frame.origin  else { return }
            chessBoard.bringSubviewToFront(column)
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                    y: cellOrigin.y + translation.y)
            sender.setTranslation(.zero, in: chessBoard)
        case .ended:
            UIView.animate(withDuration: 0.3) {
                  sender.view?.transform = .identity
             }
            
                var currentCell: UIView? = nil
                
                for cell in chessBoard.subviews {
                    if cell .frame.contains(location), cell.backgroundColor == .black {
                        currentCell = cell
                        break
                }
            }
                sender.view?.frame.origin = CGPoint(x: 5, y: 5)
                guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else { return }
                currentCell?.addSubview(cell)
            
            if current == .blue {
                current = .red
            } else {
                current = .blue
            }
            
            
                default: break
        }
        
    }

    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func timerFunc() {
        countSec += 1
        if countSec == 60 {
            countMin += 1
            countSec = 0
        }
        
        
        timerLabel.text = "\(countMin) min : \(countSec) sec"
        
    }
    
}

extension ViewController2: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
