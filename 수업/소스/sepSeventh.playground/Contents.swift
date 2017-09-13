//: Playground - noun: a place where people can play

// 9월 7일 목요일 아침 복습시간
// 내부 외부 파라미터 이름 다를 수 있다.
// 외부 파라미터 이름을 무시하고 싶은 경우: 언더바를 사용하면 됨

func add( _ a: Int, _ b: Int ) -> Int {
    return a+b
}
add(3,7)

func makeStar(line: Int ) { // 프린트만 찍을 거라서 반환형 필요 없다.
    // 프로세서 과정에서 마지막에 결과를 보여주고 싶은 경우 
    // 반환형과 return을 써도 됨
    
    for i in 0..<line {
        
        var starStr: String = ""
        // for
        for _ in 0..<line - i { // 변수가 필요없는 경우: 언더바!
            starStr += " "
        }
        // for
        for k in 0..<(i * 2) + 1{ // 최대 별의개수를 생각하는 것
            // 규칙을 생각해야함!
            starStr += "*"
        }
        print(starStr)
    }
    
}

makeStar(line: 7)

