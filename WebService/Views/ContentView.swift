//
//  Weather.swift
//  WebService
//
//  Created by Giulio Ammendola on 07/04/2022.
//
import SwiftUI
import Alamofire

struct ContentView: View {
    
    //    @StateObject var weatherAPI = OpenWeather()
    //    @StateObject var weather = WeatherValues()
    //    @ObservedObject var weather: WeatherValues
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing:20){
                                    
                if let location = locationManager.location {
                    Text("Thanks for sharing your location")
                        .bold()
                        .font(.title)
                    
                    Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                    
                    NavigationLink(destination: WeatherView()) {
                        Text("Get Weather")
                    }
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
            .multilineTextAlignment(.center)
            .padding()
            //                        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            //                        .preferredColorScheme(.dark)
            
            
        }
        
        
    }
}

struct Weather_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//aggiungere anche le funzioni come si era fatto in questo esempio?

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