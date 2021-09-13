//
//  ViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 8.09.21.
//

import UIKit
import AVFoundation // отвечает за представление классов AVAsset, AVPlayer
// import AVKit // отвечает за классы представления на контроллере

class MainViewController: UIViewController {
    
    @IBOutlet weak var weatherVideo: UIView!
    @IBOutlet weak var newsVideo: UIView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWeatherVideo()
        getNewsVideo()
        
        
    }
    
    

    
    @IBAction func goToWeatherScreen(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Weather", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()

        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func goToNewsScreen(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "News", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()

        vc!.modalPresentationStyle = .fullScreen
        present(vc!, animated: true, completion: nil)
    }
    
    
    
    func getWeatherVideo() {
        guard let pathNewsVideo = Bundle.main.path(forResource: "Weather", ofType: "mp4") else { return } // Путь к видео файлу находящегося непосредственно в проекте
        
//        NotificationCenter.default.removeObserver(self)
        
        let urlVideo = URL(fileURLWithPath: pathNewsVideo)
        let asset = AVAsset(url: urlVideo)
        let playerItem = AVPlayerItem(asset: asset) // отвечает за воспроизведение и перемотку (пауза) конкретного видео
        let player = AVPlayer (playerItem: playerItem)
        let videoLayer = AVPlayerLayer(player: player) // отвечает за впосроизведение на вью
        
        videoLayer.frame = CGRect(origin: .zero, size: newsVideo.frame.size) // задаем размер видео на вью
        videoLayer.videoGravity = .resizeAspectFill
        player.volume = 0.0
        weatherVideo.layer.addSublayer(videoLayer)
        player.play()
//        view.layer.insertSublayer(videoLayer, at: 0) // Залить весь бэкграунд этим видео
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: playerItem, queue: .main) { _ in // отвечает за то чтобы видео начиналось сначала сразу после его окончания
            player.volume = 0.0
            player.seek(to: .zero)
            player.play()
        }
        
        weatherVideo.addSubview(weatherLabel)
        
        UIView.animate(withDuration: 3.0) {
            self.weatherLabel.transform = CGAffineTransform(scaleX: 4, y: 4)
        }
    }
    
    
    func getNewsVideo() {
        guard let pathNewsVideo = Bundle.main.path(forResource: "News", ofType: "mp4") else { return } // Путь к видео файлу находящегося непосредственно в проекте
//        NotificationCenter.default.removeObserver(self)
        let urlVideo = URL(fileURLWithPath: pathNewsVideo)
        let asset = AVAsset(url: urlVideo)
        let playerItem = AVPlayerItem(asset: asset) // отвечает за воспроизведение и перемотку (пауза) конкретного видео
        let player = AVPlayer (playerItem: playerItem)
//        self.playerOne = player
        let videoLayer = AVPlayerLayer(player: player) // отвечает за впосроизведение на вью
        videoLayer.frame = CGRect(origin: .zero, size: newsVideo.frame.size) // задаем размер видео на вью
        videoLayer.videoGravity = .resizeAspectFill
        player.volume = 0.0
        newsVideo.layer.addSublayer(videoLayer)
        player.play()
//        view.layer.insertSublayer(videoLayer, at: 0) // Залить весь бэкграунд этим видео
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: playerItem, queue: .main) { _ in // отвечает за то чтобы видео начиналось сначала сразу после его окончания
            player.volume = 0.0
            player.seek(to: .zero)
            player.play()
        }
        newsVideo.addSubview(newsLabel)
        
        UIView.animate(withDuration: 3.0) {
            self.newsLabel.transform = CGAffineTransform(scaleX: 4, y: 4)
        }
    }
    

}




