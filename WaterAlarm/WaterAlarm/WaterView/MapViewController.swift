//
//  MapViewController.swift
//  WaterAlarm
//
//  Created by serif mete on 20.10.2023.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    
    //MARK: - MyVarabile
    
    @IBOutlet weak var Map: MKMapView!
    var locationManager: CLLocationManager!
    //MARK: - MyFunc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureMapView()
        ConfigureLocationManager()
        MapSetUp()
        
    }
        
    private func MapSetUp(){
        let location = CLLocation(latitude: 36.8949851, longitude: 30.6427646)
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        Map.setRegion(coordinateRegion, animated: true)
    }
    
   private func ConfigureMapView() {
        Map.showsUserLocation = true
        Map.userTrackingMode = .follow
    }
    
   private func ConfigureLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
    }
    
    @IBAction func BackButton(_ sender: Any) {
        MapSetUp()
        ConfigureMapView()
    }
    
    
   private func alertFunc(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            alertFunc(title: "Attention!!!", message: "The user did not choose whether the app can use location services.")
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            alertFunc(title: "Attention!!!", message: "The application is not authorized to use location services.")
        case .denied:
            alertFunc(title: "Attention!!!", message: "The user has denied the use of location services for the app or has it globally disabled in Settings.")
        case .authorizedAlways:
            alertFunc(title: "Attention!!!", message: "The user has given permission to the app to start location services at any time.")
        case .authorizedWhenInUse:
            alertFunc(title: "Attention!!!", message: "Allowed the user to start location services while the app is in use.")
        @unknown default:
            fatalError()
        }
        
        MapSetUp()
    }
}

