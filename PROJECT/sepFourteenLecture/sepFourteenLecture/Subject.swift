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
    
    func changeGrade()
    {
        //        if score > 0 && score<=100 {
        //            if score >= 95 {
        //                grade = "A+"
        //            }else if score >= 90 {
        //                grade = "A"
        //            }else if score >= 85 {
        //                grade = "B+"
        //            }else if score >= 80 {
        //                grade = "B"
        //            }else if score >= 75 {
        //                grade = "C+"
        //            }else if score >= 70 {
        //                grade = "C"
        //            }else if score <= 69 {
        //                grade = "D"
        //            }
        //            
        //        }
    }
}
