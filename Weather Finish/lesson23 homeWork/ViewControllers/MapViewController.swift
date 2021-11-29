//
//  MapViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 26.09.21.
//

import UIKit
import MapKit
import AVFoundation
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelPrognoz: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!

    
    let locationManager = CLLocationManager() // служба геолокации
    let anotation = MKPointAnnotation() // Создание аннотации
    var dispatchItem: DispatchWorkItem?
    
    var url: String = ""
    var city: String = ""
    var prognozName: String = ""
    
    
    var weather: [WeatherClass] = [] {
        didSet {
            DispatchQueue.main.async {
            self.setWeather(self.weather)
        }
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true // Узнает координаты где находится телефон(пользователь)
        mapView.delegate = self
        anotation.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(anotation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupLocation { result in
            guard result else { return }
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest // точность геопозиции
            self.locationManager.delegate = self
            self.locationManager.startUpdatingLocation()
        }
        
    }
    
    func setupLocation(_ completion: (Bool) -> ()) {
        guard CLLocationManager.locationServicesEnabled() else { // проверка включена ли геопозиция
            completion(false)
            return
        }
        switch locationManager.authorizationStatus {    // спрашивать о геолокации (всегда, при использовании, никогда)
        case .authorizedAlways, .authorizedWhenInUse:
                completion(true)
        case .denied:
            completion(false)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default: break
        }
    }
    
    override func pressesEnded(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        super.pressesEnded(presses, with: event)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
        [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        
    }
}
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) ->MKAnnotationView? { // Функция для того чтобы кастомизировать аннотацию (добавить изображение)
        let viewAnnotation = MKAnnotationView(annotation: annotation, reuseIdentifier: "Tag")
        viewAnnotation.image = #imageLiteral(resourceName: "Tag")
        viewAnnotation.frame = CGRect(origin: .zero, size: CGSize(width: 40, height: 40))
        return viewAnnotation
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) { // Отображает информацию в лэйбле (место, город, улица)
        
        anotation.coordinate = mapView.centerCoordinate // Привязываем аннотацию к центру экрану
        
        self.labelTemp.text = "Loading"
        self.labelCity.text = ""
        self.labelPrognoz.text = ""
        
        self.dispatchItem?.cancel()
        self.dispatchItem = DispatchWorkItem {
            
            guard self.dispatchItem?.isCancelled == false else { return }
            let location = CLLocation(latitude: self.mapView.centerCoordinate.latitude,
                                      longitude: self.mapView.centerCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(location) { placemark, error in
                if let _ = error {
                    print("Error")
                } else {
                    guard let place = placemark?.first else { return }
                    let countryAndCity = "\(place.country ?? "") \(place.city ?? "") \(place.streetName ?? "") \(place.streetNumber ?? "")"
                    
                    self.labelCity.text = countryAndCity
                    
                    self.url = "https://api.openweathermap.org/data/2.5/weather?q=\(place.city ?? "")&appid=\(ApiKey.keysWeatherURL.rawValue)&units=metric"
                    
                    HttpManager.shared.getWeather(self.url) { WeatherClass in
                        self.weather = WeatherClass
                    }
                }
            }
        }
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 1.0, execute: self.dispatchItem!)
    }
}

extension MapViewController {
    
    func getURL() {
        url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(ApiKey.keysWeatherURL.rawValue)&units=metric"
    }
    
     func setWeather (_ weather: [WeatherClass] ) {
        if weather.isEmpty {
//            DispatchQueue.main.async {
                self.labelCity.text = "city not found"
                self.labelTemp.text = "error"
        } else {
            for i in weather {
//                DispatchQueue.main.async {
                    self.labelTemp.text = "\(i.temp)°C"
                    self.labelPrognoz.text = i.prognoz
                    self.prognozName = i.prognoz

//                    switch i.prognozId {
//                        case 200...232: weatherImage.image  = UIImage(named: "thunderstorm")
//
//
//                        case 300...321: weatherImage.image  = UIImage(named: "shower rain")
//
//
//                        case 500...531: weatherImage.image  = UIImage(named: "rain")
//
//
//                        case 600...622: weatherImage.image  = UIImage(named: "snow")
//
//
//                        case 701...781: weatherImage.image  = UIImage(named: "mist")
//
//
//                        case 800: weatherImage.image  = UIImage(named: "clear sky")
//
//
//                        case 801: weatherImage.image  = UIImage(named: "few clouds")
//
//
//                        case 802...804: weatherImage.image  = UIImage(named: "broken clouds")
//
//
//                        default:
//                                weatherImage.image  = UIImage(named: "")
//                    }
                }
            }
        }
    }
