//
//  SubjectCalculation.swift
//  MyCalculator
//
//  Created by SONGYEE SHIN on 2017. 9. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class SubjectCaluation {
    
    //    var totalScore: Int = 0
    //    var totalAvg: Double = 0.0
    
    func calculation(student: Student)
        // 이 학생이 가지고 있는 점수로 평균을 구하고 그 점수로 학점으로 바꿔주는 함수
    {
        // 연산 함수 기능을 여기서 나타내는 전체적으로 보여주는 함수로 사용!
        // var totalScore: Int = sumAllSubject(subjects:student.subjects)
        
        // student 매개변수가 Student(클래스데이터타입)을 가지고 있다고 위에 구현
        student.totalScore = sumAllSubject(subjects:student.subjects)
        // totalScore(Student의 클래스에서 프로퍼티)를 사용함.
        // student: 매개변수이면서 인스턴스임
        // sumAllSubject(subjects:student.subjects)
        // student(매개변수가). subjcects(Student클래스에 있는 프로퍼티를 사용하겠다)
        
        // print(student.totalScore)
        
        // 평균
        student.totalGradePoint = subjectAvg(studentTotalAvg: student)
        // print(student.totalGradePoint)
        
        // 강사님 평균 구하기
        /*
         func avgCalculation(student: Student) -> Double
         {
         var totalScore: Int = 0
         var subjects = student.subjects
         
         for subject in subjects
         {
         //1. 과목의 점수를 더한다
         totalScore += subject.score
         }
         
         ////////////
         
         2. 모두 더한 점수를 과목의 수로 나눈다.
         return Double(totalScore / subjects.count)
         
         }
         viewcontroller에서
         s1.avarage  = cal.averageCalculation(student: s1)
         
         */
        
    }
    
    func sumAllSubject(subjects:[Subject]) -> Int {
        
        var totalScore: Int = 0
        for s in subjects
        {  // s: subject의 인스턴스
            totalScore += s.score
        }
        return totalScore
    }
    
    func subjectAvg(studentTotalAvg: Student) -> Double {
        var avg: Double = 0.0
        avg = Double(studentTotalAvg.totalScore / studentTotalAvg.subjects.count)
        return avg
        
    }
}

