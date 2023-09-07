//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 06/08/2023.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // Mark: - Properties
    let animal: Animal
    // Mark: - Body
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(20)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
