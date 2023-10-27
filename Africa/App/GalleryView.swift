//
//  GalleryView.swift
//  Africa
//
//  Created by ShreyGupta on 07/08/23.
//

import SwiftUI

struct GalleryView: View {
    
    let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0) {
                    ForEach((0...16), id: \.self) { index in
                            
                        if (index % 2 != 0) {
                            LeftGridView(animal: animals[index % animals.count])
                        }
                        else {
                            RightGridView(animal: animals[index % animals.count])
                            
                        }
                    }
                }
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static let animal : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        GalleryView()
    }
}
