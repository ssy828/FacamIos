
import Foundation
// MARK: -일반
//struct Stack
//{
//    // Struct는
//    // 저장프로퍼티를 사용할 경우: mutating을 붙여준다
//    private var temp: [Int] = []
//
//    mutating func push(_ data: Int)
//    {
//        temp.append(data)
//    }
//    mutating func pop() -> Int
//    {
//       return temp.removeLast()
//        // 마지막 값을 지우고 마지막 값을 반환
//    }
//}

// MARK: - Generic
struct Stack<j>
{
    private var temp: [j] = []
    mutating func  push(_ data: j)
    {
        temp.append(data)
    }
    
    mutating func pop() -> j
    {
        return temp.removeLast()
    }
}
