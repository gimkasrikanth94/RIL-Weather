//
//  Extensions.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import UIKit
import SwiftUI


extension Double{
    func roundedValue() -> String{
        return String(format: "%.0f", self)
        
    }
}




extension Date{
    static func getcurrenttimeStamp() -> Int{

        let timestamp = NSDate().timeIntervalSince1970

        return Int(timestamp)
        
    }


    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }

    
    func nextDayTimeStamp(value: Int) -> Int{
        let todayDate = self
        var cal = Calendar.current
        cal.timeZone = TimeZone.current
        let today =  cal.startOfDay(for: todayDate)

        if let tomorrowDate = Calendar.current.date(byAdding: .day, value: value, to: today), let hourDate = Calendar.current.date(byAdding: .hour, value: 9, to: tomorrowDate){
        return Int(hourDate.timeIntervalSince1970)
        }
        return 0
    }

    func nextDayStart(value: Int) -> Date{
        var cal = Calendar.current
        cal.timeZone = TimeZone.current
        let today =  cal.startOfDay(for: self)
        return Calendar.current.date(byAdding: .day, value: value, to: today)!
    }

    
}

extension Int{
    func convertToTime() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short //Set time style
        dateFormatter.dateStyle = .none //Set date style
        dateFormatter.timeZone = NSTimeZone.local
        let localDate = dateFormatter.string(from: date)
        return localDate
    }
}

extension UIScreen{
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}
