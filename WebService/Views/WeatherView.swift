//
//  WeatherView.swift
//  WebService
//
//  Created by Giulio Ammendola on 02/05/2022.
//

import SwiftUI
import Alamofire

struct WeatherView: View {
    
    @State var cityValue = ""
    @State var latValue = 0.0
    @State var lonValue = 0.0
    @State var mainValue = ""
    @State var descriptionValue = ""
    @State var tempeartureValue = 0.0
    
    @StateObject var weatherAPI = OpenWeather()
    //    @ObservedObject var weather: WeatherValues
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                Text("Check current weather")
                    .padding()
                    .font(.title)
                    .onAppear{
                        self.getCurrentWeather()
                    }
                
                Text("City: \(cityValue)")
                Text("Latitude: \(latValue)")
                Text("Longitude: \(lonValue)")
                Text("Weather condition: \(descriptionValue)")
                Text("Temp feels like: \(tempeartureValue)")
                Text("Icon: ")
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/w/01d.png"))
                        
                
            }.padding(15)
                    
        }
    }
    
    
    func getCurrentWeather() {
        
        AF.request(weatherAPI.weatherRequest).responseDecodable(of: WeatherAPI.self) { response in
            
            
            if let cityName = response.value?.name {
                cityValue = cityName
                print(cityName)
            } else {
                print("no city")
            }
            
            if let latitude = response.value?.coord.lat {
                latValue = latitude
                print("lat \(latitude)")
            }
            
            if let longitude = response.value?.coord.lon {
                lonValue = longitude
                print("lon \(longitude)")
            }
            
            if let description = response.value?.weather[0].weatherDescription {
                descriptionValue = description
                print(description)
            }
            
            if let temperature = response.value?.main.temp {
                tempeartureValue = temperature
                print(temperature)
            }
        }
        
    }
    
    
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
