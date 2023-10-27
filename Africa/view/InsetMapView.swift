//
//  InsetMapView.swift
//  Africa
//
//  Created by ShreyGupta on 13/10/23.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599) , span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    var body: some View {
        
        Map(coordinateRegion: $region)
            .overlay (
                NavigationLink {
                    MapView()
                } 
                label: {
        
                    HStack(content: {
                        Image(systemName: "mappin.circle")
                            .imageScale(.large)
                            .foregroundStyle(Color.white)
                        
                        Text("Loactions")
                            .foregroundStyle(Color.accentColor)
                            .bold()
                            
                    }).padding(.horizontal, 10)
                        .padding(.vertical,8)
                        .background(Color.black.opacity(0.2))
                        .cornerRadius(10)
                    
                }.padding(),
                alignment: .topTrailing
            ).cornerRadius(10)
    }
}

#Preview {
    InsetMapView()
        .previewLayout(.sizeThatFits)
        .padding()
}
