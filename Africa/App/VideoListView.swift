//
//  VideoListView.swift
//  Africa
//
//  Created by Fahad Bin Raza on 05/08/2023.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - Properties
    
    @State var videoList: [VideoModel] = Bundle.main.decode("videos.json")
    
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(videoList) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                        VideoListItem(video: video)
                            .padding(.vertical, 8)
                    }
                }
            }// LIST
            .navigationBarTitle("Videos", displayMode: .inline)
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videoList.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
            
        }// Navigation
    }
    
    struct VideoListView_Previews: PreviewProvider {
        static var previews: some View {
            VideoListView()
        }
    }
}
