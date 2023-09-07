//
//  GalleryView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 05/08/2023.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    // DEFINITION OF GRID
//    let gridItems: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    // Alternative Way
    
//    let gridItems: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic Grid Layout
    @State private var gridItems: [GridItem] = [GridItem(.flexible())]
    @State private var gridClms : Double = 3.0
    
    // Method to change the grid Items
    
    func gridSwitcher() {
        withAnimation(.easeIn) {
            gridItems = Array(repeating: .init(.flexible()), count: Int(gridClms))
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
//                    .frame(width: 130,height: 130)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // Slider
                
                Slider(value: $gridClms, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridClms, perform: { value in
                        gridSwitcher()
                    })
                LazyVGrid(columns: gridItems, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                        
                    }
                } // Grid
                .onAppear(perform: {
                    gridSwitcher()
                })
            }//VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
