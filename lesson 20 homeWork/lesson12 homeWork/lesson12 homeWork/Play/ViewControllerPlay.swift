//
//  ViewController2.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//

import UIKit

enum allChekersEnum: Int {
    case red = 0
    case blue = 1
}

class ViewController2: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet var screenImage: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var chessBoard: UIView!
    
    var timer: Timer?
    var countSec: Int = 0
    var countMin: Int = 0
    
    var currentChecker: allChekersEnum = .blue
    
    var savedCurrentChecker: Int = 0
    var savedCheckers: [CheckerClass] = []
    
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] // Файл где хранятся данные
    let userDefaults = UserDefaults.standard
    
    var styleCheckers = StyleCheckersClass(styleCheker: nil, position: nil)
    
    
    
    var cellsForMove: [UIView] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getBackgroundScreen()
        getSaveData()
        getTimer()
        getStyleCheckers()
        createChessBoard()
        self.savedCheckers.removeAll()
        
    }
    
    func getBackgroundScreen() {
       let fileURL = documentDirectory.appendingPathComponent("imageView")
      guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else {return}
        let image = UIImage(data: data)
        imageView.image = image
    }
    
    func getSaveData() {
        let manager = FileManager.default
        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("checkers").path) {
            applyDataFromUserDefaults()
            currentChecker = savedCurrentChecker == 0 ? .red : .blue
            getCheckers()
        } else {

        }
    }
    
    func createChessBoard() {
        
        chessBoard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.size.width, height: view.bounds.size.width)))
        chessBoard.backgroundColor = .white
        let sizeCell = view.bounds.size.width / 8
        var i = 0 //Счетчик для тагов клетки
        for row in 0..<8 {
            for colum in 0..<8 {
                let cell = UIView(frame: CGRect(x: sizeCell * CGFloat(colum), y: sizeCell * CGFloat(row),
                                                width: sizeCell, height: sizeCell))
                
                cell.backgroundColor = ((row + colum) % 2) == 0 ?.white : .black
                
                cell.tag = i
                
                chessBoard.addSubview(cell)
                i += 1

                //                Добавить на шашку изображение
                let checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: sizeCell - 10, height: sizeCell - 10))
                
                checkerImage.isUserInteractionEnabled = true // Чтобы можно было двигать изображение
                
                let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGesture(_:)))
                longGesture.minimumPressDuration = 0.1
                longGesture.delegate = self
                checkerImage.addGestureRecognizer(longGesture)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                panGesture.delegate = self
                checkerImage.addGestureRecognizer(panGesture)
                
                guard !savedCheckers.isEmpty else {
                    guard row < 3 || row > 4, cell.backgroundColor == .black else { continue }
                    if styleCheckers.position == nil {
                        checkerImage.image = UIImage(named: row < 3 ? "red" : "blue")
                    } else { checkerImage.image = UIImage(named: row < 3 ? "red" : styleCheckers.styleCheker ?? "blue")
                        
                    }
                    checkerImage.tag = row < 3 ? allChekersEnum.blue.rawValue : allChekersEnum.red.rawValue
                    cell.addSubview(checkerImage)
                    
                    continue
                }
                
                if let checker = savedCheckers.first(where: {$0.positionTag == cell.tag}) {
                    checkerImage.image = UIImage(named: checker.colorTag == 0 ? styleCheckers.styleCheker ?? "blue" : "red")
                    checkerImage.tag = checker.colorTag ?? 0
                    cell.addSubview(checkerImage)
                }
            }
        }
        
        view.addSubview(chessBoard)
        chessBoard.center = view.center
    }
    
    //функция для сохранения данных по ключу
    func saveDataToUserDefaults() {
         let userDefaults = UserDefaults.standard
         userDefaults.setValue(self.countMin, forKey: KeysUserDefaults.timerMinutesKey.rawValue)
         userDefaults.setValue(self.countSec, forKey: KeysUserDefaults.timerSecondsKey.rawValue)
         userDefaults.setValue(self.currentChecker.rawValue, forKey: KeysUserDefaults.currentCheckerKey.rawValue)
    }
    
    //функция для получения сохраненных данных по ключу
     func applyDataFromUserDefaults() {
         let userDefaults = UserDefaults.standard
         let minutes = (userDefaults.integer(forKey: KeysUserDefaults.timerMinutesKey.rawValue))
         self.countMin = minutes
         let seconds = (userDefaults.integer(forKey: KeysUserDefaults.timerSecondsKey.rawValue))
         self.countSec = seconds
         let savedCurrentChecker = (userDefaults.integer(forKey: KeysUserDefaults.currentCheckerKey.rawValue))
         self.savedCurrentChecker = savedCurrentChecker
     }
    
    func saveCheckers() {
        chessBoard.subviews.forEach { cell in // функция проверки пустая ли клетка
            if !cell.subviews.isEmpty {
                cell.subviews.forEach { checker in
                    let savedChecker = CheckerClass(colorTag: checker.tag, positionTag: cell.tag)
                    savedCheckers.append(savedChecker)
                }
            }
        }
        
        let data = try? NSKeyedArchiver.archivedData(withRootObject: savedCheckers, requiringSecureCoding: true)
        let fileURL = documentDirectory.appendingPathComponent("checkers")
        try? data?.write(to: fileURL)
    }
    
    func getCheckers() {
        let fileURL = documentDirectory.appendingPathComponent("checkers")
        
        guard let data = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else { return }
        
        let newArray = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CheckerClass]
        self.savedCheckers = newArray ?? []
    }
    
    func getStyleCheckers() {
        let fileURL = documentDirectory.appendingPathComponent(KeysUserDefaults.styleCheckerKey.rawValue)
        guard let data  = FileManager.default.contents(atPath: fileURL.absoluteString.replacingOccurrences(of: "file://", with: "")) else {return}
        
        guard let newObject = try?  NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [StyleCheckersClass] else {return}
        newObject.forEach { style in
                        if style.position == true {
                                  self.styleCheckers = style
                        }
                     }
    }
    
    func findMooving(for checker:UIView) { // Функция для подсветки той клетки куда может ходить шашка
        let cell = checker.superview
        chessBoard.subviews.forEach { cellForMove in
            guard cellForMove.subviews.isEmpty, cellForMove.backgroundColor == .black, let startCell = cell else { return }
            
            let one = currentChecker == .blue ? 7 : -7
            let two = currentChecker == .blue ? 9 : -9
            
                if cellForMove.tag == startCell.tag + one || cellForMove.tag == startCell.tag + two {
                    cellForMove.addBlurView()
                    cellsForMove.append(cellForMove)
                }
            }
        }
    
    @objc func longGesture(_ sender: UILongPressGestureRecognizer) {
        
        guard let cheker = sender.view else { return }
        
        switch sender.state {
        
        case .began:
            
            cellsForMove.removeAll()
            
            UIView.animate(withDuration: 0.1) {
            cheker.transform = cheker.transform.scaledBy(x: 1.3, y: 1.3)
            }
            
            findMooving(for: cheker)
            
        case .ended:
            UIView.animate(withDuration: 0.1) {
                cheker.transform = .identity
            }
            
            chessBoard.subviews.forEach { cell in
                cell.removeBlurView()
            }
            
        default:
            break
        }
    }
    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        
        guard  sender.view?.tag ==  currentChecker.rawValue else { return }
        
        let location = sender.location(in: chessBoard) // координата где находится курсор относительно доски
        let translation = sender.translation(in: chessBoard)
        
        switch sender.state {
        case .changed:
            
            guard let cell = sender.view?.superview, let cellOrigin = sender.view?.frame.origin  else { return } // sender.view распознаватель жестов для объекта, view - это объекты, на которые добавляли жест. sender.view?.superview это клетка, на которой стоит шашка, которую пользователь выбрал для движения, sender.view?.frame.origin координата от которой начинаем движение
            chessBoard.bringSubviewToFront(cell)
            
            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                    y: cellOrigin.y + translation.y)
            
            sender.setTranslation(.zero, in: chessBoard) //сбрасываем translation
        case .ended:
            UIView.animate(withDuration: 0.1) {
                  sender.view?.transform = .identity
             }
            
                var currentCell: UIView? = nil // клетка на которой заканчивается движение
                
            cellsForMove.forEach { cell in  // чтобы шашка могла ходить только как в реальной игре
                        if cell.frame.contains(location) {
                            currentCell = cell
                        }
                    }
                sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            
                guard let newCell = currentCell, newCell.subviews.isEmpty, let checker = sender.view else { return }
            
                currentCell?.addSubview(checker)
            
            
            currentChecker = currentChecker == .red ? .blue : .red
            
            cellsForMove.removeAll()
            chessBoard.subviews.forEach { cell in
                cell.removeBlurView()
            
            }
                default: break
        }
        
    }
    

    
    
    @IBAction func closeButtonAction(_ sender: UIButton) {
        
        presentAlertController(with: nil, message: "Do you want to leave the game?",
                               actions: UIAlertAction(title: "Save and leave the game",
                                                      style: .default, handler: { _ in
                                self.saveCheckers()
                                self.saveDataToUserDefaults()
                                self.dismiss(animated: true, completion: nil)}),
                               UIAlertAction(title: "Leave the game", style: .default,
                                             handler: { _ in self.dismiss(animated: true, completion: nil)}))
    }
    
    func getTimer() {
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

