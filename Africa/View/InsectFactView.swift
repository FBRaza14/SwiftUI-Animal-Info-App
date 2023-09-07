//
//  InsectFactView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 06/08/2023.
//

import SwiftUI

struct InsectFactView: View {
    
    let animal: Animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsectFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsectFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
