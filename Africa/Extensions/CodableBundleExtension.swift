//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Fahad Bin Raza on 05/08/2023.
//

import Foundation


extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        // Locating the JSON file
    
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        print(data)
        
        let decoder = JSONDecoder()
        guard let requiredData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data")
        }
        
        
        return requiredData
    }
}
