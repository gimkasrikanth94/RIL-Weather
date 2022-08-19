//
//  AnalysisReportView.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 19/08/22.
//

import SwiftUI

struct AnalysisReportView: View {
    var details: WeatherDetails?
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("Summary")
                    .bold()
                    .padding(.bottom)
                
                HStack {
                    SummaryView(logo: "thermometer", name: "Min temp", value: "\(details?.main?.temp_min?.roundedValue() ?? "")°")
                    Spacer()
                    SummaryView(logo: "thermometer", name: "Max temp", value: "\(details?.main?.temp_max?.roundedValue() ?? "")°")
                }
                
                HStack {
                    SummaryView(logo: "wind", name: "Wind speed", value: "\(((details?.wind?.speed ?? 0)*3.6).roundedValue() ) km/hr")

                    Spacer()
                    SummaryView(logo: "humidity", name: "Humidity", value: "\(details?.main?.humidity ?? 0)%")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.bottom, 20)
        }
    }
}

struct AnalysisReportView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisReportView()
    }
}
