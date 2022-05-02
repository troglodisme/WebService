//
//  ContentView.swift
//  WebService
//
//  Created by Giulio Ammendola on 05/04/2022.
//

import SwiftUI
import Alamofire


//https://github.com/Alamofire/Alamofire/blob/master/Documentation/Usage.md#response-handler-queue

// Provare un'altra API (openweather map)
// Provare a vedere un'immagine dal web (non si puo' usare Image, ma serve una libreria per aprire immagini dal web)


struct DecodableType: Decodable {
    
    let fact: String
    
}

struct CatFactsView: View {
    
    @State private var valore = ""
    @State private var valore2 = ""
    
    var body: some View {
        
        VStack {
            Text(self.valore)
                .padding()
            
            Text(self.valore2)
                .padding()
                .onAppear {
                    //load when view is opened
                    self.getCatsFacts()
                    
                }
            
            Button {
                getCatsFacts()
            } label: {
                Text("Get another fact")
            }

        }
        .navigationBarTitle("Cats Facts")
        .navigationBarTitleDisplayMode(.inline)
        
    }
        

    
    func getCatsFacts() {
        
        //.response is a closure
        AF.request("https://catfact.ninja/fact").responseDecodable(of: DecodableType.self) { response in
            
            //forcing unwrap (se il valore cambia sul server AF non trova nulla)
            let indirizzo = response.value!.fact
            self.valore2 = indirizzo
        }
    }
}

struct CatFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactsView()
    }
}



//VStack(alignment: .center, spacing: 10) {
//    Spacer()
//    HStack(alignment: .center, spacing: 16) {
//        Image(systemName: "sun.max.fill")
//            .font(.largeTitle)
//        Text("24º")
//            .font(.largeTitle)
//    }
//    Text("Sunny outside.\nDon't forget your hat!")
//        .font(.body)
//        .multilineTextAlignment(.center)
//    Spacer()
//}
