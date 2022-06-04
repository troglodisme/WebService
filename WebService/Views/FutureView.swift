//
//  FutureView.swift
//  WebService
//
//  Created by Giulio Ammendola on 28/05/2022.
//

import SwiftUI

struct FutureView: View {
    

    @StateObject var locationManager = LocationManager()
    @StateObject var weatherManager = WeatherManager()

    var day: String
    var icon: String
    var minTemp: Double
    var maxTemp: Double
    var dailyPop: Double
    var dailyId: Int
    
    var body: some View {
        
        
        VStack {
            
            HStack {

                Text("\(day)")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.semibold)
                    .frame(width: 50, alignment: .leading)
                
                VStack{
                    Image(systemName: (icon) )
                        .font(.system(.title2))
                        .symbolRenderingMode(.multicolor)
                    
                        
//                        Text("weather condition id is \(dailyId)")
// To do: Only show water percentage if it's rainy, weatherManager.id < 800
                    
                    let dailyPopPercentage = (dailyPop * 100.00)
                        Text("\(dailyPopPercentage, specifier: "%.f")%")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.regular)
                            .foregroundColor(Color("Aqua"))

                }

                
                Spacer()
                
                HStack {
                    
                    Text("\(minTemp, specifier: "%.f") °C ")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.regular)
                    
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.white)
                        .frame(width: 40, height: 3)
                    
                    Text("\(maxTemp, specifier: "%.f") °C ")
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.regular)
                }
            }
        }
    }
}

struct FutureView_Previews: PreviewProvider {
    static var previews: some View {
        FutureView(day: "Day", icon: "questionmark.circle", minTemp: 99.0, maxTemp: 99.0, dailyPop: 0.5, dailyId: 0)
    }
}
