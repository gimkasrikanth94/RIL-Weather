//
//  WeatherView.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI
import CoreLocation
struct WeatherView: View {
    @State var location = CLLocationCoordinate2D()
    @State var weather: Response?
    
    var body: some View {
        ZStack(alignment: .leading){
                if let weather = weather {

                    let list = weather.list ?? []

                    VStack{
                        ScrollView{
                            HeaderView(title: weather.city?.name ?? "")
                            Spacer()
                        
                        VStack {
                            HStack(alignment: .center) {
                                VStack(spacing: 20) {
                                    let icon = list[0].weather?[0].icon ?? ""
                                    if let url = URL(string: "https://openweathermap.org/img/w/\(icon).png"){

                                    AsyncImage(
                                       url: url,
                                       placeholder: { ProgressView() },
                                       image: { Image(uiImage: $0).resizable() }
                                    ).aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                    }else{
                                        Color.gray
                                            .frame(width: 40, height: 40)

                                    }
                                    Text("\(list[0].weather?[0].description?.capitalized ?? "")")
                                }
                                .frame(width: 150, alignment: .leading)
                                
                                Spacer()
                                
                                Text((list[0].main?.temp?.roundedValue() ?? "") + "°")
                                    .font(.system(size: 55))
                                    .fontWeight(.bold)
                                    .padding()

                            }
                            
                            RisingView(city: weather.city)
                            Spacer()
                            WeekDayView()
                        }
                            AnalysisReportView(details: list[0])
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)


                }
        }
        }
        .onAppear(){
            WeatherManager().loadData(lat: location.latitude, long: location.longitude) { data in
                if let weather = data {

                    self.weather = weather
                    
                    WeekReportManager.shared.weatherReport =  weather.list ?? []
                    WeekReportManager.shared.timeZone =  (weather.city?.timezone ?? 0)
                }
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}



