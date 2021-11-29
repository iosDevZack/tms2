//
//  MianScreenViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 28.11.21.
//

import UIKit
import AVFoundation // отвечает за представление классов AVAsset, AVPlayer
import AVKit // отвечает за классы представления на контроллере
import UserNotifications // отвечает за нотификации
import CoreLocation

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var weatherVideo: UIView!
    @IBOutlet weak var weatherTextField: UITextField!
    @IBOutlet weak var enterACity: UILabel!
    @IBOutlet weak var weatherButtonView: UIButton!
    
    var player: AVPlayer?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController")

        guard let newVC = SettingsManager.shared.pushVC,
              let vc2 = UIViewController.getViewController(by: "WeatherInMyLocationViewController") else { return }
        
        switch newVC {
        case "MainViewController":
            navigationController?.setViewControllers([vc1], animated: true)
            
        case "WeatherInMyLocationViewController": getNotfication(vc1: vc1, vc2: vc2)
            
        default: break
        }

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getWeatherVideo()
        settingsWeatherTextField()
    }
 
    func getNotfication (vc1: UIViewController, vc2: UIViewController) { // функция перехода из нотификации в настройки если не включена геопозиция
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            
        case .authorizedAlways, .authorizedWhenInUse:
//            navigationController?.setViewControllers([vc1, vc2], animated: true)
            vc2.modalTransitionStyle = .crossDissolve
            vc2.modalPresentationStyle = .fullScreen
            present(vc2, animated: true, completion: nil)

            
        case .denied, .restricted:
            showSettingsAlert()
            print("Deined")
            
        default: break
        }
    }
    
    @IBAction func goToWeatherInfoScreen(_ sender: UIButton) {
        
        guard let text = weatherTextField.text, !text.isEmpty else {return}
        
        let storyboard = UIStoryboard(name: "WeatherViewController", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController else {return}
        vc.city = text
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func getWeatherVideo() { // Функиця получения видео на фоновое вью
        
        guard let pathWeatherVideo = Bundle.main.path(forResource: "Weather3", ofType: "mp4") else { return } // Путь к видео файлу находящегося непосредственно в проекте
        
        NotificationCenter.default.removeObserver(self)
        
        let urlVideo = URL(fileURLWithPath: pathWeatherVideo)
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
    
    func showSettingsAlert() { // функция создания алерт контроллера
        
        let alert = UIAlertController(title: nil, message: "You need allow use location in app settings", preferredStyle: .alert)
        let settings = UIAlertAction(title: "Settings", style: .default) { _ in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        alert.addAction(settings)
        
        present(alert, animated: true, completion: nil)
    }
}
