//
//  SubjectCalculation.swift
//  MyCalculator
//
//  Created by SONGYEE SHIN on 2017. 9. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class SubjectCaluation {
    
    func calculation(student: Student)
        // 이 학생이 가지고 있는 점수로 평균을 구하고 그 점수로 학점으로 바꿔주는 함수
    {
        // 연산 함수 기능을 여기서 나타내는 전체적으로 보여주는 함수로 사용!
        var totalScore: Int = sumAllSubject(subjects:student.subjects)
        
        // 평균 
        // student.totalGradePoint =
    }
    
    func sumAllSubject(subjects:[Subject]) -> Int {
       
        var totalScore: Int = 0
        for s in subjects
        {  // s: subject의 인스턴스
            totalScore += s.score
        }
        return totalScore
    }
//
//    func subjectAvg(scoreAvg: Double) -> Double {
//        
//        var totalScoreAvg: Double = totalScore.Student.count / 
//        
//    }
}

