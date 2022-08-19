//
//  WeatherManager.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import Foundation
import CoreLocation



class WeatherManager: ObservableObject{

    private let apiKey = "cc503eafaf9ce961a490cf48359d9572"

    func loadData(lat: CLLocationDegrees, long: CLLocationDegrees, completion:@escaping (Response?) -> ()) {

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(long)&appid=\(apiKey)&units=metric") else {
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                
                completion(nil)
                return
            }
                  do {

                      let jsonDecoder = JSONDecoder()
                      let responseModel = try jsonDecoder.decode(Response.self, from: data)

                        completion(responseModel)
                        return
                      } catch let err {
                          print("Err", err)
                          completion(nil)
                          return

                      }
        }.resume()

    }
}
