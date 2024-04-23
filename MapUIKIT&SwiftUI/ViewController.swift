//
//  ViewController.swift
//  MapUIKIT&SwiftUI
//
//  Created by Enrique Sarmiento on 23/4/24.
//

import UIKit
import MapKit
import SwiftUI

class ViewController: UIViewController, CLLocationManagerDelegate {

   @IBOutlet weak var mapaUIKIT: MKMapView!
   
   let manager = CLLocationManager()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
   }
   
   // here we stablish the location accuracy and request for user / device authorization to get location
   override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      manager.desiredAccuracy = kCLLocationAccuracyBest
      manager.delegate = self
      manager.requestWhenInUseAuthorization()
      manager.startUpdatingLocation()
   }
   
   // here we stop the map render when the best accuracy is found and render new coordanates.
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      if let location = locations.first {
         manager.stopUpdatingLocation()
         renderMap(location: location)
      }
   }
   
   func renderMap(location: CLLocation){
      let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
      let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
      mapaUIKIT.setRegion(region, animated: true)
      
      let pin = MKPointAnnotation()
      pin.coordinate = coordinate
      pin.title = "Aqui estoy"
      pin.subtitle = "Lat: \(location.coordinate.latitude); Lon: \(location.coordinate.longitude)"
      
      mapaUIKIT.addAnnotation(pin)
   }
   
   @IBSegueAction func segueSwiftUI(_ coder: NSCoder) -> UIViewController? {
      return UIHostingController(coder: coder, rootView: MapSwiftUI())
   }
}

