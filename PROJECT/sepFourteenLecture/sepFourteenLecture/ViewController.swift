//
//  ViewController.swift
//  sepFourteenLecture
//
//  Created by SONGYEE SHIN on 2017. 9. 15..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                var _: Subject = Subject(name: <#String#>)
               // var subject2:Subject = Subject.init(name: "shin")
        
                var pikachu: PocketMon = PocketMon(name: "피카츄", tech: "백만볼트", color: "노랑")
                var huskigidane: PocketMon = PocketMon(name: "이상해씨", tech: "덩쿨채찍", color: "초록")
                var rizamon: PocketMon = PocketMon(name: "리자몽", tech: "지구돌리기", color: "주황")
        
                let cal = SubjectCaluation()
        
                let math = Subject(name: "수학")
                math.setScore(score: 86)
        
                let eng = Subject(name: "영어")
                eng.setScore(score: 93)
        
                let s1 = Student(name: "송이", id: 1134686)
                s1.addSubject(subjects: math)
                s1.addSubject(subjects: eng)
                // s1. setSubjects(subjects:[math, eng])
        
                cal.calculation(student: s1)
                print(s1.totalScore)
                print(s1.totalGradePoint)
                /*
                    print 함수를 calculation에 만들어 놓으면
                    print함수를 여기서 입력하지 않아도됨
                */
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

