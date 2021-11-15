//
//  ViewControllerPlay.swift
//  lesson12 homeWork
//
//  Created by Женя  on 25.07.21.
//ViewController2

import UIKit

enum allChekersEnum: Int {
    case white = 0
    case black = 1
}

class ViewControllerPlay: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var imageForPlayScreen: UIImageView!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var congratulationsLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
   
    var chessboard: UIView!
    
    var currentChecker: allChekersEnum = .white
    var savedCheckers: [CheckerClass] = []
    var styleCheckers = StyleCheckersClass(whiteChecker: "Red1", blackChecker: "Blue1", stateSwitch: true)
    var cellsForMoove: [UIView] = []
    
    var timer: Timer?
    var countSec: Int = 0
    var countMin: Int = 0
    

    let dateFormatter = DateFormatter()
    let nowDate = Date()
    
    var names: [String] = []
    var saveData: SaveData? = nil
    
    var canFight: Bool = false
    var mass: [(checker: Int, cell: Int, checkerFight: Int)] = [] // Шашка которая может бить; какую позицию она после этого займет; После этих действий какую шашку она может бить.
    
    var players: [Player] = []
    var gameOver: Bool = false
    
    var moovingPlayer: String = ""
    var playerWithWhiteChecker: String = ""
    var playerWithBlackChecker: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSaveData()

        createChessboard()
        findFight()
        
        getDate()
        getTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
     localized()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        getNames()
        animate()
    }
    
    
    
    func localized() {
        back.setTitle("back_button_text".localized, for: .normal)
    }

    func getSaveData() { // Получение данных из класса сохранения всех данных
        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("savedGame").path) {
            saveData = SaveData.getSaveGame()
            savedCheckers = saveData?.savedCheckersPosition as! [CheckerClass]
            
            countSec = (saveData?.savedCountSeconds)!
            countMin = (saveData?.savedCountMinutes)!

            dateLabel.text = saveData?.savedDateOfStartGame
            
            currentChecker = saveData?.savedCurrentChecker == 0 ? .white : .black
            
        } else {
            
            dateFormatter.dateFormat = "dd.MM.yy"
            dateLabel.text = dateFormatter.string(from: nowDate)
            
        }
        
        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("styleOfChecker").path) {
            let stylesOfChecker = SaveData.getStyleChecker()
            
            stylesOfChecker.forEach { style in
                if style.stateSwitch == true {
                    styleCheckers = style
                }
            }
        }
        guard manager.fileExists(atPath: documentDirectory.appendingPathComponent("BackgroundImage").path) else { return }
        imageForPlayScreen.image = SaveData.getBackgroundImage()
    }
    
    func animate() {
        UIView.animate(withDuration: 3.5, delay: 0, options: .curveEaseOut) {
            self.welcomeLabel.center.x = self.view.center.x
        } completion: { finished in
            self.welcomeLabel.text = self.currentChecker == .white ? self.playerWithWhiteChecker :
            self.playerWithBlackChecker
        }
    }
    
    
    func getNames() { // Функция отображения имен игроков на экране
        if manager.fileExists(atPath: documentDirectory.appendingPathComponent("savedNames").path) {
            names = SaveData.getNamesOfPlayers()

            welcomeLabel.text = "welcome_Label1_text".localized + names[0] + "welcome_Label2_text".localized + names[1]

            playerWithWhiteChecker = names.randomElement()!
            names.forEach { player in
                if player != playerWithWhiteChecker {
                    playerWithBlackChecker = player
                }
            }
        } else {
            guard let name1 = saveData!.nameFirstPlayer, let name2 = saveData!.nameSecondPlayer else { return }
            welcomeLabel.text = "welcome+Label3_text".localized
            playerWithWhiteChecker = name1
            playerWithBlackChecker = name2

        }
    }
    
    func createChessboard() { // Функция создания доски + шашки
        
        chessboard = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.size.width - 16, height: view.bounds.size.width - 16)))
        chessboard.backgroundColor = .cyan
        
        let sizeCell = (view.bounds.size.width - 16) / 8
        
        var countForTagsCell = 0 //счетчик для тагов клетки
        var countForTagsChecker = 0 //счетчик для тагов шашки
        for row in 0..<8 {
            for column in 0..<8 {
                let cell = UIView(frame: CGRect(x: sizeCell * CGFloat(column),
                                                y: sizeCell * CGFloat(row),
                                                width: sizeCell,
                                                height: sizeCell))
                
                cell.backgroundColor = ((row + column) % 2) == 0 ? .white : .black
                cell.tag = countForTagsCell
                
                chessboard.addSubview(cell)
                countForTagsCell += 1
                
                let checkerImage = UIImageView(frame: CGRect(x: 5, y: 5, width: sizeCell - 10, height: sizeCell - 10))
                
                checkerImage.isUserInteractionEnabled = true //чтобы картинка реагировала на жесты
                
                let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longGesture(_:)))
                longPressGesture.minimumPressDuration = 0.1
                longPressGesture.delegate = self
                checkerImage.addGestureRecognizer(longPressGesture)
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
                panGesture.delegate = self
                checkerImage.addGestureRecognizer(panGesture)
                
                guard !savedCheckers.isEmpty else {
                    
                    guard row < 3 || row > 4, cell.backgroundColor == .black else { continue }
                    
                    checkerImage.image = UIImage(named: (row < 3 ? styleCheckers.whiteChecker! : styleCheckers.blackChecker!))
                    cell.addSubview(checkerImage)
                    checkerImage.tag = countForTagsChecker
                    countForTagsChecker += 1
                    
                    continue
                }
                
                if let checker = savedCheckers.first(where:{$0.positionTag == cell.tag}) {
                    checkerImage.image = UIImage(named: checker.colorTag! < 12 ? styleCheckers.whiteChecker! : styleCheckers.blackChecker!)
                    checkerImage.tag = checker.colorTag!
                    cell.addSubview(checkerImage)
                    if checker.queen == true {
                        let queenImage = UIImageView(frame: CGRect(x: 0, y: 0, width: Int(checkerImage.frame.width), height: Int(checkerImage.frame.height)))
                        queenImage.image = UIImage(named: "Queen")
                        checkerImage.addSubview(queenImage)
                    }
                }
            }
        }
        view.addSubview(chessboard)
        chessboard.center = view.center
        SaveData.deleteSavedGame()
    }
    
    func findMooving(for checker: UIView) { // Функция для подсветки той клетки куда может ходить шашка
       
        let cell = checker.superview
        guard checker.subviews.isEmpty else { findQueenMooving(for: checker)
            return }
        chessboard.subviews.forEach { cellForMoove in
            guard cellForMoove.subviews.isEmpty, cellForMoove.backgroundColor == .black, let startCell = cell else { return }
            
            let stepOne = currentChecker == .white ? 7 : -7
            let stepTwo = currentChecker == .white ? 9 : -9
            
            if cellForMoove.tag == startCell.tag + stepOne || cellForMoove.tag == startCell.tag + stepTwo {
                cellForMoove.addBlurView()
                cellsForMoove.append(cellForMoove)
            }
        }
    }
    
    func findFight() { // 
        let arrayOfChecker = saveCheckers()
        
        if currentChecker == .white {
            findFightWhiteCheckers(arrayOfChecker)
        } else {
            findFightForBlackChecker(arrayOfChecker)
        }
        returnSmartBlur()
    }
    
    func findFightWhiteCheckers(_ arrayOfChecker: [CheckerClass]) { // Найти позитицию шашки которую будем бить белой шашкой
        arrayOfChecker.forEach { checker in

            if checker.colorTag! < 12 {
                if checker.queen == false {
                    arrayOfChecker.forEach { fightChecker in

                        if fightChecker.colorTag! >= 12 && (fightChecker.positionTag == checker.positionTag! + 9 || fightChecker.positionTag == checker.positionTag! + 7 || fightChecker.positionTag == checker.positionTag! - 9 || fightChecker.positionTag == checker.positionTag! - 7 ) {
                
                            chessboard.subviews.forEach { cell in

                                if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == checker.positionTag! - 2 * (checker.positionTag! - fightChecker.positionTag!) {
                            
                                    cellsForMoove.append(cell)
                                    canFight = true
                                    mass.append((checker: checker.colorTag!, cell: cell.tag, checkerFight: fightChecker.colorTag!))
                                }
                            }
                        }
                    }
                } else {
                    findFightForWhiteQueen(QueenChecker: checker, arrayOfChecker: arrayOfChecker)
                }
            }
        }
    }
    
    func findFightForBlackChecker(_ arrayOfChecker: [CheckerClass]) { // Найти позитицию шашки которую будем бить черной шашкой
        arrayOfChecker.forEach { checker in

            if checker.colorTag! >= 12 {
                if checker.queen == false {
                    arrayOfChecker.forEach { fightChecker in

                        if fightChecker.colorTag! < 12 && (fightChecker.positionTag == checker.positionTag! + 9 || fightChecker.positionTag == checker.positionTag! + 7 || fightChecker.positionTag == checker.positionTag! - 9 || fightChecker.positionTag == checker.positionTag! - 7 ) {
                
                            chessboard.subviews.forEach { cell in

                                if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == checker.positionTag! - 2 * (checker.positionTag! - fightChecker.positionTag!) {
                            
                                    cellsForMoove.append(cell)
                                    canFight = true
                                    mass.append((checker: checker.colorTag!, cell: cell.tag, checkerFight: fightChecker.colorTag!))
                                }
                            }
                        }
                    }
                } else {
                    findFightForBlackQueen(queenChecker: checker, arrayOfChecker: arrayOfChecker)
                }
            }
        }
    }
    
    
    func checkersQueen() { //Создаем дамку
        let massCheckers = saveCheckers()
        var number: Int? = nil
        
        massCheckers.forEach { checker in
            guard checker.queen == false else { return }
            if (checker.colorTag! < 12 && (checker.positionTag == 62 || checker.positionTag == 60 || checker.positionTag! == 58 || checker.positionTag == 56)) || (checker.colorTag! >= 12 && (checker.positionTag == 1 || checker.positionTag == 3 || checker.positionTag! == 5 || checker.positionTag == 7)) {
                number = checker.positionTag
            }
        }
                
        if let cell = chessboard.subviews.first(where:{$0.tag == number}) {
            cell.subviews.forEach { checker in
                let queenImage = UIImageView(frame: CGRect(x: 0, y: 0, width: Int(checker.frame.width), height: Int(checker.frame.height)))
                queenImage.image = UIImage(named: "Queen")
                checker.addSubview(queenImage)
            }
        }
    }
    
    func findQueenMooving(for checker: UIView) { // Ходы дамок
        let cell = checker.superview
        
        let step1: Int = -7
        let step2: Int = -9
        let step3: Int = 7
        let step4: Int = 9
        
        chessboard.subviews.forEach { cellForMoove in
            guard cellForMoove.subviews.isEmpty, cellForMoove.backgroundColor == .black ,  let startCell = cell else { return }
            if cellForMoove.tag == startCell.tag - step1 || cellForMoove.tag == startCell.tag - step2 || cellForMoove.tag == startCell.tag - step3 || cellForMoove.tag == startCell.tag - step4 {
                cellForMoove.addBlurView()
                cellsForMoove.append(cellForMoove)
                let step: Int = startCell.tag - cellForMoove.tag
                var nextCell: Int = cellForMoove.tag - step
                
                while nextCell > -1, nextCell < 64 {
                    var findNextCell: Bool = false
                    chessboard.subviews.forEach { cell in
                        if cell.tag == nextCell, cell.subviews.isEmpty, cell.backgroundColor == .black {
                            cell.addBlurView()
                            cellsForMoove.append(cell)
                            findNextCell = true
                            nextCell = nextCell - step
                        }
                    }
                    if findNextCell == false {
                        nextCell = 65
                    }
                }
            }
        }
    }
    
    func findFightForWhiteQueen(QueenChecker: CheckerClass, arrayOfChecker: [CheckerClass]) { // Найти позитию шашки которую будем бить белой дамкой
        var massForQueen: [(queen: Int, checkerForFight: Int, cell: Int)] = []
    
        var one = QueenChecker.positionTag! - 9
        var two = QueenChecker.positionTag! - 7
        var three = QueenChecker.positionTag! + 7
        var four = QueenChecker.positionTag! + 9
        
        while one > 0 || two > 0 || three < 63 || four < 63 {
            
            arrayOfChecker.forEach { checkerForFight in
                if checkerForFight.colorTag! >= 12  && (checkerForFight.positionTag! == one || checkerForFight.positionTag! == two || checkerForFight.positionTag! == three || checkerForFight.positionTag! == four) {
                    var step: Int = 0
                    if (QueenChecker.positionTag! - checkerForFight.positionTag!) < 0, (QueenChecker.positionTag! - checkerForFight.positionTag!) % 7 == 0 {
                        step = -7
                    }
                    if (QueenChecker.positionTag! - checkerForFight.positionTag!) > 0, (QueenChecker.positionTag! - checkerForFight.positionTag!) % 7 == 0 {
                        step = 7
                    }
                    if (QueenChecker.positionTag! - checkerForFight.positionTag!) < 0, (QueenChecker.positionTag! - checkerForFight.positionTag!) % 9 == 0 {
                        step = -9
                    }
                    if (QueenChecker.positionTag! - checkerForFight.positionTag!) > 0, (QueenChecker.positionTag! - checkerForFight.positionTag!) % 9 == 0 {
                        step = 9
                    }
                    
                    chessboard.subviews.forEach { cell in
                        
                        if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == checkerForFight.positionTag! - step {
                            
                    
                            cellsForMoove.append(cell)
                            canFight = true
                            mass.append((checker: QueenChecker.colorTag!, cell: cell.tag, checkerFight: checkerForFight.colorTag!))
                            massForQueen.append((queen: QueenChecker.colorTag!, checkerForFight: checkerForFight.colorTag!, cell: cell.tag))
                            
                            var nextCell: Int = cell.tag - step
                            
                            while nextCell > -1, nextCell < 64 {
                                var findNextCell: Bool = false
                                chessboard.subviews.forEach { cell in
                                    if cell.tag == nextCell, cell.subviews.isEmpty, cell.backgroundColor == .black {
                                        cell.addBlurView()
                                        cellsForMoove.append(cell)
                                        mass.append((checker: QueenChecker.colorTag!, cell: cell.tag, checkerFight: checkerForFight.colorTag!))
                                        massForQueen.append((queen: QueenChecker.colorTag!, checkerForFight: checkerForFight.colorTag!, cell: cell.tag))
                                        findNextCell = true
                                        nextCell = nextCell - step
                                    }
                                }
                                if findNextCell == false {
                                    nextCell = 65
                                }
                            }
                        }
                    }
                }
            }
            one -= 9
            two -= 7
            three += 7
            four += 9
        }
}
    
    
    func findFightForBlackQueen(queenChecker: CheckerClass, arrayOfChecker: [CheckerClass]) {  // Найти позитию шашки которую будем бить черной дамкой
    
        var massForQueen: [(queen: Int, checkerForFight: Int, cell: Int)] = []
        
        var one = queenChecker.positionTag! - 9
        var two = queenChecker.positionTag! - 7
        var three = queenChecker.positionTag! + 7
        var four = queenChecker.positionTag! + 9
        
        while one > 0 || two > 0 || three < 63 || four < 63 {
            
            arrayOfChecker.forEach { checkerForFight in
                if checkerForFight.colorTag! < 12  && (checkerForFight.positionTag! == one || checkerForFight.positionTag! == two || checkerForFight.positionTag! == three || checkerForFight.positionTag! == four) {
                    
                    var step: Int = 0
                    if (queenChecker.positionTag! - checkerForFight.positionTag!) < 0, (queenChecker.positionTag! - checkerForFight.positionTag!) % 7 == 0 {
                        step = -7
                    }
                    if (queenChecker.positionTag! - checkerForFight.positionTag!) > 0, (queenChecker.positionTag! - checkerForFight.positionTag!) % 7 == 0 {
                        step = 7
                    }
                    if (queenChecker.positionTag! - checkerForFight.positionTag!) < 0, (queenChecker.positionTag! - checkerForFight.positionTag!) % 9 == 0 {
                        step = -9
                    }
                    if (queenChecker.positionTag! - checkerForFight.positionTag!) > 0, (queenChecker.positionTag! - checkerForFight.positionTag!) % 9 == 0 {
                        step = 9
                    }

                    chessboard.subviews.forEach { cell in
                        
                        if cell.subviews.isEmpty, cell.backgroundColor == .black, cell.tag == checkerForFight.positionTag! - step {
                            cellsForMoove.append(cell)
                            canFight = true
                            mass.append((checker: queenChecker.colorTag!, cell: cell.tag, checkerFight: checkerForFight.colorTag!))
                            massForQueen.append((queen: queenChecker.colorTag!, checkerForFight: checkerForFight.colorTag!, cell: cell.tag))
                            
                            var nextCell: Int = cell.tag - step
                            
                            while nextCell > -1, nextCell < 64 {
                                var findNextCell: Bool = false
                                chessboard.subviews.forEach { cell in
                                    if cell.tag == nextCell, cell.subviews.isEmpty, cell.backgroundColor == .black {
                                        cell.addBlurView()
                                        cellsForMoove.append(cell)
                                        mass.append((checker: queenChecker.colorTag!, cell: cell.tag, checkerFight: checkerForFight.colorTag!))
                                        massForQueen.append((queen: queenChecker.colorTag!, checkerForFight: checkerForFight.colorTag!, cell: cell.tag))
                                        findNextCell = true
                                        nextCell = nextCell - step
                                    }
                                }
                                if findNextCell == false {
                                    nextCell = 65
                                }
                            }
                        }
                    }
                }
            }
            one -= 9
            two -= 7
            three += 7
            four += 9
        }
}
    
    func smartBlur(for checker: UIView) {
        
        chessboard.subviews.forEach { cell in
            cell.removeBlurView()
        }
        mass.forEach { tuple in
            if checker.tag == tuple.checker {
                chessboard.subviews.forEach { cell in
                    if cell.tag == tuple.cell {
                        cell.addBlurView()
                    }
                }
            }
        }
    }
    
    func returnSmartBlur() {
        mass.forEach { tuple in
            chessboard.subviews.forEach { cell in
                if cell.tag == tuple.cell, cell.subviews.isEmpty {
                    cell.addBlurView()
                }
            }
        }
    }
    
    func saveCheckers() -> [CheckerClass] { // Сохранение шашек
        savedCheckers = []
        chessboard.subviews.forEach { cell in
            cell.removeBlurView()
        }
        chessboard.subviews.forEach { cell in //  Проверка ли пустая ли клетка
            if !cell.subviews.isEmpty {
                cell.subviews.forEach { checker in
                    if !checker.subviews.isEmpty {
                        let savedChecker = CheckerClass(colorTag: checker.tag, positionTag: cell.tag, queen: true)
                        savedCheckers.append(savedChecker)
                    } else {
                        let savedChecker = CheckerClass(colorTag: checker.tag, positionTag: cell.tag, queen: false)
                        savedCheckers.append(savedChecker)

                    }
                }
            }
        }
        return savedCheckers
    }
    
    func winner() -> String { // Определяем победителя
        let checkChecker = saveCheckers()
        var blackCheckers: Int = 0
        var whiteCheckers: Int = 0
        var winner: String = ""
        checkChecker.forEach { checker in
            if checker.colorTag! < 12 {
                whiteCheckers += 1
            } else {
                blackCheckers += 1
            }
        }
        
        if whiteCheckers == 0 {
            winner = playerWithBlackChecker
            
            let playerFirst = Player(name: playerWithWhiteChecker, checkersColor: "white", champion: false)
            let playerSecond = Player(name: playerWithBlackChecker, checkersColor: "black", champion: true)
            
            players.append(playerFirst)
            players.append(playerSecond)
            
            let coreDataDate = dateFormatter.date(from: dateLabel.text ?? "")
            let game = Game(dateOfGame: coreDataDate ?? Date(), players: players)
            
            CoreDataManager.shared.saveGame(by: game)
        }
        
        if blackCheckers == 0 {
            winner = playerWithWhiteChecker
            let playerFirst = Player(name: playerWithWhiteChecker, checkersColor: "white", champion: true)
            let playerSecond = Player(name: playerWithBlackChecker, checkersColor: "black", champion: false)
            
            players.append(playerFirst)
            players.append(playerSecond)
            
            let coreDataDate = dateFormatter.date(from: dateLabel.text ?? "")
            let game = Game(dateOfGame: coreDataDate ?? Date(), players: players)
            
            CoreDataManager.shared.saveGame(by: game)
        }
        
        return winner
    }
    
    func congratulations() { // Поздравления победителю
        
        let winner = winner()

        if winner != "" {
            self.view.bringSubviewToFront(congratulationsLabel)
            self.view.bringSubviewToFront(winnerLabel)
        
            timer?.invalidate()
            timer = nil
            
            congratulationsLabel.text = "congratulations_Label_text".localized
            winnerLabel.text = winner + "winner_Label_text".localized 

            gameOver = true
        }
    }
    
    @objc func longGesture(_ sender: UILongPressGestureRecognizer) {
        
        guard let checker = sender.view, (currentChecker == .white && checker.tag < 12) || (currentChecker == .black && checker.tag >= 12) else { return }
        
        switch sender.state {
        case .began:
            
            smartBlur(for: checker)
                
            if canFight == false {
                cellsForMoove.removeAll()
                findMooving(for: checker)
            }
            
            UIView.animate(withDuration: 0.1) {
                checker.transform = checker.transform.scaledBy(x: 1.3, y: 1.3)
            }
            
        case .ended:
            
            UIView.animate(withDuration: 0.3) {
                checker.transform = .identity
            }
            if canFight == false {
                chessboard.subviews.forEach { cell in
                    cell.removeBlurView()
                }
            }
            returnSmartBlur()
        default: break
        }
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        
        guard let checker = sender.view, (currentChecker == .white && checker.tag < 12) || (currentChecker == .black && checker.tag >= 12) else { return }
                
        let location = sender.location(in: chessboard) // координата где находится курсор относительно доски
        let translation = sender.translation(in: chessboard)
        
        switch sender.state {
        
        case .changed:
            
            guard let cell = sender.view?.superview, let cellOrigin = sender.view?.frame.origin else {return}//sender.view распознаватель жестов для объекта, view - это объекты, на которые добавляли жест. sender.view?.superview это клетка, на которой стоит шашка, которую пользователь выбрал для движения, sender.view?.frame.origin координата от которой начинаем движение
            
            chessboard.bringSubviewToFront(cell)

            sender.view?.frame.origin = CGPoint(x: cellOrigin.x + translation.x,
                                                y: cellOrigin.y + translation.y)
    
            sender.setTranslation(.zero, in: chessboard) //сбрасываем translation
        
        case .ended:

            var currentCell: UIView? = nil //клетка на которой заканчивается движение
            var currentFightChecker: Int? = nil //шашка которую будем бить
            
            cellsForMoove.forEach { cell in
                if canFight == true {
                    mass.forEach { tuple in
                        if checker.tag == tuple.checker, cell.tag == tuple.cell, cell.frame.contains(location) {
                            currentCell = cell
                            currentFightChecker = tuple.checkerFight
                        }
                    }
                } else {
                    if cell.frame.contains(location) {
                        currentCell = cell
                    }
                }
            }
    
            sender.view?.frame.origin = CGPoint(x: 5, y: 5)
            guard let newCell = currentCell, let checker = sender.view else { return }

            newCell.addSubview(checker)
            
            chessboard.subviews.forEach { cell in
                cell.subviews.first(where: {$0.tag == currentFightChecker})?.removeFromSuperview()
            }
            checkersQueen()
            congratulations()
            
            if canFight == true {
                canFight = false
                cellsForMoove.removeAll()
                mass.removeAll()
                findFight()
    
                if canFight == true {
                    
                    mass.removeAll(where: {$0.checker != checker.tag })
                    smartBlur(for: checker)
                    if mass.isEmpty {
                        canFight = false
                    }
                }
            }
            
            if canFight == false {
                currentChecker = currentChecker == .white ? .black : .white
                welcomeLabel.text = currentChecker == .white ? playerWithWhiteChecker : playerWithBlackChecker
                
                findFight()
            }
        default: break
        }
    }


    @IBAction func closeButtonAction(_ sender: UIButton) {
        
        guard gameOver == false else {
            presentAlertController(with: nil,
                                   message: "",
                                   actions: UIAlertAction(title: "alert_title2_text_playScreen".localized,
                                                          style: .default,
                                                          handler: { _ in
                                   self.dismiss(animated: true, completion: nil)}))
            return
        }
        
        presentAlertController(with: nil,
                               message: "alert_message_text_playScreen".localized,
                               actions: UIAlertAction(title: "alert_title1_text_playScreen".localized,
                                                      style: .default,
                                                      handler: { _ in
            self.view.removeBlurView()
            
            self.saveData = SaveData(savedCheckersPosition: self.saveCheckers(),
                                     savedCountSeconds: self.countSec,
                                     savedCountMinutes: self.countMin,
                                     savedCurrentChecker: self.currentChecker.rawValue,
                                     nameFirstPlayer: self.playerWithWhiteChecker,
                                     nameSecondPlayer: self.playerWithBlackChecker,
                                     date: self.dateLabel.text)

                            SaveData.saveGame(saveData: self.saveData!)
                            SaveData.deleteSavedNames()
            
                            self.dismiss(animated: true, completion: nil)}),
                               
                            UIAlertAction(title: "alert_title2_text_playScreen".localized, style: .default,
                                          handler: { _ in self.dismiss(animated: true, completion: nil)}))
    }
    
    func getDate() {

        dateFormatter.dateFormat = "MMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: nowDate)
        dateLabel.textColor = .gray
        dateLabel.tintColor = .red
        dateLabel.font = UIFont(name: "Khand-Regular", size: 20)
}
    
    
    func getTimer() {
        timer = Timer(timeInterval: 1, target: self, selector: #selector(timerFunc), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
        
        timerLabel.attributedText = NSAttributedString(string: "\(countMin) min : \(countSec) sec",
                                                       attributes:
                                                        [NSAttributedString.Key.foregroundColor : UIColor.blue,
                                                        NSAttributedString.Key.strokeWidth: -5,
                                                        NSAttributedString.Key.font: UIFont(name: "Khand-Regular", size: 20)
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

extension ViewControllerPlay: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

