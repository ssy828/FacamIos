//
//  Student.swift
//  MyCalculator
//
//  Created by SONGYEE SHIN on 2017. 9. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class Student {
    var name: String
    var studentID: Int
    
    var subjects: [Subject] = [ ]
    var totalGrade: String = "F"
    var totalScore: Int = 0
    var totalGradePoint: Double = 0.0
    
    init(name: String, id: Int) {
        self.name = name
        studentID = id
        
    }
    
    func setSubjects(subjects:[Subject])
    {
        self.subjects = subjects
        
    }
    
    func addSubject(subjects:Subject)
    {
        self.subjects.append(subjects)
    
    }
    
}
