//: Playground - noun: a place where people can play

// 반환함수가 없는 경우: 그때만 1번 쓰고 버리는 경우
func addPrintInt(num1: Int, num2: Int) {
    
    var resultValue: Int = 0
    resultValue = num1 + num2
    print(resultValue)
}
// 위: 구현만 한 것!
// 아래: 함수를 출력하는 것

// print( )함수를 이미 함수 안에 처리했으므로 :
// print()함수는 그냥 우리가 확인하기위해서 사용하는 것
// 출력시: print함수없이 함수이름만 쓰면 출력됨 
// print(addPrintInt(num1: a, num2: b))
addPrintInt(num1: 3, num2: 4)

func addPrintString(str1: String, str2: String) {
    
    var resultValue: String = ""
    resultValue = str1 + str2
    print(resultValue)
    
}

addPrintString(str1: "가", str2: "라")

func addPrintDouble(doubleNum1: Double, doubleNum2: Double) {
    var resultValue: Double = 0.0
    resultValue = doubleNum1 + doubleNum2
    print(resultValue)
}
addPrintDouble(doubleNum1: 4.65, doubleNum2: 7.29)

// 반환하는 함수 만들기 : 여러번 함수를 사용하기 위해 쓰는 것

func addInt(_ numInt: Int, numI: Int) -> Int{
    // 언더바를 쓰면 출력할때 매개변수이름 안써도 됨.
    var result: Int = 0
    result = numInt + numI
    return result
    
}
print(addInt( 5, numI: 6))

func addDouble(numD: Double, numDouble: Double) -> Double {
    var resultV: Double = 0.0
    resultV = numD + numDouble
    return resultV
}

var a = addDouble(numD: 4.5, numDouble: 6.71)
print(a)

func addString(str1: String, str2: String) -> String {
    var resultValue: String = ""
    resultValue = str1 + str2
    return resultValue
}

print(addString(str1: "흠", str2: "흠"))

// 두개값을 받아 큰수를 반환하는 함수

func largeNumber(num1: Int , num2: Int ) -> Int {
    var resultValue: Int = 0
    
    if num1 >= num2 {
        resultValue = num1
    }else if num1 < num2 {
        resultValue = num2
    }
    // else 바로 조건을 쓸 수 없으며 
    // else if를 써야 조건을 쓸 수 있음
    
    return resultValue
    
}

// 한개의 값을 받아 양수인지 음수인지 판별하여 Bool값을 리턴하는 함수




