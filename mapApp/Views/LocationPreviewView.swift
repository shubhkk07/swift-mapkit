//
//  LocationPreviewView.swift
//  mapApp
//
//  Created by Shubham Choudhary on 16/09/22.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location: Location
    let sheetInfo:Bool = true
    
    @EnvironmentObject var lvm: LocationModelView
    
    var body: some View {
        HStack (alignment:.bottom){
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleView
            }
            
            buttonSection
          
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.ultraThinMaterial)
                .offset(y:60)
                .cornerRadius(12)
        )
        
        }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
            .environmentObject(LocationModelView())
    }
}

extension LocationPreviewView{
    
    private var imageSection:some View{
        ZStack{
            Image(location.imageNames.first!)
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 100)
            .cornerRadius(12)
        }
        .padding(6)
        .background(.white)
        .cornerRadius(12)
    }
    
    
    private var buttonSection: some View{
        VStack(spacing:10){
            Button {
                lvm.sheetLocationDetailView = location
            } label: {
                Text("Learn more")
                    .frame(width:125,height: 35)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            
            Button {
                lvm.nextButtonPressed()
            } label: {
                Text("Next")
                    .frame(width:125,height: 35)
            }
            .buttonStyle(.bordered)

        }
    }
    
    private var titleView: some View{
        VStack(spacing:4){
                Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth:.infinity,alignment: .leading)
            
                Text(location.cityName)
                .font(.subheadline)
                .frame(maxWidth:.infinity,alignment: .leading)
            }
    }
}
