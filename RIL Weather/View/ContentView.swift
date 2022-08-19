//
//  ContentView.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()

    var body: some View {
        NavigationView{
            VStack {
                if let location = locationManager.location {
                    
                    WeatherView(location: location)
                }
                else{
                    if locationManager.isLoading{
                        ProgressView()
                    }
                }
            }
            .onAppear(){
                locationManager.requestLocation()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Weather")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
