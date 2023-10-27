//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by ShreyGupta on 14/10/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal : AnimalListItemModel
    var body: some View {
        
        HStack {
            Image(systemName: "globe")
            Text("Wikipedia")
            
            Spacer()
            
            Image(systemName: "arrow.up.right.square")
                .foregroundStyle(Color.accentColor)
            
            if let url = URL(string: animal.link){
                Link(animal.name, destination: url)
            }
        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    
    static let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals[1])
    }
}

