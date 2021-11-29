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
    
    var city: String = ""
    var url: String = ""
    var temperature = 0
    
    var weather: [WeatherClass] = [] {
        didSet {
            DispatchQueue.main.async {
                self.setWeather(self.weather)
                RealmManager.shared.createHistoryWeather(cityName: self.city, temperarture: self.temperature)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SettingsManager.shared.pushVC = nil
      
        getURL()
        
        HttpManager.shared.getWeather(url) { WeatherClass in
            self.weather = WeatherClass
        }
        
        settingsViewBlur()
        settingsWeatherButtonView()
    }
    
    
    func getBackgroundWeatherVideo(_ nameOfWeather: String) {
        guard let pathWeatherVideo = Bundle.main.path(forResource: nameOfWeather, ofType: "mp4") else { return } // Путь к видео файлу находящегося непосредственно в проекте
        
        NotificationCenter.default.removeObserver(self)
        
        let urlVideo = URL(fileURLWithPath: pathWeatherVideo)
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
        backgroundWeatherVideo.addSubview(labelCity)
        backgroundWeatherVideo.addSubview(labelTemp)
        backgroundWeatherVideo.addSubview(labelPrognoz)
        backgroundWeatherVideo.addSubview(weatherImage)
        backgroundWeatherVideo.addSubview(backButtonAction)
    }
    
    
    @IBAction func back (_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.player?.pause()
    }
}

extension WeatherViewController {
    
    func getURL() {
        url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(ApiKey.keysWeatherURL.rawValue)"
    }
    
     func setWeather (_ weather: [WeatherClass] ) {
        if weather.isEmpty {
                self.labelCity.text = "city not found"
                self.labelTemp.text = "error"
            
        } else {
            for i in weather {
                    self.labelCity.text = i.city
                    self.labelTemp.text = "\(i.temp-273)°C"
                    self.labelPrognoz.text = i.prognoz
                    self.temperature = i.temp
                    
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
