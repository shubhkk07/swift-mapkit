//
//  mapAppApp.swift
//  mapApp
//
//  Created by Shubham Choudhary on 13/09/22.
//

import SwiftUI

@main
struct mapAppApp: App {
    
    @StateObject private var locationVM:LocationModelView = LocationModelView()
    
    var body: some Scene {
        WindowGroup {
            LocationViews()
                .environmentObject(locationVM)
        }
    }
}
