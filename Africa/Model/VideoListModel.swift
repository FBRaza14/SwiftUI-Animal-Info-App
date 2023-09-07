//
//  VideoListModel.swift
//  Africa
//
//  Created by Fahad Bin Raza on 07/08/2023.
//

import SwiftUI

struct VideoModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    
    // MARK: - Computed Property
    
    var thumbNail: String {
        "video-\(id)"
    }
}
