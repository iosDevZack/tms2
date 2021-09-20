//
//  ViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 8.09.21.
//

import UIKit
import AVFoundation // отвечает за представление классов AVAsset, AVPlayer
import AVKit // отвечает за классы представления на контроллере


class MainViewController: UIViewController {
    
    @IBOutlet weak var weatherVideo: UIView!
    @IBOutlet weak var weatherTextField: UITextField!
    @IBOutlet weak var enterACity: UILabel!
    @IBOutlet weak var weatherButtonView: UIView!
    
    var player: AVPlayer?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getWeatherVideo()
        settingsWeatherTextField()
        settingsWeatherButtonView()
        
    }
    
    

    
    @IBAction func goToWeatherInfoScreen(_ sender: UIButton) {
        guard let text = weatherTextField.text, !text.isEmpty else {return}
    
        let storyboard = UIStoryboard(name: "Weather", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController else {return}
        vc.city = text
        self.navigationController?.pushViewController(vc, animated: true)

        
        
        
    }
    
    

    func getWeatherVideo() {
        guard let pathNewsVideo = Bundle.main.path(forResource: "Weather3", ofType: "mp4") else { return } // Путь к видео файлу находящегося непосредственно в проекте
        
        NotificationCenter.default.removeObserver(self)
        
        let urlVideo = URL(fileURLWithPath: pathNewsVideo)
        let asset = AVAsset(url: urlVideo)
        let playerItem = AVPlayerItem(asset: asset) // отвечает за воспроизведение и перемотку (пауза) конкретного видео
        let player = AVPlayer (playerItem: playerItem)
        let videoLayer = AVPlayerLayer(player: player) // отвечает за впосроизведение на вью
        
        videoLayer.frame = CGRect(origin: .zero, size: weatherVideo.frame.size) // задаем размер видео на вью
        videoLayer.videoGravity = .resizeAspectFill
        player.volume = 0.0
        weatherVideo.layer.addSublayer(videoLayer)
        player.play()
//        view.layer.insertSublayer(videoLayer, at: 0) // Залить весь бэкграунд этим видео
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: playerItem, queue: .main) { _ in // отвечает за то чтобы видео начиналось сначала сразу после его окончания
//            player.volume = 0.0
            player.seek(to: .zero)
            player.play()
        }
        
        weatherVideo.addSubview(weatherTextField)
        
        weatherVideo.addSubview(enterACity)
        
        weatherVideo.addSubview(weatherButtonView)
        

        
        
    }
    
    func settingsWeatherTextField() {
        weatherTextField.tintColor = .lightGray
        weatherTextField.backgroundColor = .lightText
        weatherTextField.layer.masksToBounds = true
        weatherTextField.layer.cornerRadius = 18
  
        
    }
    
    func settingsWeatherButtonView() {
        weatherButtonView.tintColor = .lightGray
        weatherButtonView.backgroundColor = .lightText
        weatherButtonView.layer.masksToBounds = true
        weatherButtonView.layer.cornerRadius = 18
    }
    
    
}
