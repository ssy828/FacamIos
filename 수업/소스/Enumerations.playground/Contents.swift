//: Playground - noun: a place where people can play

import UIKit


// 열거형 -> 정의
// 각 case 그 자체가 고유의 값
enum Weekday: String { // Week 타입 구조체/ 클래스 같은 타입
    
    case mon = "평일" // 고정값을 넣어주려면 위에 타입을 지정해줘야함
    case tue
    case wed
    case thu,fri,sat, sun
    
}

// 먼저 열거형 타입을 선언하고 그 변수를 사용해야함.
var day:Weekday = .tue
// var day: Weekday = Weekday.mon
day = .mon // 변수 day 값을 바꿈 
// 타입값이 명확하면 .케이스로 써도 됨

// if문처럼 day 값을 판별하려고 씀
switch day {
case .mon, .tue, .wed, .thu:
    print("평일")
case .fri:
    print("불금")
default:  // 모든 열거형케이스가 있는 경우 생략가능!
    print("신나는 주말")
}


// 원시값 (Raw Value) 
// case별로 각각 다른 값을 가져야함
enum Country: String {
    case Japan = "일본"
    case Korea = "한국"
    case Mexico = "멕시코"
    case USA
}
print(Country.Japan.rawValue)
// USA에는 원시값을 지정안해줬으므로 case의 이름을 원시값으로 사용함
print("Country.USA.rawValue == \(Country.USA.rawValue)")

// 원시값을 통한 초기화
// 원시값이 case에 해당하지 않는 경우가 있으므로 원시값을 통해 초기화 한 인스턴스는 옵셔널타입!
// let japan: Country = Country(rawValue: "일본")
let japan: Country? = Country(rawValue: "일본")
