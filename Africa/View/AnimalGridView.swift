//
//  AnimalGridView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 06/09/2023.
//

import SwiftUI

struct AnimalGridView: View {
    
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
        
    }
}

struct AnimalGridView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
