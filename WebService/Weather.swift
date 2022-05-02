//
//  Weather.swift
//  WebService
//
//  Created by Giulio Ammendola on 07/04/2022.
//



import SwiftUI
import Alamofire







//struct DecodableTypeWeather: Decodable {
//
//    let cod: String
//}

struct WeatherView: View {
    
//    let weatherAPI = try? newJSONDecoder().decode(WeatherAPI.self, from: jsonData)
    
    @State private var value = ""
    @State private var value2 = ""
    @State private var weatherRequest = "https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=33.44&lon=94.04&appid=b1b15e88fa797225412429c1c50c122a1"
    
    var body: some View {
        
        VStack {
            
            Text("Weather app!")

            Text(self.value)
                .padding()

            Text(self.value2)
                .padding()
            
            Button {

                
                // To parse values from Alamofire responses:
                //
                //   Alamofire.request(url).responseWeather { response in
                //     if let weather = response.result.value {
                //       ...
                //     }
                //   }
                
                AF.request(weatherRequest).responseDecodable(of: Welcome.self) { response in
//
//                    let codice = response.value!.cod
//                    self.value2 = codice
//                    print(codice)

    //                    print(response.value?.headers.accept)
                    print(response.value?.lista.description)
                }
                

        

            } label: {
                Text("Press")
            }
        }
                    

        
        
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
