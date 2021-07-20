//
//  ViewController.swift
//  lesson10 homeWork
//
//  Created by Женя  on 13.07.21.
//

import UIKit

class ViewController: UIViewController {
    
    var chessBoard: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        createChessBoard()
    }

    func createChessBoard() {
        chessBoard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 320, height: 320)))
        chessBoard.backgroundColor = .white
        
        for i in 0..<8 {
            for j in 0..<8 {
                let column = UIView(frame: CGRect(x: 40 * i, y: 40 * j, width: 40, height: 40))
                column.backgroundColor = ((i + j) % 2) == 0 ?.white : .black
                chessBoard.addSubview(column)
                
                guard j < 3 || j > 4, column.backgroundColor == .black else { continue }
                
                let checker = UIView(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
                checker.backgroundColor = j > 3 ? .white : .lightGray
                checker.layer.cornerRadius = checker.bounds.size.width / 2.0
                column.addSubview(checker)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                checker.addGestureRecognizer(panGesture)
            }
        }
        
        view.addSubview(chessBoard)
        chessBoard.center = view.center
    }
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
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
                var currentCell: UIView? = nil
                
                for cell in chessBoard.subviews {
                    if cell .frame.contains(location), cell.backgroundColor == .black {
                        currentCell = cell
                        break
                }
            }
                sender.view?.frame.origin = CGPoint(x: 5, y: 5)
                guard let newCell = currentCell, newCell.subviews.isEmpty, let cell = sender.view else {
                    return
                }
            currentCell?.addSubview(cell)
                default: break
        }
    }
}



