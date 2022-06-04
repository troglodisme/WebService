//
//  Weather.swift
//  WebService
//
//  Created by Giulio Ammendola on 07/04/2022.

import SwiftUI
import Alamofire
import CoreLocation
import MapKit
import CoreLocationUI


struct ContentView: View {
        
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherManager = WeatherManager()
    @StateObject var airQualityManager = AirQualityManager()
        
    @State var showMapView = false
    @State private var showingPopover = false
    
    @State private var opacity = 1.0
        
    var body: some View {
        
        NavigationView {
            ZStack{
                
//                Color("BackgroundColor")
                LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.5294439476656627, saturation: 0.018001694277108436, brightness: 0.7553387377635543, opacity: 0.39770507812500006), location: 0.00023287259615384617), Gradient.Stop(color: Color(hue: 0.12583537274096387, saturation: 0.38392142789909645, brightness: 1.0, opacity: 0.6905502870858434), location: 0.7088416466346154)]), startPoint: UnitPoint.top, endPoint: UnitPoint.bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    

                    //LOCATION
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(locationManager.cityLocation)")
                                .font(.system(.largeTitle, design: .rounded))
                                .fontWeight(.bold)
//                                .foregroundColor(.white)
                                    
                            HStack{
//                                Image(systemName: (airQualityManager.aqiIcon))
//                                    .font(.system(size: 18))
                                Text("\(airQualityManager.aqiValue)")
                                    .font(.system(.title3, design: .rounded))
                                    .fontWeight(.regular)
//                                    .foregroundColor(.white)
                            }
                        }
                        
                        Spacer()
                        Spacer()
                        
                        ZStack{
                            Circle()
                                .fill(.thickMaterial)
                                .frame(width: 70, height: 70)
                                .padding()
                                .opacity(opacity)
                            
                            if let location = locationManager.location {
                                
                                //When location is loaded show MapView button
                                Button(action: {
                                    self.showMapView = true
                                    withAnimation {
                                        opacity -= 0.2
                                    }
                                }) {
                                    Image(systemName: "map.fill")
                                        .foregroundColor(.black)
                                        .font(.largeTitle)
                                }
                                //this feels like a hack?
                                .onAppear {
                                    print("Get Weather")
                                    weatherManager.getWeather(latitude: location.latitude,
                                                              longitude: location.longitude)
                                    
                                    print("Get Air Quality")
                                    airQualityManager.getAirAquality(latitude: location.latitude,
                                                                     longitude: location.longitude)
                                }
                            }
                            
                            else {
                                if locationManager.isLoading {
                                    ProgressView()
                                }
                                else {
                                    LocationButton(.currentLocation) {
                                        locationManager.requestLocation()
                                    }
                                    .symbolVariant(.fill)
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(50)
                                    .font(.system(size:30))
                                    
                                }
                            }
                        }
                    }
                    .padding(10)
                    
                    Spacer()
                    
                    //Today's View
                    VStack {
                        
                    }
                    
                    Today(condition: weatherManager.descriptionValue,
                          temp: weatherManager.current_tempValue,
                          icon: weatherManager.icon
                    )
                    .padding(.horizontal, 10)
                    
                    Spacer()
                        .frame(height: 25)
                    
                    
                    //Future View
                    
                    VStack {
                        Rectangle()
                            .frame(height: 30)
                            .blendMode(.destinationOut)
                        
                        VStack{
                            
                            FutureView(day: weatherManager.daily_dtVal_1,
                                       icon: weatherManager.daily_icon_1,
                                       minTemp: weatherManager.daily_tempMin_1,
                                       maxTemp: weatherManager.daily_tempMax_1,
                                       dailyPop: weatherManager.daily_pop_1,
                                       dailyId: weatherManager.dailyId_1
                            )
                            
                            FutureView(day: weatherManager.daily_dtVal_2,
                                       icon: weatherManager.daily_icon_2,
                                       minTemp: weatherManager.daily_tempMin_2,
                                       maxTemp: weatherManager.daily_tempMax_2,
                                       dailyPop: weatherManager.daily_pop_2,
                                       dailyId: weatherManager.dailyId_2
                            )
                            
                            FutureView(day: weatherManager.daily_dtVal_3,
                                       icon: weatherManager.daily_icon_3,
                                       minTemp: weatherManager.daily_tempMin_3,
                                       maxTemp: weatherManager.daily_tempMax_3,
                                       dailyPop: weatherManager.daily_pop_3,
                                       dailyId: weatherManager.dailyId_3
                            )
                            
                            FutureView(day: weatherManager.daily_dtVal_4,
                                       icon: weatherManager.daily_icon_4,
                                       minTemp: weatherManager.daily_tempMin_4,
                                       maxTemp: weatherManager.daily_tempMax_4,
                                       dailyPop: weatherManager.daily_pop_4,
                                       dailyId: weatherManager.dailyId_4
                            )
                            
                            Rectangle()
                                .frame(height: 30)
                                .blendMode(.destinationOut)
                        }
                        .padding(.horizontal, 20)
                                                

                    }
                    .padding(.horizontal, 10)
                    .frame(maxWidth: .infinity)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 75))
                    .padding(.horizontal, 10)
//                    
                    Spacer()
                    Spacer()
                    
//                    Embed map in ContentView?
//                    Map(coordinateRegion: $locationManager.region)
//                        .frame(height: 200, alignment: .center)
//                        .padding(10)
                    
                    NavigationLink(
                        destination: MapView(condition: weatherManager.descriptionValue,
                                             temp: weatherManager.current_tempValue,
                                             lat: weatherManager.latValue,
                                             long: weatherManager.lonValue
                                            ),
                        isActive: $showMapView
                    ) {
                        EmptyView()
                    }.isDetailLink(false)
  
                    
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
//            .background{
//                Image("Clouds")
//            }
                                
        }
                
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}










