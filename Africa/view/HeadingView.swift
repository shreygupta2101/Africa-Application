//
//  HeadingView.swift
//  Africa
//
//  Created by ShreyGupta on 18/08/23.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage : String
    var headLineText: String
    
    var body: some View {

        ZStack {
            HStack {
                Image(systemName: headingImage)
                    .foregroundColor(.accentColor)
                
                Text(headLineText)
                    .bold()
            }
        }
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headLineText: "Wilderness in Pictures")
    }
}
