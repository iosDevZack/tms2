//
//  WeatherInMyLocationViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 24.10.21.
//

import UIKit
import AVFoundation
import AVKit
import CoreLocation
import RxSwift

class WeatherInMyLocationViewController: UIViewController {
        
    @IBOutlet weak var viewBlur: UIView!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelPrognoz: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var backgroundWeatherVideo: UIView!
    @IBOutlet weak var backButtonAction: UIButton!
    
    let locationManager = CLLocationManager()
    
    
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

        locationManager.desiredAccuracy = kCLLocationAccuracyBest //задаем точность
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        getURL()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        

        
        locationManager.stopUpdatingLocation()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
       
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
    //       view.layer.insertSublayer(videoLayer, at: 0) // Залить весь бэкграунд этим видео
            
            
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
    
        
    @IBAction func back (_ sender: UIButton) {
//        self.navigationController?.popToRootViewController(animated: true)
        modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
        self.player?.pause()
    }
}

    extension WeatherInMyLocationViewController {
        
    func getURL() {
        url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(ApiKey.keysWeatherURL.rawValue)&units=metric"
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

extension WeatherInMyLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let coordinate = locations.first?.coordinate else { return }
        
 
        
        let url = "http://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=bb3af6a661e716dc3b3bfab4c1c87d6c"
        
        HttpManager.shared.getWeather(url) { WeatherClass in
            self.weather = WeatherClass
        }
    }
}

