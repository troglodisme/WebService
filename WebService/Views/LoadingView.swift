//
//  LoadingView.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        
        VStack(spacing:20){
            

            
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
