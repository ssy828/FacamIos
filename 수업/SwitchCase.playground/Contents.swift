//
//  Grade.swift
//  getGrade
//
//  Created by SONGYEE SHIN on 2017. 9. 18..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation


func getGrade(withPoint point: Int) -> String {
    
    var grade:String = "F"
    switch point {
    case 95...100:
        grade = "A+"
    case 90..<95:
        grade = "A"
    case 85..<90:
        grade = "B+"
    case 80..<85:
        grade = "B"
    default:
        grade = "F"
    }
    return grade
}


func getGrade2(withPoint point: Double) -> String {
    // point : Double 가능!
    var grade:String = "F"
    switch point {
    case let p where (p <= 100 && p > 90):
        // 위의 경우 소수점까지 다 포함 가능!
        grade = "A+"
    case 90..<95:
        grade = "A"
    case 85..<90:
        grade = "B+"
    case 80..<85:
        grade = "B"
    default:
        grade = "F"
    }
    return grade
}