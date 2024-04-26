//
//  MapSwiftUI.swift
//  MapUIKIT&SwiftUI
//
//  Created by Enrique Sarmiento on 23/4/24.
//

import SwiftUI
import MapKit
import Combine

struct MapSwiftUI: View {
   
   @StateObject var locationManager = LocationManager()
   @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
   
   @State private var cancelable: AnyCancellable?
   
   func showLocation () {
      //el sink nos da una especie de closure que podemos utilizar para obtener datos y ejecutar otra accion como por ejeplo reescribir variables.
      cancelable = locationManager.$locations.sink { (location) in
         region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 2000, longitudinalMeters: 2000)
      }
   }
   
    var body: some View {
       VStack{
          Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil)
       }.navigationTitle("MAPA SwiftUI").onAppear{
          showLocation()
       }
    }
}
