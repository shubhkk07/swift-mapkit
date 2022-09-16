//
//  Location.swift
//  mapApp
//
//  Created by Shubham Choudhary on 15/09/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable{
    let id:String = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    static func == (lhs: Location, rhs: Location)-> Bool{
        lhs.id == rhs.id
    }
}

