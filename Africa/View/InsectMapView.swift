//
//  InsectMapView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 06/08/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct InsectMapView: View {
//    var coordinate: CLLocationCoordinate2D
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        Map(coordinateRegion: $region)
          .overlay(
            NavigationLink(destination: MapView()) {
              HStack {
                Image(systemName: "mappin.circle")
                  .foregroundColor(Color.white)
                  .imageScale(.large)
                
                Text("Locations")
                  .foregroundColor(.accentColor)
                  .fontWeight(.bold)
              } //: HSTACK
              .padding(.vertical, 10)
              .padding(.horizontal, 14)
              .background(
                Color.black
                  .opacity(0.4)
                  .cornerRadius(8)
              )
            } //: NAVIGATION
            .padding(12)
            , alignment: .topTrailing
          )
          .frame(height: 256)
          .cornerRadius(12)
    }
}

struct InsectMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsectMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
