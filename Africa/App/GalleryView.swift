//
//  GalleryView.swift
//  Africa
//
//  Created by ShreyGupta on 07/08/23.
//

import SwiftUI

struct GalleryView: View {
    
    let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    var gridColumns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    var gridRows = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    LazyVGrid(columns: gridColumns, alignment: .center, spacing: 0) {
                            
                        ForEach(0...48, id: \.self) { index in
                            
                            if checkToFixFrameSize(index: index) {
                                
                                Image(animals[index % animals.count].image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: (geometry.size.width * 2)/3, height: (geometry.size.width * 2)/3)
                                        .background(Color.white)
                            }  else {
                                
                                LazyHGrid(rows: gridRows, alignment: .center, spacing: 0) {
                                    
                                    Image(animals[index % animals.count].image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: (geometry.size.width)/3, height: (geometry.size.width)/3)
                                            .background(Color.white)
                                    
                                    Image(animals[(index + 1) % animals.count].image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: (geometry.size.width)/3, height: (geometry.size.width)/3)
                                            .background(Color.white)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func checkToFixFrameSize(index: Int) -> Bool {
        return ((index % 2 == 1 || index % 6 == 0) && (index % animals.count) != 1)
    }
}

struct GalleryView_Previews: PreviewProvider {
    static let animal : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        GalleryView()
    }
}
