//
//  MapPin.swift
//  mapApp
//
//  Created by Shubham Choudhary on 16/09/22.
//

import SwiftUI

struct MapPin: View {
    
    let accentColor:Color = Color("AccentColor")
    
    var body: some View {
        VStack(spacing:0){
            Image(systemName:"map.circle.fill")
                .resizable()
                .scaledToFit()
                .font(.headline)
                .frame(width: 30,height: 30)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10,height: 10)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y : -3)
                .padding(.bottom,40)
               
        }
    }
}

struct MapPin_Previews: PreviewProvider {
    static var previews: some View {
        MapPin()
    }
}
