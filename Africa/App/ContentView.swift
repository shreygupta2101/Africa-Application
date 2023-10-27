//
//  ContentView.swift
//  Africa
//
//  Created by ShreyGupta on 07/08/23.
//

import SwiftUI

struct ContentView: View {
    
    let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    var body: some View {
        
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: UIScreen.main.bounds.height/3)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    
                    NavigationLink(destination: DetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)
                    }
                }
            }.navigationBarTitle("AFRICA", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
