//
//  CoverImageView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 05/08/2023.
//

import SwiftUI

struct CoverImageView: View {
    
    // Mark: - Properties
    let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    // Mark: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: Loop
            
        }//: - Tab
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // No hide the pager view
        .tabViewStyle(PageTabViewStyle())
    }
}

// Mark: - PREVIEW

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
