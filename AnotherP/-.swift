/////////////////////////////////////////////
//홀수 짝수
var number = 1

if( number % 2 == 0 ){
    print("짝수")
}else{
    print("홀수")
}

/////////////////////////////////////////////
//절대값 구하기
var testNum1:Int = 11
var testNum2:Int = -11

////

if(testNum1 < 0){
    testNum1 *= -1
} else if (testNum2 < 0) {
    testNum2 *= -1
}

////

print(testNum1) // 결과 11
print(testNum2) // 결과 11

/////////////////////////////////////////////
//분모가 0인 숫자에 대한 에러처리
var num1:Int = 10
var num2:Int = 0

///
if (num2 == 0) {
    num2 = 1
}
///
var resultNum:Int = num1 / num2
print(resultNum)
/////////////////////////////////////////////
//뻴셈이 항상 양수가 되도록 변경
var minusNum1:Int = 3
var minusNum2:Int = 4

////
if(minusNum2 > minusNum1){
    var tmp = minusNum2
    minusNum2 = minusNum1
    minusNum1 = tmp
}
////
print(minusNum1-minusNum2)
/////////////////////////////////////////////