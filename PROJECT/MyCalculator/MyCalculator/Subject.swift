//
//  Subject.swift
//  MyCalculator
//
//  Created by SONGYEE SHIN on 2017. 9. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class Subject {
    var name: String = ""
    // var name: String -> 이렇게 씀
    // 아래에서 init을 이용해 초기화되므로 굳이 초기화 하지 않아도 됨.
    
    // 프로퍼티: 멤버변수 -> 인스턴스가 갖는 속성
    
    var gradePoint: Double = 0.0
    var score: Int = 0
    var grade: String = "F"
    var credit: Int  = 1
    ///////////////////////////////
    
    init(name: String) {
        self.name = name 
    }
    
//    init() {
//        print("초기화")
//    }
    
    func setScore(score:Int)
    {
        self.score = score
    }
}
