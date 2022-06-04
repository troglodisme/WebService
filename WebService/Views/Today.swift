//
//  Today.swift
//  WebService
//
//  Created by Giulio Ammendola on 28/05/2022.
//

import SwiftUI
import CoreLocationUI
import SFSafeSymbols

struct Today: View {
    
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherManager = WeatherManager()
    
    var condition: String
    var temp: Double
    var icon: String
    
    var body: some View {
        
        HStack{
            VStack (alignment: .leading){
                
                HStack {
                    
                        Image(systemName: (icon))
                            .font(.system(size: 80))
                            .symbolRenderingMode(.multicolor)
                                        
                    Spacer()
                    
                    VStack(alignment: .leading){
                        
                        Text ("\(weatherManager.current_dtValue.formatted(.dateTime.weekday(.wide)))")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.regular)
                        
                        Text("\(condition)".capitalized)
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.medium)
                        
                        //How can I make this show something else if temp is not available yet?
                        Text("\(temp, specifier: "%.f") °C ")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                        
                    }
                    .padding(10)
                }
                
            }
            .padding(.horizontal, 5)
        }
        .padding(10)
        .background(.thinMaterial)
        .clipShape(Capsule())
                
        
    }
}

struct Today_Previews: PreviewProvider {
    static var previews: some View {
        Today(condition: "Placeholder", temp: 31.5, icon: "sun.fill")
    }
}
