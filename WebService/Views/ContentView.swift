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

//Per fare gli stili tutti uguali per font etc
//https://www.hackingwithswift.com/books/ios-swiftui/custom-modifiers
//https://useyourloaf.com/blog/swiftui-custom-environment-values/

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
                                        
                                        //on appear oppure background resume (quando riapri l'app), cercare nel pdf
                                        
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
                    //Aggiungere un altro if su locationmanager, con immagine
                    
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
                            
                            FutureView(day: weatherManager.dailyArray[1].daily_dt,
                                       icon: weatherManager.dailyArray[1].daily_icon,
                                       minTemp: weatherManager.dailyArray[1].daily_tempMin,
                                       maxTemp: weatherManager.dailyArray[1].daily_tempMax,
                                       dailyPop: weatherManager.dailyArray[1].daily_pop,
                                       dailyId: weatherManager.dailyArray[1].dailyId
                            )
                            
                            FutureView(day: weatherManager.dailyArray[2].daily_dt,
                                       icon: weatherManager.dailyArray[2].daily_icon,
                                       minTemp: weatherManager.dailyArray[2].daily_tempMin,
                                       maxTemp: weatherManager.dailyArray[2].daily_tempMax,
                                       dailyPop: weatherManager.dailyArray[2].daily_pop,
                                       dailyId: weatherManager.dailyArray[2].dailyId
                            )
                            
                            FutureView(day: weatherManager.dailyArray[3].daily_dt,
                                       icon: weatherManager.dailyArray[3].daily_icon,
                                       minTemp: weatherManager.dailyArray[3].daily_tempMin,
                                       maxTemp: weatherManager.dailyArray[3].daily_tempMax,
                                       dailyPop: weatherManager.dailyArray[3].daily_pop,
                                       dailyId: weatherManager.dailyArray[3].dailyId
                            )
                            
                            FutureView(day: weatherManager.dailyArray[4].daily_dt,
                                       icon: weatherManager.dailyArray[4].daily_icon,
                                       minTemp: weatherManager.dailyArray[4].daily_tempMin,
                                       maxTemp: weatherManager.dailyArray[4].daily_tempMax,
                                       dailyPop: weatherManager.dailyArray[4].daily_pop,
                                       dailyId: weatherManager.dailyArray[4].dailyId
                            )
                            
                            FutureView(day: weatherManager.dailyArray[5].daily_dt,
                                       icon: weatherManager.dailyArray[5].daily_icon,
                                       minTemp: weatherManager.dailyArray[5].daily_tempMin,
                                       maxTemp: weatherManager.dailyArray[5].daily_tempMax,
                                       dailyPop: weatherManager.dailyArray[5].daily_pop,
                                       dailyId: weatherManager.dailyArray[5].dailyId
                            )
                            
                            FutureView(day: weatherManager.dailyArray[6].daily_dt,
                                       icon: weatherManager.dailyArray[6].daily_icon,
                                       minTemp: weatherManager.dailyArray[6].daily_tempMin,
                                       maxTemp: weatherManager.dailyArray[6].daily_tempMax,
                                       dailyPop: weatherManager.dailyArray[6].daily_pop,
                                       dailyId: weatherManager.dailyArray[6].dailyId
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
                        destination: MapView(locationManager: self.locationManager,  //
                                             
                                             condition: weatherManager.descriptionValue,
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










