//: Playground - noun: a place where people can play



let list: [String] = ["1","2","3","4","5","6","7","8","9","10"]
func test(num: Int) -> [String] {
    // 리턴 해줄 배열 필요
    var subList:[String] = [ ]
    for numStr in list { // list에 있는 배열을 가져옴
    
        let number: Int = Int(numStr)!// 되도록이면 변수에 저장하는 방식을 쓴다.
        if num < number { // num < Int(numStr)! : 메모리 이득이 되므로
            subList.append(numStr) // numStr은 for문을 벗어날때까지 사용할 수 있으므로
            /*
                위의 값: 빈배열subList에 numStr 문자열을 추가하는 것!
            */
        }
    }
    print(subList)
    return subList
}

test(num: 9)



// 중복 숫자 줄이기


