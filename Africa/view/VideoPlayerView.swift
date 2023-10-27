//
//  VideoPlayerView.swift
//  Africa
//
//  Created by ShreyGupta on 23/10/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    let videoSelected : String
    let videoTitle : String
    
    var body: some View {
        
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
                
            }.overlay (
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(.top, 8)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
}
