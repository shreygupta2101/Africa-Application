//
//  CoverImageView.swift
//  Africa
//
//  Created by ShreyGupta on 13/08/23.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: Properties
    let coverImages : [CoverImageModel] = Bundle.main.decode("covers.json")
    
    //MARK: Body
    var body: some View {
        
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                .scaledToFill()
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

//MARK: Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}
