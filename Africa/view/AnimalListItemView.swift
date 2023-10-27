//
//  AnimalListItemView.swift
//  Africa
//
//  Created by ShreyGupta on 13/08/23.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animal : AnimalListItemModel
    
    var body: some View {

        HStack(alignment: .center, spacing: 10) {
            
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
            
            VStack(alignment: .leading, spacing: 10) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    
    static let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(animal: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
