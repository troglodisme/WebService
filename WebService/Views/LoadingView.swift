//
//  LoadingView.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
//    https://developer.apple.com/documentation/swiftui/progressview
        
        VStack(spacing:20){
            Text("Welcome to the Weather App")
                .bold()
                .font(.title)

            Text("Start by sharing your location to get the weather forecast for your area")            
            Text("Getting your location...")
                .padding()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                .frame(maxWidth: .infinity, maxHeight: 50)
        }
        .multilineTextAlignment(.center)
        .padding()

    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
