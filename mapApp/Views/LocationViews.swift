//
//  LocationViews.swift
//  mapApp
//
//  Created by Shubham Choudhary on 15/09/22.
//

import SwiftUI
import MapKit

struct LocationViews: View {
    
    @EnvironmentObject private var locationVM:LocationModelView
    
    var body: some View {
        ZStack{
            mapBackground
                .ignoresSafeArea()
            
            VStack {
                VStack{
                    header
                    
                    if(locationVM.showLocations){
                        LocationsListView()
                    }
                }
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 15,x: 0,y: 12)
                .padding()
                
                Spacer()
                
                locationInfoView
            }
           
                
        }
        .sheet(item: $locationVM.sheetLocationDetailView) { location in
            LocationDetailView(location: location )
        }
       
    }
}

struct LocationViews_Previews: PreviewProvider {
    static var previews: some View {
        LocationViews()
            .environmentObject(LocationModelView())
    }
}

extension LocationViews{
    
    private var header: some View{
        Button(action: locationVM.showLocationList) {
            Text(locationVM.currentLocation.name + ", " + locationVM.currentLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height:55)
                .frame(maxWidth:.infinity)
                .animation(.none, value: locationVM.currentLocation)
                .overlay(alignment:.leading) {
                    Image(systemName:"arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: locationVM.showLocations ? 180 : 0))
                       
            }
        }
    }
    
    
    private var mapBackground: some View{
        Map(
           coordinateRegion:$locationVM.mapRegion,
           annotationItems: locationVM.locations,
           annotationContent: {location in
               MapAnnotation(
                   coordinate: location.coordinates) {
                       MapPin().scaleEffect(locationVM.currentLocation == location ? 1.2:0.5)
                           .shadow(radius: 10)
                           .onTapGesture {
                               locationVM.showNextLocation(location: location)
                           }
                           
                   }
           })
    }
    
    
    private var locationInfoView: some View{
        ZStack{
            ForEach(locationVM.locations) { location in
                if(locationVM.currentLocation == location){
                    LocationPreviewView(location: locationVM.currentLocation)
                        .shadow(color: .black.opacity(0.3),radius: 20)
                        .padding()
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)))
                }
            }
        }
    }
}
