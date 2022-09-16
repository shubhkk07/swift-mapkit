//
//  LocationsListView.swift
//  mapApp
//
//  Created by Shubham Choudhary on 16/09/22.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var locationVM: LocationModelView
    
    var body: some View {
        List{
            ForEach(locationVM.locations) { location in
               listItem(location: location)
                    .padding(.vertical,4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())

    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationModelView())
    }
}

extension LocationsListView{
    private func listItem(location:Location)-> some View  {
        HStack(spacing:20){
            if let image = location.imageNames.first{
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
            }
           
            VStack(alignment:.leading){
                Text(location.name)
                Text(location.cityName)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .onTapGesture {
                locationVM.showNextLocation(location: location)
            }
           
            
            
           
        }
    }
    
}
