//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 06/08/2023.
//

import SwiftUI

struct AnimalDetailView: View {
    // Mark: - Properties
    let animalDetail: Animal
    // Mark: - Body
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center,spacing: 20) {
                    // Main Image
                    Image(animalDetail.image)
                        .resizable()
                         .scaledToFit()
                    // Title
                    Text(animalDetail.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .background(
                            Color.accentColor
                                .frame(height: 6)
                                .offset(y: 20))
                    //Headline
                    Text(animalDetail.headline)
                        .font(.headline)
                        .padding(.horizontal)
                        .foregroundColor(.accentColor)
                        .multilineTextAlignment(.leading)
                    //Gallery
                    Group {
                        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildness in picture")
                        InsetGalleryView(animal: animalDetail)
                    }
                    .padding(.horizontal)
                    
                    //Facts
                    Group {
                        HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                        InsectFactView(animal: animalDetail)
                    }
                    .padding(.horizontal)
                    //Description
                    Group {
                        HeadingView(headingImage: "info.circle", headingText: "All about \(animalDetail.name)")
                        Text(animalDetail.description)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)
                    }
                    .padding(.horizontal)
                    // Map
                    Group {
                        HeadingView(headingImage: "map", headingText: "National Parks")
                        InsectMapView()
                    }
                    .padding(.horizontal)
                    // Link
                    Group {
                        HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                        ExternalWebView(animal: animalDetail)
                    }
                }
                .navigationBarTitle("Learn about \(animalDetail.name)", displayMode: .inline)
            }
            
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalDetailView(animalDetail: animals[0])
    }
}
