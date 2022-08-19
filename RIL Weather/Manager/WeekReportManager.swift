//
//  WeekReportManager.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import Foundation

struct Week: Codable{
    var title = ""
    var icon = ""
    var temp = ""
}

class WeekReportManager{
    static let shared = WeekReportManager()
    
    var weatherReport : [WeatherDetails] = []
    
    var timeZone = 0

    func fetchWeeklyReport() -> [Week]{

        var result = [Week]()

        let lastIndex = weatherReport.count-1
        var addDay = 1
        for i in 0...lastIndex{
            let nextDay = Date().nextDayTimeStamp(value: addDay)+timeZone
            if i == 0{
                var weekDt = Week()
                weekDt.title = "Now"
                weekDt.temp = "\((weatherReport[i].main?.temp ?? 0).roundedValue())°"
                weekDt.icon = weatherReport[i].weather?[0].icon ?? ""
                result.append(weekDt)
            }else{
                if nextDay == (weatherReport[i].dt ?? 0){
                    var weekDt = Week()
                    if let dayNum = Date().nextDayStart(value: addDay).dayNumberOfWeek(){
                        if dayNum == 1{
                            weekDt.title = "Sun"
                        }else if dayNum == 2{
                            weekDt.title = "Mon"
                        }else if dayNum == 3{
                            weekDt.title = "Tue"
                        }else if dayNum == 4{
                            weekDt.title = "Wed"
                        }else if dayNum == 5{
                            weekDt.title = "Thu"
                        }else if dayNum == 6{
                            weekDt.title = "Fri"
                        }else if dayNum == 7{
                            weekDt.title = "Sat"
                        }
                    }
                    weekDt.temp = "\((weatherReport[i].main?.temp ?? 0).roundedValue())°"
                    weekDt.icon = weatherReport[i].weather?[0].icon ?? ""
                    result.append(weekDt)
                        addDay += 1
                }
            }
        }
        return result
    }
    func imageName(_ icon: String) -> String{
        if icon == "10d"{
            return "cloud.rain.fill"
        }else{
            return ""
        }
    }
}
