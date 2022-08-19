//
//  WeekDayView.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct WeekDayView: View {
    var body: some View {
        ScrollView{
                HStack(spacing: 20) {
                    let weekReport = WeekReportManager.shared.fetchWeeklyReport()
                    ForEach((0..<weekReport.count), id: \.self) { index in
                        let report = weekReport[index]
                        if index == 0{
                            TimeLogoView(logo: report.icon, name: report.title, value: report.temp)
                        }else{
                            TimeLogoView(logo: report.icon, name: report.title, value: report.temp)
                        }
                    }
                }
        }
    }
}

struct WeekDayView_Previews: PreviewProvider {
    static var previews: some View {
        WeekDayView()
    }
}
