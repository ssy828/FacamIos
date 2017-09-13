//: Playground - noun: a place where people can play

// 1. inch to cm, cm to inch( 2개 )
//func changeInchToCm(type: String, value: Double) -> Double {
//   
//    var resultValue: Double = 0
//    
//    if  type == "inch" {
//        resultValue = value * 2.54
//    }else if type == "cm" {
//        resultValue = value / 2.54
//    }else{
//        print("값을 잘못 입력했습니다.")
//    }
//    
//    print(resultValue)
//    
//    return resultValue
//}
//
////inchToCm(inch: 4, cm: 2.5)
//changeInchToCm(type: "cm", value: 3)
//

//// m2 to 평, 평 to m2
//func changeArea(type: String, num: Double) -> Double{
//    
//    var resultV: Double = 0
//    if type == "평" {
//        resultV = num * 3.3
//    }else if type == "m2"{
//        resultV = num / 3.3
//        // resultV = String(num / 3.3) + "m2"
//    
//    }else {
//        print("type 값이 오류입니다.")
//    }
//    print(resultV)
//    return resultV
//}
//
//changeArea(type: "평", num: 2)

// 화씨 to 섭씨 , 섭씨 to 화씨
func faherenheitCelsius(type: String, num: Double) -> Double {
   
    var resultValue: Double = 0
    if type == "F" {
       resultValue = (9/5*num) + 32
    }else if type == "C"{
        resultValue = 5/9*(num-32)
    }else{
        print("오류입니다.")
    }
    print(resultValue)
    return resultValue
}
faherenheitCelsius(type: "F", num: 1)


// 데이터량(KB to MB, MB to GB)
func amountOfData(num: Double) -> Double {
    var resultV: Double = 0
    resultV = num / 1024
    print(resultV)
    return resultV
}
amountOfData(num: 1)

// 시간(hhmmss) ->  초단위, 초단위 -> 시간으로변경
// ex 11320 -> 4400초

// 시간(hhmmss) -> 초단위, 초단위 -> 시간
func hourInSeconds(type: String, num: Int) -> Int {
    var number = num // num이 상수이므로 변수를 선언해야함
    var resultValue: Int = 0
    if type == "초단위" {
        var hour: Int = 0
        var minute: Int = 0
        var seconds: Int = 0
        seconds = number%100
        number = number/100 // 여기에 저장된 number
        minute = (number%100)*60 // 위의 저장된 number를 나머지로 나눠 초단위로 바꾸는 것
        number = number/100
        hour = (number%100)*3600
        resultValue = seconds + minute + hour
        print(resultValue)
    }else if type == "시간" {
        resultValue = number/3600
    }else{
        print("초단위: hhmmss to seconds")
    }
    
    return resultValue
    
}
hourInSeconds(type: "초단위", num: 11320)

// print( ) : 디버깅용




