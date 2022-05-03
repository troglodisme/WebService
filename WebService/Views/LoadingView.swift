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
            Text("Welcome")
                .bold()
                .font(.title)

            Text("Please share your location to get the weather for your area")
                .padding()

            Text("Getting your location...")
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                .frame(maxWidth: .infinity, maxHeight: 40)
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
