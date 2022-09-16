//
//  LocationDetailView.swift
//  mapApp
//
//  Created by Shubham Choudhary on 16/09/22.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    let location: Location
    
    @EnvironmentObject var locationVM: LocationModelView
    
    var body: some View {
        ScrollView{
            VStack {
                imageDetailView
                    .shadow(
                        color: .black.opacity(0.3),
                        radius: 20,
                        y: 10
                       )
                    
                
                VStack (alignment: .leading, spacing: 16){
                    titleHeader
                    Divider()
                    
                    description
                    Divider()
                    
                    mapSection
                   
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            }
           
        }
        .ignoresSafeArea()
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationModelView())
    }
}


extension LocationDetailView{
    private var imageDetailView: some View{
        TabView {
            ForEach(location.imageNames, id: \.self) {imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.6)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleHeader: some View{
        VStack(alignment: .leading,spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    private var description:some View{
        VStack(alignment: .leading,spacing: 16){
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link){
                Link(destination: url) {
                    Text("Read more on wikepedia")
                        .font(.headline)
                        .tint(.blue)
                }
            }
        }
    }
    
    private var mapSection: some View{
        Map(
            coordinateRegion: .constant(MKCoordinateRegion(
                center: location.coordinates,
                span: locationVM.mapSpan)),
            annotationItems: [location]) { location in
                MapAnnotation(coordinate: location.coordinates) {
                    MapPin()
                        .shadow(radius: 10)
                }
            }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(12)
    }
    
    private var backButton: some View{
        Button {
            locationVM.sheetLocationDetailView = nil
        } label: {
            Image(systemName: "xmark")
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(10)
                .background(.white)
                .cornerRadius(12)
                .shadow(radius: 5)
                .padding()
        }

    }
}
