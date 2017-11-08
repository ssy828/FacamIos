//
//  SYCalendarDataModel.swift
//  MyCalendar
//

import Foundation

enum WeekDay: Int
{
    case Sun = 0,Mon,Tue,Wed,Thu,Fri,Sat
    
    var name: String{
        switch self {
        case .Sun:
            return "Sun"
        case .Mon:
            return "Mon"
        case .Tue:
            return "Tue"
        case .Wed:
            return "Wed"
        case .Thu:
            return "Thu"
        case .Fri:
            return "Fri"
        case .Sat:
            return "Sat"
      
        }
    }
}

struct SYCalendarDatamodel {
    
    var year : Int
    var month : Int
    var day: Int
    
    var startWeekOfMonth: WeekDay
    var lastDayOFMonth: Int
    
    init?(date: Date)
    {
        // test
        year = 2017
        month = 11
        day = 8
        startWeekOfMonth = .Wed
        lastDayOFMonth = 30
        
    }
}
