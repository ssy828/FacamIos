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
    
    
    init?(date: Date) // date에 현재 년월일,시간,분,초 다있음
    {
        let calendarIns = Calendar(identifier: .gregorian)
//        Calendar.dateComponents(Calendar)
        // 현재 관련된 데이트를 만들어냄
        var components = calendarIns.dateComponents([.year, .month, .day], from: date)
        // date에 현재 년월일,시간,분,초가 다 있는데 year, month의 값만 빼서 할당함
        year = components.year ?? 0
        month = components.month ?? 0
//        [.year, .month, .day]로 설정헤야 사용가능!
        day = components.day ?? 0
        //        -> 매달 1일이 무슨요일인지 알아야함
        // 다음 달을 알고 싶은 경우
//        components.month += 1
        components.day = 1
        
        // 11월1일을 빼내기 위해서 다시 컴포넌트를 매개변수에 넣어서 사용
        // 각 년월의 1일인 date
        guard let firstDay = calendarIns.date(from: components) else { return nil }
        var weekDayCompo = calendarIns.dateComponents([.weekday], from: firstDay)
        guard let weekDay = weekDayCompo.weekday else { return nil }
        startWeekOfMonth = WeekDay.init(rawValue: weekDay - 1)!
        // weekday는 보통 1234567로 나오는데 그걸 이넘으로 설정해줌
        // 0으로 rawValue를 설정해줬으므로
        // 1부터 시작하므로 그걸 바꿈
        
        // 마지막 날 구해오기
        var addCompo = DateComponents()
        addCompo.month = 1
        addCompo.day = -1
        
        guard let lastDate = calendarIns.date(byAdding: addCompo, to: firstDay) else {
            return nil
        }
        
        lastDayOFMonth = calendarIns.dateComponents([.day], from: lastDate).day ?? 1
        
    }
}

//MARK:
class SYCalendarManager
{
    class func nextMonth(with dateModel: SYCalendarDatamodel ) -> Date
    {
        let calendarIns = Calendar(identifier: .gregorian)
        
        var newCompo = DateComponents()
        newCompo.year = dateModel.year
        newCompo.month = dateModel.month + 1
        newCompo.day = dateModel.day
        
        if let nextDate = calendarIns.date(from: newCompo){
            return nextDate
            
        }else{
            return Date()
        }
      
    }
    
    // MARK: 위의 방식과 또다른 방식: 다음달
    class func nextMonth(with nowDate: Date ) -> Date?
    {
        let calendarIns = Calendar(identifier: .gregorian)
        var addCompo = DateComponents()
        addCompo.month = 1
        guard let newDate = calendarIns.date(byAdding: addCompo, to: nowDate) else { return nil }
        
        return newDate
    }
    
    class func previousMonth(with nowDate: Date ) -> Date?
    {
        let calendarIns = Calendar(identifier: .gregorian)
        var addCompo = DateComponents()
        addCompo.month = -1
        guard let newDate = calendarIns.date(byAdding: addCompo, to: nowDate) else { return nil }
        
        return newDate
    }
    
    func newDate(of day: Int )
    {

    }
}

