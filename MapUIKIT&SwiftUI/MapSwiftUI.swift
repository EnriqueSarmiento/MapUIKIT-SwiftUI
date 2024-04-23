//
//  MapSwiftUI.swift
//  MapUIKIT&SwiftUI
//
//  Created by Enrique Sarmiento on 23/4/24.
//

import SwiftUI
import MapKit

struct MapSwiftUI: View {
   
   @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
   
    var body: some View {
       VStack{
          Map(coordinateRegion: $region)
       }.navigationTitle("MAPA SwiftUI")
    }
}
