//: Playground - noun: a place where people can play

func getTotalNum(num1: Int, num2: Int, num3: Int) -> Int {
    return num1 + num2 + num3
}

var totalNum = 0
func getTotalNum(num1: Int)
{
    totalNum += num1
}

// 1000000cm /393701 = 1inch
// 1cm * 2.54 = 1inch
// cm = 1inch /2.54

// 시간 -> 초단위, 초단위 -> 시간
/*
 func timeTosecond(time: Int) -> Int {
 
 var returnV: Int = 0
 var tempTime = time
 var s: Int = tempTime % 100
 tempTime = tempTime/100
 var m: Int = tempTime % 100
 tempTime = tempTime / 100
 var h: Int = tempTime %100
 
 returnV = s + (m*60) + (h*3600)
 
 return returnV
 
 }
 
 func secondToTime(second: Int) -> Int
 {
 
    var tempSeconds: Int = second
    var h: Int = tempSeconds/3600
    tempSeconds = tempSeconds%3600
    var m: Int = tempSeconds/60
    tempSeconds = tempSeconds%60
    var s: Int = tempSeconds
 
    return ((h*10000) + (m*100) + s)
 }
 
 
 */
