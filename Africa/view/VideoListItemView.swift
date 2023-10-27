//
//  VideoListItemView.swift
//  Africa
//
//  Created by ShreyGupta on 19/10/23.
//

import SwiftUI

struct VideoListItemView: View {
    
    var video : VideoPlayerModel
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .frame(width: 80, height: 70)
                    .cornerRadius(10, antialiased: true)
                

                Image(systemName: "play.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(video.name)
                    .foregroundStyle(Color.accentColor)
                    .fontWeight(.heavy)
                    .font(.title2)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)

            }
        }
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    
    static let videos : [VideoPlayerModel] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos[6])
    }
}
