//
//  InsetFactsView.swift
//  Africa
//
//  Created by ShreyGupta on 08/10/23.
//

import SwiftUI

struct InsetFactsView: View {
    
    let animal : AnimalListItemModel
    var body: some View {
        TabView {
            
            ForEach(animal.fact, id: \.self) { animal in
                Text(animal)
                    .padding()
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}

struct InsetFactsView_Previews: PreviewProvider {
    
    static let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactsView(animal: animals[1])
    }
}
