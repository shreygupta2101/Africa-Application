//
//  VideoListView.swift
//  Africa
//
//  Created by ShreyGupta on 07/08/23.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos : [VideoPlayerModel] = Bundle.main.decode("videos.json")
    
    let hapticsImapct = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                List {
                    ForEach(videos) { video in
                        
                        NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videoTitle: video.name)) {
                            VideoListItemView(video: video)
                                .padding(.vertical, 8)
                        }
                    }
                }.listStyle(InsetGroupedListStyle())
                    .navigationTitle("Videos")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                      ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            
                          // Shuffle videos
                            videos.shuffle()
                            hapticsImapct.impactOccurred()
                            
                        }) {
                          Image(systemName: "arrow.2.squarepath")
                        }
                      }
                    }
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
