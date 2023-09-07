//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 12/08/2023.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK -Properties
    var location: LocationsModel
    @State private var animation: Double = 0.0
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52, alignment: . center)
                .scaleEffect(1+CGFloat(animation))
                .opacity(1-animation)
            
            Image(location.image)
                .resizable()
                .frame(width: 48,height: 48, alignment: .center)
                .scaledToFit()
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    
    static var locationData: [LocationsModel] = Bundle.main.decode("locations.json")
    static var previews: some View {
        MapAnnotationView(location: locationData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
