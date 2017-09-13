//: Playground - noun: a place where people can play

let list: [String] = ["1","2","3","4","5","6","7","8","9","10"]
func test(num: Int) -> [String] {
    // 리턴 해줄 배열 필요
    var subList:[String] = [ ]
    for numStr in list { // list에 있는 배열을 가져오는
        
        let number: Int = Int(numStr)!// 되도록이면 변수에 저장하는 방식을 쓴다.
        print(number)
        if num < number { // num < Int(numStr)! : 메모리 이득이 되므로
            let a = subList.append(numStr) // numStr은 for문을 벗어날때까지 사용할 수 있으므로
            print(a)
        }
        
    }
    
    return subList
}

test(num: 7)

