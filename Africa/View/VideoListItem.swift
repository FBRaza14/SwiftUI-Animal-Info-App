//
//  VideoListItem.swift
//  Africa
//
//  Created by Fahad Bin Raza on 07/08/2023.
//

import SwiftUI

struct VideoListItem: View {
    // MARK: - Properties
    let video: VideoModel
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbNail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}


// MARK: - Preview
struct VideoListItem_Previews: PreviewProvider {
    
    static let videoList: [VideoModel] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItem(video: videoList[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
