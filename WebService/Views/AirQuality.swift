////
////  AirQualityView.swift
////  WebService
////
////  Created by Giulio Ammendola on 09/04/2022.
////
//import SwiftUI
//import Alamofire
//
//struct AirQuality: Decodable {
//    let list: [List]
//}
//
//struct List: Decodable {
//    let main: Main
//    let components: Components
//}
//
//struct Main: Decodable {
//    let aqi: Int
//}
//
//struct Components: Decodable {
//    let co: Double
//    let no2: Double
//}
//
//struct AirQualityView: View {
//    
//    @State private var city = "London"
//    @State private var aqiValue = ""
//    @State private var coValue = 0.0
//    @State private var no2Value = 0.0
//
//    
//    @State private var weatherRequest = "https://api.openweathermap.org/data/2.5/air_pollution?lat=51.5085&lon=-0.1257&appid=cbbf654a1956664b0c183ba26f389799&units=metric"
//    
////    honk kong
////    @State private var weatherRequest = "https://api.openweathermap.org/data/2.5/air_pollution?lat=22.2855&lon=114.1577&appid=cbbf654a1956664b0c183ba26f389799&units=metric"
//
//    var body: some View {
//                
//        NavigationView {
//                        
//            VStack {
//                Text("Check current air quality")
//                    .padding()
//                    .font(.title)
//                                
//                Text("Air Quality in \(self.city) is \(self.aqiValue).")
//                    .padding()
//                
//                Text("co right now is: \(self.coValue)")
//                    .padding()
//                
//                Text("no2 right now is: \(self.no2Value)")
//                    .padding()
//
//                                
//                Button {
//                    AF.request(weatherRequest).responseDecodable(of: AirQuality.self) { response in
//                        
//                        
//                        if let co = response.value?.list[0].components.co {
//                            print(co)
//                            
//                            self.coValue = co
//                        }
//                        
//                        if let no2 = response.value?.list[0].components.no2 {
//                            print(no2)
//                            
//                            self.no2Value = no2
//                        }
//                        
//                        if let aqi = response.value?.list[0].main.aqi {
//                            
//                            print(aqi)
//                            
//                            if aqi == 1 {
//                                self.aqiValue = "good"
//                            }
//                            
//                            if aqi == 2 {
//                                self.aqiValue = "fair"
//                            }
//                            
//                            if aqi == 3 {
//                                self.aqiValue = "moderate"
//                            }
//                            
//                            if aqi == 4 {
//                                self.aqiValue = "poor"
//                            }
//                            
//                            if aqi == 5 {
//                                self.aqiValue = "very poor"
//                            }
//                        }
//                    }
//                    
//                } label: {
//                    Text("Get Air Quality")
//                }
//            }
//            .padding(15)
//
//        }
//        .navigationTitle("Air Quality")
//        .navigationBarTitleDisplayMode(.inline)
//
//    }
//}
//
//struct AirQuality_Previews: PreviewProvider {
//    static var previews: some View {
//        AirQualityView()
//    }
//}
//
//
