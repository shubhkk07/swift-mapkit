//
//  LocationModelView.swift
//  mapApp
//
//  Created by Shubham Choudhary on 15/09/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationModelView: ObservableObject{
    
    //All Locations
    @Published var locations:[Location]
    
    //currr Location
    @Published var currentLocation: Location{
        didSet {
            updateMapRegion(location: currentLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    @Published var showLocations:Bool = false
    
    @Published var sheetLocationDetailView: Location? = nil
    
    init() {
        let location = LocationsDataService.locations
        self.locations = location
        self.currentLocation = location.first!
        self.updateMapRegion(location: location.first!)
    }
    
    func showLocationList(){
        withAnimation(.easeInOut){
            showLocations.toggle()
        }
    }
    
    func showNextLocation(location:Location){
        withAnimation(.easeInOut){
          currentLocation = location
          showLocations = false
        }
    }
    
    private func updateMapRegion(location:Location){
        withAnimation(.easeInOut) {
            self.mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
            
        }
    }
    
    func nextButtonPressed(){
        guard let index:Int = locations.firstIndex(of: currentLocation) else{
            return
        }
        let nextIndex = index + 1
        
        guard locations.indices.contains(nextIndex) else{
            showNextLocation(location: locations.first!)
            return
        }
        showNextLocation(location:locations[nextIndex])
        
        
    }
    
}
