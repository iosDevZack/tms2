//
//  ViewController2.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var chessBoard: UIView!
    var timer: Timer?
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createChessBoard()
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        timerLabel.text = "\(count)"
        timerLabel.textColor = .red
        
        
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
                
                let checker = UIView(frame: CGRect(x: 5, y: 5, width: sizeCell - 10, height: sizeCell - 10))
                checker.backgroundColor = row > 3 ? .white : .lightGray
//                 Добавить на шашку изображение
//                let checker = UIImageView(frame: CGRect(x: 5, y: 5, width: sizeCell - 10, height: sizeCell - 10))
//                checker.image = UIImage(named: "blue")
                checker.layer.cornerRadius = checker.bounds.size.width / 2.0
                cell.addSubview(checker)
                
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

    @IBAction func closeButtonAction(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
        dismiss(animated: true, completion: nil)
    }
    
    @objc func timerFunc() {
        count += 1
        timerLabel.text = "\(count)"
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
