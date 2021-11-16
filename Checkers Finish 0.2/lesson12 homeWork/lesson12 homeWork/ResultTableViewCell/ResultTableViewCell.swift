//
//  ResultTableViewCell.swift
//  lesson12 homeWork
//
//  Created by Женя  on 14.11.21.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateOfPlay: UILabel!
    @IBOutlet weak var nameOfPlayer1: UILabel!
    @IBOutlet weak var nameOfPlayer2: UILabel!
    @IBOutlet weak var colorOfCheckerPlayer1: UILabel!
    @IBOutlet weak var colorOfCheckerPlayer2: UILabel!
    @IBOutlet weak var winnerPlayer1: UILabel!
    @IBOutlet weak var winnerPlayer2: UILabel!
    @IBOutlet weak var nameOfPlayer1Label: UILabel!
    @IBOutlet weak var nameOfPlayer2Label: UILabel!
    @IBOutlet weak var colorOfCheckerPlayer1Label: UILabel!
    @IBOutlet weak var colorOfCheckerPlayer2Label: UILabel!
    
    let dateFormatter = DateFormatter()
    let date = Date()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameOfPlayer1Label.text = "nameOfPlayer1_label_text".localized
        nameOfPlayer2Label.text = "nameOfPlayer2_label_text".localized
        colorOfCheckerPlayer1Label.text = "colorOfCheckerPlayer1_label_text".localized
        colorOfCheckerPlayer2Label.text = "colorOfCheckerPlayer2_label_text".localized
    }
    
    func setData(with game: Game) {
        dateFormatter.dateFormat = "dd.MM.yy"
        let date = game.dateOfGame
        if let date = date {
            self.dateOfPlay.text = dateFormatter.string(from: date)
        }
        let players = game.players ?? []
        guard !players.isEmpty else {return}

        self.nameOfPlayer1.text = players[0].name
        self.colorOfCheckerPlayer1.text = players[0].checkersColor
        self.nameOfPlayer2.text = players[1].name
        self.colorOfCheckerPlayer2.text = players[1].checkersColor

        self.winnerPlayer1.text = players[0].champion == true ? "winnerPlayer1_label_text".localized : "Looser_label1_text".localized
        self.winnerPlayer2.text = players[1].champion == true ? "winnerPlayer2_label_text".localized : "Looser_label1_text".localized

        self.winnerPlayer1.textColor = self.winnerPlayer1.text == "winnerPlayer1_label_text".localized ? .green : .red
        self.winnerPlayer2.textColor = self.winnerPlayer2.text == "winnerPlayer1_label_text".localized ? .green : .red

        self.colorOfCheckerPlayer1.text = colorOfCheckerPlayer1.text == "black" ? "black_colorOfCheckerLabel_text".localized : "white_colorOfCheckerLabel_text".localized

        self.colorOfCheckerPlayer2.text = colorOfCheckerPlayer2.text == "black" ? "black_colorOfCheckerLabel_text".localized : "white_colorOfCheckerLabel_text".localized
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        dateOfPlay.text = ""
        nameOfPlayer1.text = ""
        nameOfPlayer2.text = ""
        colorOfCheckerPlayer1.text = ""
        colorOfCheckerPlayer2.text = ""
        winnerPlayer1.text = ""
        winnerPlayer2.text = ""
        
    }
    
}
