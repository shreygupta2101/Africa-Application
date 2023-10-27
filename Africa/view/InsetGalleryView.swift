//
//  InsetGalleryView.swift
//  Africa
//
//  Created by ShreyGupta on 18/08/23.
//

import SwiftUI

struct InsetGalleryView: View {
    
    var animal : AnimalListItemModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(alignment: .center) {
                
                ForEach(animal.gallery, id: \.self) { image in
                    
                    Image(image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 10, height: (UIScreen.main.bounds.height/3) - 20, alignment: .center)
                        .cornerRadius(10)
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[2])
    }
}
