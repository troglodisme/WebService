//
//  Weather.swift
//  WebService
//
//  Created by Giulio Ammendola on 07/04/2022.
//
import SwiftUI
import Alamofire
import CoreLocation

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherManager = WeatherManager()
    
    var body: some View {
        
        NavigationView {
            ZStack{
                VStack(spacing:20){
                    
                    if let location = locationManager.location {
                        
                        Text("\(weatherManager.cityValue)")
                            .bold()
                            .font(.title)
                            .onAppear{
                                weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }
                        
                        let temp = weatherManager.tempeartureValue
                        Text("\(temp, specifier: "%.f") °C ")
                            .font(.title)
                        
                        Text("\(weatherManager.descriptionValue)".capitalized)
                            .font(.title2)
                        
                        AsyncImage(url:
                                    URL(string: "https://openweathermap.org/img/wn/\(weatherManager.icon)@4x.png")
                        )
                        
                        Button {
                            print("get weather")
                            weatherManager.getCurrentWeather(
                                latitude: location.latitude,
                                longitude: location.longitude
                            )
                        } label: {
                            Image(systemName: "arrow.clockwise")
                            Text("Check Again")
                            
                        }
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                    }
                    
                    else {
                        if locationManager.isLoading {
                            LoadingView()
                        } else {
                            WelcomeView()
                                .environmentObject(locationManager)
                        }
                    }
                }
                .navigationTitle("Current Weather")
                
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button{
                        print("location map")
                    } label: {
                        Image(systemName: "map")
                    }
                    
                    Button{
                        print("location list")
                    } label: {
                        Image(systemName: "list.dash")
                        
                    }
                                        
                }
            }
        }
    }
    
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







//struct SimpleModel {
//
//    var test = "empty"
//
//    mutating func helloWorld() {
//        self.test = "hello"
//        print("ciao")
//    }
//}

//Esercizi
//creare modello delle chiamate meteo e tutte le struct
//spiegare quando serve mutating func nello struct
//
//rifare esercizio con @ObservedObject
//riprovare esercizi, @state + @binding
//
//
//Spiegazione  @states
//
//nel file principale @State (si aggiorna in automatico)
//nella seconda view @Binding : String senza inizializzare  e passero' con $
//
//
//https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject
//
//Creare una class conforme a observed object
//@ObservedObject
//
//@Publishing
//tutte le variabili @Published verranno aggiornate automaticamente
//
//
//uguale a observed object, ma per un numero minore di views sapendo il parent
//@StateObject
//
//
//condiviso da tutta l'applicazione, instanziato in copia unica (per esempio per qualcosa che viene usato
//in tutta la app, per esempio login da tenere dappertutto nell'app)
//@EnvironmentObject
//
//
//altro esempio, con observable object per tracciare posizione del gps per la corsa etc..
