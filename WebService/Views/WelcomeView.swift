//
//  WelcomeView.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        
        VStack {
            
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)

                Text("Start by sharing your location to get the weather forecast for your area")
                    .padding()
                
                LocationButton(.shareCurrentLocation) {
                        locationManager.requestLocation()
                }
                .cornerRadius(15)
                .symbolVariant(.fill)
                .foregroundColor(.white)
                .labelStyle(.iconOnly)

            }
            .multilineTextAlignment(.center)
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
