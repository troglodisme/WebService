import SwiftUI
import CoreLocationUI
import MapKit

struct MapView: View {
        
    @StateObject var locationManager = LocationManager()
    @StateObject var weatherManager = WeatherManager()

    var condition: String
    var temp: Double
    var lat = 0.0
    var long = 0.0

    struct Location: Identifiable {
        let id = UUID()
        let name: String
        let coordinate: CLLocationCoordinate2D
    }
    
    let locations = [
//        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Home", coordinate: CLLocationCoordinate2D(latitude: 51.53464818, longitude: -0.05581317  )),
//        Location(name: "Work", coordinate: CLLocationCoordinate2D(latitude: 51.552, longitude: -0.040))
    ]

    
//    @State var currentRegion = MKCoordinateRegion(
//        center:  CLLocationCoordinate2D(
//          latitude: lat,
//          longitude: long
//        ),
//        span: MKCoordinateSpan(
//          latitudeDelta: 0.01,
//          longitudeDelta: 0.01
//       )
//    )
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Map(
                coordinateRegion: $locationManager.region,
                showsUserLocation: false,  //I couldn't use this so hiding it for now
                
                annotationItems: locations) { location in
                    
                    MapAnnotation(
                        coordinate: location.coordinate,
                        content: {
                            Image(systemName: "pin.circle.fill").foregroundColor(.red)
                                .font(.title)
//                            Text("\(lat),g \(long)")
                            Text("\(condition.capitalized), \(temp, specifier: "%.f") °C")
                                .padding(10)
                                .background(.white)
                                .foregroundColor(.black)
                                .clipShape(Capsule())
                                .onTapGesture {
                                    print("tapped")
                                }
                        })
                }.edgesIgnoringSafeArea(.all)
//                .onAppear {
            //                    weatherManager.getWeather(latitude: 51.552, longitude: -0.040)

//                    self.region = MKCoordinateRegion(
//                        center: locationManager.location.coordinate,
//                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//                    )
            
//            VStack {
//                if let location = locationManager.location {
//                    Text("**Current location:** \(location.latitude), \(location.longitude)")
//                        .font(.callout)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(.gray)
//                        .clipShape(RoundedRectangle(cornerRadius: 5))
//                }
//
//                Spacer()
//                LocationButton {
//                    locationManager.requestLocation()
//                }
//                .frame(width: 180, height: 40)
//                .cornerRadius(30)
//                .symbolVariant(.fill)
//                .foregroundColor(.white)
//            }
//            .padding()
        }
    }
}









