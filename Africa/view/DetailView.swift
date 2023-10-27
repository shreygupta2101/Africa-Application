//
//  DetailView.swift
//  Africa
//
//  Created by ShreyGupta on 17/08/23.
//

import SwiftUI

struct DetailView: View {

    let animal : AnimalListItemModel
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                
                Image(animal.image)
                    .resizable()
                    .frame(width: width, height: height/3)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Text(animal.name)
                    .font(.title)
                    .bold()
                    .background {
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 20)
                    }
                
                
                Text(animal.headline)
                    .padding()
                
                //MARK: Gallery View
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headLineText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
                
                //MARK: Facts View
                Group {
                    HeadingView(headingImage: "questionmark.circle", headLineText: "Did you know?")
                    InsetFactsView(animal: animal)
                        .frame(width: UIScreen.main.bounds.width, height: 200)
                        .background(Color.gray)
                }.padding(.horizontal)
                
                //MARK: Description View
                Group {
                    
                    HeadingView(headingImage: "info.circle", headLineText: "All About \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1) ///**Modifier used for giving more priority over other views.
                }.padding(.horizontal)
                
                //MARK: Map View
                Group {
                    
                    HeadingView(headingImage: "map", headLineText: "National Parks")
                    InsetMapView()
                        .frame(width: width, height: 300)
                }.padding(.horizontal)
                
                //MARK: Link View
                Group {
                    
                    HeadingView(headingImage: "books.vertical", headLineText: "Learn more")
                    ExternalWebLinkView(animal: animal)
                        .frame(width: width, height: 100)
                        .background(Color.gray)
                }.padding(.horizontal)
                
            }.navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)

        }
    }
}

struct DetailView_Previews: PreviewProvider {
    
    static let animals : [AnimalListItemModel] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        DetailView(animal: animals[1])
    }
}
