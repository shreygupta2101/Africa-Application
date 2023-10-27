//
//  MapAnnotationView.swift
//  Africa
//
//  Created by ShreyGupta on 23/10/23.
//

import SwiftUI

struct MapAnnotationView: View {
    
    let locations : LocationModel
    @State private var animation : Double = 0.0
    
    var body: some View {
        ZStack(content: {
            
            
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54)
                
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + animation)
                .opacity(1 - animation)
                
            
            
            Image(locations.image)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
            
        }).onAppear(perform: {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
            
        })
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    
    static let location : [LocationModel] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(locations: location[0])
    }
}
