//: Playground - noun: a place where people can play
//func getWeekDay(atMonth: Int, day: Int) -> String {
//    var resultValue: String = " "
//    var dayArray:[String] = ["일","월","화","수","목","금","토"]
//    var monthArray:[Int] = [31,28,31,30,31,30,31,31,30,31,30,31]
//    var getDay: Int = 0
//    for i in 1..<atMonth {
//        getDay += monthArray[i]
//    }
//    getDay += day // getDay = getDay + day
//    
//    var temp: Int = 0
//    temp = (getDay-1)%7 // 배열은 0~6까지 이므로 미리 1을 빼줘야함
//    resultValue = dayArray[temp]
//    print(resultValue)
//    
//    return resultValue
//}

//getWeekDay(atMonth: 3, day: 13)

func shoter(num: Int) -> Int {
    var number: Int = num // 위의 num은 상수이므로 변수가 되게 새로운 변수 선언
    var resultV: String = " "
    var numberArray: [Int] = [ ]
    var temp: [Int] = [ ]
    while num > 0 {
        number%10 // 나머지
    }
    
//    for i in 1..<numberArray.count {
//        if numberArray[i] != numberArray[i-1]{
//            temp.append(numberArray[i])
//        }
//    }
//    print(temp)
    
    //print(resultV)
    return Int(resultV)!
    
}
shoter(num: 1002233422)
