////
////  ContentView.swift
////  WebService
////
////  Created by Giulio Ammendola on 05/04/2022.
////
//
//import SwiftUI
//import Alamofire
//
//
////https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md#response-handler-queue
//
//// Provare un'altra API (openweather map)
//// Provare a vedere un'immagine dal web (non si puo' usare Image, ma serve una libreria per aprire immagini dal web)
//
//
//struct DecodableType: Decodable {
//
//    let url: String
//    let origin: String
//    let headers: HeaderDettaglio
//}
//
//
//struct HeaderDettaglio: Decodable {
//
//    let accept: String
//    let userAgent: String
//
//    //enum particolare
//    private enum CodingKeys: String, CodingKey {
//
//        case accept = "Accept"
//        case userAgent = "User-Agent"
//    }
//}
//
//
//
//
//struct ContentView: View {
//
//    @State private var value = ""
//    @State private var value2 = ""
//    @State private var weatherRequest = "https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=33.44&lon=94.04&appid=b1b15e88fa797225412429c1c50c122a1"
////    lat=51.50&lon=-0.12
//
//    var body: some View {
//
//        VStack {
//            Text(self.value)
//                .padding()
//
//            Text(self.value2)
//                .padding()
//
//            AsyncImage(url: URL(string: "https://m.media-amazon.com/images/I/318+Ei8zaBL._AC_.jpg")) { image in
//                image.resizable()
//            } placeholder: {
//                Color.red
//            }
//            .frame(width: 250, height: 300)
//            .clipShape(RoundedRectangle(cornerRadius: 25))
//
//
//            Button {
//
//                //.response is a closure
//                AF.request("https://httpbin.org/get").responseDecodable(of: DecodableType.self) { response in
//
//                    //forcing unwrap (se il valore cambia sul server AF non trova nulla)
//                    let indirizzo = response.value!.url
//                    self.value2 = indirizzo
//
//                    //if let / guard let
//                    if let origine = response.value?.origin {
//                        self.value = origine
//                    }
//
////                    print(response.value?.headers.accept)
////                    print(response.value?.headers.userAgent)
//                }
//
//            } label: {
//                Text("Press for bin")
//            }
//
//
//
//
//
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

