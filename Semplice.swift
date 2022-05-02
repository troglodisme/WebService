//
//  Semplice.swift
//  WebService
//
//  Created by Giulio Ammendola on 12/04/2022.
//

import Foundation
import SwiftUI

struct SimpleModel {
    
    var test = "empty"
    
    mutating func helloWorld() {
        self.test = "hello"
        print("ciao")
    }
}

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
