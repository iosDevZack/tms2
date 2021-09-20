//
//  WeatherViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 18.09.21.
//

import UIKit
import AVFoundation
import AVKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelPrognoz: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var backgroundWeatherVideo: UIView!
    @IBOutlet weak var backButtonAction: UIButton!
    
    
    
    
    
    var player: AVPlayer?
    var city = ""
    var Url: String = ""
    var prognozName: String = ""
    
    var weather: [WeatherClass] = [] {
        didSet {
            setTemp(weather)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        getURL()
        
        HttpManager.shared.getWeather(Url) { WeatherClass in
            self.weather = WeatherClass
        }
        
        settingsWeatherButtonView()
 
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
      
    }
    
    func getURL() {
        Url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(KeysWeather.keysWeatherURL.rawValue)"

    }
    
  private  func setTemp (_ weather: [WeatherClass] ) {
        if weather.isEmpty {
            DispatchQueue.main.async { [self] in
                self.labelCity.text = "city not found"
                self.labelTemp.text = "erorr"
            }
        } else {
            for i in weather {
                DispatchQueue.main.async { [self] in
                    self.labelCity.text = i.city
                    self.labelTemp.text = "\(i.temp - 273)°"
                    self.labelPrognoz.text = i.prognoz
                    self.prognozName = i.prognoz
                    
                    switch i.prognozId {
                    case 200...232: weatherImage.image  = UIImage(named: "thunderstorm")
                                    getBackgroundWeatherVideo("thunderstorm")
                        
                    case 300...321: weatherImage.image  = UIImage(named: "shower rain")
                                    getBackgroundWeatherVideo("shower rain")
                        
                    case 500...531: weatherImage.image  = UIImage(named: "rain")
                                    getBackgroundWeatherVideo("rain")
                        
                    case 600...622: weatherImage.image  = UIImage(named: "snow")
                                    getBackgroundWeatherVideo("snow")
                                    
                    case 701...781: weatherImage.image  = UIImage(named: "mist")
                                    getBackgroundWeatherVideo("mist")
                                     
                    case 800: weatherImage.image  = UIImage(named: "clear sky")
                                    getBackgroundWeatherVideo("clear sky")
                              
                    case 801: weatherImage.image  = UIImage(named: "few clouds")
                                    getBackgroundWeatherVideo("few clouds")
                              
                    case 802...804: weatherImage.image  = UIImage(named: "broken clouds")
                                    getBackgroundWeatherVideo("broken clouds")
                                     
                    default:
                         weatherImage.image  = UIImage(named: "")
                }
            }
        }
    }
}

    
    
    func getBackgroundWeatherVideo(_ nameOfWeather: String) {
        guard let pathNewsVideo = Bundle.main.path(forResource: nameOfWeather, ofType: "mp4") else { return } // Путь к видео файлу находящегося непосредственно в проекте
        
        NotificationCenter.default.removeObserver(self)
        
        let urlVideo = URL(fileURLWithPath: pathNewsVideo)
        let asset = AVAsset(url: urlVideo)
        let playerItem = AVPlayerItem(asset: asset) // отвечает за воспроизведение и перемотку (пауза) конкретного видео
        let player = AVPlayer (playerItem: playerItem)
        let videoLayer = AVPlayerLayer(player: player) // отвечает за впосроизведение на вью
        
        videoLayer.frame = CGRect(origin: .zero, size: backgroundWeatherVideo.frame.size) // задаем размер видео на вью
        videoLayer.videoGravity = .resizeAspectFill
        player.volume = 0.0
        backgroundWeatherVideo.layer.addSublayer(videoLayer)
        player.play()
//        view.layer.insertSublayer(videoLayer, at: 0) // Залить весь бэкграунд этим видео
        
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: playerItem, queue: .main) { _ in // отвечает за то чтобы видео начиналось сначала сразу после его окончания
//            player.volume = 0.0
            player.seek(to: .zero)
            player.play()
        }
        
        backgroundWeatherVideo.addSubview(labelTemp)
        backgroundWeatherVideo.addSubview(labelCity)
        backgroundWeatherVideo.addSubview(labelPrognoz)
        backgroundWeatherVideo.addSubview(weatherImage)
        backgroundWeatherVideo.addSubview(backButtonAction)
    }
    
    
    
    
    func settingsWeatherButtonView() {
        backButtonAction.tintColor = .lightGray
        backButtonAction.backgroundColor = .lightText
        backButtonAction.layer.masksToBounds = true
        backButtonAction.layer.cornerRadius = 18
    }

    
    @IBAction func back (_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.player?.pause()
    }
}
