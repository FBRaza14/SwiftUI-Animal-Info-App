//
//  LocationsDataModel.swift
//  Africa
//
//  Created by Fahad Bin Raza on 10/08/2023.
//

import SwiftUI
import MapKit

struct LocationsModel: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
