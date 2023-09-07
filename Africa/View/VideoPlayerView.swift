//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 10/08/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: -Properties
    var videoSelected: String
    var videoTitle: String
    
    
    //MARK: - BODY
    var body: some View {
        VStack {
          VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
             // Text(videoTitle)
          }
          .overlay(
            Image("logo")
              .resizable()
              .scaledToFit()
              .frame(width: 32, height: 32)
              .padding(.top, 6)
              .padding(.horizontal, 8)
            , alignment: .topLeading
          )
        } //: VSTACK
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
