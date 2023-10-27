//
//  LeftGridView.swift
//  Africa
//
//  Created by ShreyGupta on 27/10/23.
//

import SwiftUI

struct LeftGridView: View {
    
    let animal : AnimalListItemModel

    var gridColumns = [GridItem(.fixed((UIScreen.main.bounds.width) * 2 / 3), spacing: 0), GridItem(.fixed((UIScreen.main.bounds.width) / 3), spacing: 0)]
    
    var gridRows = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    var body: some View {
        
            
        LazyVGrid(columns: gridColumns, alignment: .center, content: {

            Image(animal.image)
                .resizable()
                .frame(width: (UIScreen.main.bounds.width) * 2 / 3, height: 200)
                .overlay {
                    Rectangle()
                        .stroke(Color.black)
                }

            LazyHGrid(rows: gridRows, alignment: .center, content: {
                
                Image(animal.image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 3, height: 100)
                    .overlay {
                        Rectangle()
                            .stroke(Color.black)
                    }

                Image(animal.image)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 3, height: 100)
                    .overlay {
                        Rectangle()
                            .stroke(Color.black)
                    }
            })
        })
    }
}

struct LeftGridView_Previews: PreviewProvider {
    
    static let animal : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        
        LeftGridView(animal: animal[1])
    }
}
