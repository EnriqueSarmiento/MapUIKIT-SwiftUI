//
//  PlacesView.swift
//  MapUIKIT&SwiftUI
//
//  Created by Enrique Sarmiento on 26/4/24.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
   let id = UUID()
   
   let nombre: String;
   let latitude: Double
   let longitude: Double
   // en el coordinate debe asignarle la latitud y la longitude del dato.
   var coordinate: CLLocationCoordinate2D{
      CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
   }
}

struct PlacesView: View {
   
   let places = [
      Place(nombre: "Museo Britanico", latitude: 51.519581, longitude: -0.127002),
      Place(nombre: "Torre de Londres", latitude: 51.508052, longitude: -0.076035),
      Place(nombre: "Big Ben", latitude: 51.500710, longitude: -0.124617),
   ]
   
   @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
   
    var body: some View {
       Map(coordinateRegion: $region, annotationItems: places){place in
          MapMarker(coordinate: place.coordinate, tint: .blue)
       }
    }
}
