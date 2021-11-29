//
//  GoogleMapsViewController.swift
//  lesson23 homeWork
//
//  Created by Женя  on 27.11.21.
//

import UIKit
import GoogleMaps
import CoreLocation
import RxSwift


class GoogleMapsViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
       let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: 55.719875133401736, longitude: 37.523715868592255))
        
        marker.map = mapView
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setupLocation { result in
            guard result else { return }
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
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

}

extension GoogleMapsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
        [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }

    }
}

extension GoogleMapsViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        print("Will Moove")
    }

    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        print("didChange position \(position)")
    }

    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        print("idleAt \(position.target)")
    }
}
