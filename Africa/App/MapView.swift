//
//  MapView.swift
//  Africa
//
//  Created by ShreyGupta on 07/08/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region: MKCoordinateRegion =  {
        var coordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var zoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var region = MKCoordinateRegion(center: coordinates, span: zoomLevel)
        
        return region
    }()
    
    let locations : [LocationModel] = Bundle.main.decode("locations.json")
    
    var body: some View {
        
        //MARK: Basic Map
        //Map(coordinateRegion: $region)
        
        //MARK: Map with annotations
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            
            //MARK: Map Pin
//            MapPin(coordinate: item.location, tint: .accentColor)
            
            //MARK: Marker
//            MapMarker(coordinate: item.location, tint: .accentColor)
            
            //MARK: Custom Annotation
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30, alignment: .center)
//            }
            
            //MARK: Custom Annotation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(locations: item)
                    .padding()
            }
        }).overlay (
            HStack(alignment: .center, spacing: 10, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60, alignment: .center)
                    .padding(.horizontal, 8)
                
                VStack(alignment: .leading, spacing: 1, content: {
                    
                    HStack(content: {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding()
                    
                    })
                    Divider()
                    
                    HStack(content: {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding()
                    
                    })
                })
            }).background(Color.black)
                .cornerRadius(8.0)
                .opacity(0.6)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
            
            , alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
