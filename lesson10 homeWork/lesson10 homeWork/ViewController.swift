//
//  ViewController.swift
//  lesson10 homeWork
//
//  Created by Женя  on 13.07.21.
//

import UIKit

class ViewController: UIViewController {

     var chessMove: UIView? = nil
     var dafaultOrignl: CGPoint = .zero
     var viewSquareBlack: [UIView] = []
     var selecField: CGPoint = .zero
     var viewSquareWhite: [UIView] = []
     var viewChessAll: [UIView] = []
     var count: Int = 0
     
     override func viewDidLoad() {
          super.viewDidLoad()
          
          
    let numberOfRows = 8
    let numberOfColomns = 8
    let board = UIView(frame: CGRect(x: 30, y: 200, width: 320, height: 320))
    view.backgroundColor = .cyan
    view.addSubview(board)
    board.backgroundColor = .blue
     
    for row in 0...numberOfRows - 1 {
        for column in 0...numberOfColomns - 1  {
            let viewSquare = UIView(frame: CGRect(x: (row * 40) + 30, y: (column * 40) + 200, width: 40, height: 40))
            view.addSubview(viewSquare)
            
            let chess = UIView(frame: CGRect(x: (row * 40) + 40 , y: (column * 40) + 210, width: 20, height: 20))
            if (row + column) % 2 == 0 {
                    viewSquare.backgroundColor = .black
                    viewSquareBlack.append(viewSquare)
                        
                    switch column {
                    case 0,1,2 :
                        chess.backgroundColor = .gray
                        view.addSubview(chess)
                        viewChessAll.append(chess)
                        addPanGesture(chess)
                    case 7,6,5 :
                        chess.backgroundColor = .red
                        view.addSubview(chess)
                        viewChessAll.append(chess)
                        addPanGesture(chess)
                    default:
                        break
                }
            }
            else {
                    viewSquare.backgroundColor = .white
                    viewSquareWhite.append(viewSquare)
            }
        }
    }

}
     
     @objc
     func panGestureRecognizer (_ sender: UIPanGestureRecognizer) {
       
          let translation = sender.translation(in: view)
          switch sender.state {
          case .began:
            guard let senderView  = sender.view else { return }
                chessMove = senderView
                dafaultOrignl = senderView.frame.origin
            case .changed:
            guard chessMove  != nil else { return }
                chessMove?.frame.origin = CGPoint(x: dafaultOrignl.x + translation.x , y:  dafaultOrignl.y + translation.y)
                view.bringSubviewToFront(chessMove!)
            case .ended:

        for value in viewSquareBlack {

            if value.frame.contains(chessMove!.frame.origin) {
                    chessMove!.center.x = value.center.x
                    chessMove!.center.y  = value.center.y
                    count = 0
                    viewChessAll.forEach { value in
                        if chessMove!.frame == value.frame {
                            count += 1
                        }
                        if count == 2 {
                            chessMove!.frame.origin = dafaultOrignl
                        }
                    }
        }
                    
            viewSquareWhite.forEach { value in
                    if value.frame.contains(chessMove!.frame.origin) {
                        chessMove!.frame.origin = dafaultOrignl
                    }
            }
    }
        sender.setTranslation(.zero, in: view)
        default:
        break
    }
}
     
     
     func addPanGesture(_ chess: UIView) {
          let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(_ :)))
          chess.addGestureRecognizer(panGesture)
     }
}



