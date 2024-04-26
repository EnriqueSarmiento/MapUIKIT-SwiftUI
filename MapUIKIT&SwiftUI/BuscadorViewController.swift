//
//  BuscadorViewController.swift
//  MapUIKIT&SwiftUI
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import UIKit
import MapKit

class BuscadorViewController: UIViewController, UISearchBarDelegate {

   @IBOutlet weak var buscar: UISearchBar!
   
   @IBOutlet weak var Mapa: MKMapView!
   override func viewDidLoad() {
        super.viewDidLoad()
      buscar.delegate = self
      
    }
   
   func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      buscar.resignFirstResponder()
      guard let buscador = buscar.text else { return }
      let geocoder = CLGeocoder()
      
      geocoder.geocodeAddressString(buscador) { (places: [CLPlacemark]?, error) in
         if error == nil {
            let place = places?.first
            let anotation = MKPointAnnotation()
            anotation.coordinate = (place?.location?.coordinate)!
            anotation.title = buscador
            
            let region = MKCoordinateRegion(center: anotation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
            
            self.Mapa.setRegion(region, animated: true)
            self.Mapa.addAnnotation(anotation)
            self.Mapa.selectAnnotation(anotation, animated: true)
         }else {
            // alerta de que no se encontro nada
            print("ALERT: ubicacion no encontrada")
         }
      }
      
   }
    

}
