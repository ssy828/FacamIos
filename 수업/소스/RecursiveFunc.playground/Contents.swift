//: Playground - noun: a place where people can play

import UIKit

// 재귀 함수

func test (num: Int) -> Int{
    
    var total: Int = num
    
    if num == 1  // if문 이게 end조건
    {
        return 1
    }
    
    total *= test(num: num-1)
    
    return total
}
// print(test(num:3))

// 함수 내부에서 자기 자신을 다시 부름
// 함수 호출시 그 함수 있는 곳으로 되돌아감


// 피보나치 수열
func pibonachi(num: Int) -> Int
{
    //var total: Int = num
    
    if num == 1 || num == 2
    {
        return 1
    }
    
//    total = (total-1) + pibonachi(num: num-1)
    
    return pibonachi(num: num-1) + pibonachi(num: num-2)
// return (num == 1 || num == 2) ? 1: pibonachi(num: num-1) + pibonachi(num: num-2)

//    return total
}

pibonachi(num: 4)

