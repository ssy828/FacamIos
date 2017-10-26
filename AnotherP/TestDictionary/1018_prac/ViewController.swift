
import UIKit

class ViewController: UIViewController {

    func getMaxCount(list:[String : Int]) -> Int
    {
        
        var index: Int = 0
        for (_, value) in list {
            if value > index {
                index = value
            }
        }
        return index
    }
    
    func getMaxCount2(list:[String : String]) -> Int
    {
        var score: Int = 0
        for ( _, kkk ) in list {
            if let num = Int(kkk)
            {
                if num > score
                {
                    score = num
                }
            }
            
            //                if Int(kkk)! > score {
            //                    score = Int(kkk)!
            //                }
        }
        return score
    }
    
    //카 이름 리턴
    func getMaxCarName(list:[String : Any]) -> String
    {
        //딕셔너리 벗기기
        
        var maxCarSrore: Int = 0
        var carName: String = ""
        
        for ( _, checkList ) in list {
            if let carList = checkList as? Dictionary<String, Any> {
                if let carScore = carList["score"] as? Int,
                    carScore > maxCarSrore
                {
                    maxCarSrore = carScore
                    carName = carList["name"] as? String ?? "unKnow"
                }
            }
        }
        return carName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list1 = ["car1":50,"car2":70,"car3":90]
        let list2 = ["car1":60,"car2":100,"car3":40]
        //높은 수 출력
       
        print(getMaxCount(list: list2))
        
        
        
        let list1_str = ["car1":"50","car2":"70","car3":"90"]
        let list2_str = ["car1":"30","car2":"10","car3":"50","car3":"오십"]
        //높은 수 출력
        
        print(getMaxCount2(list: list2_str))
        
        
        let list3 = ["car1":["name":"SM3","score":30],"car2":["name":"SM5","score":60],
                     "car3":["name":"SM7","score":10],
                     "car4":["name":"SM9","score":100]]
       
        print(getMaxCarName(list: list3))
        
//        Array<String>  ====> [String]
//        Dictionary<String,Any> ====> [String:Any]
//
    }
    
    
    
    
    
    
    /*
    첫번째는 리스트(딕셔너리)를 받아서 가장 높은 숫자를 리턴하는 것이고
    두번째도 같지만 이번엔 값이 String이구요
    세번째는 복잡한 구조의 딕셔너리에서 가장 높은 수의 카 이름을 반환하는 문제입니다.*/
    
   

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

//
//var i = 1
//var continueValue = true
//var maxCarName: String = ""
//var maxCarValue: Int = 0
//
//while continueValue {
//    if let car = list3["car\(i)"] {
//        if let carScore = car["score"] as? Int, carScore > maxCarValue {
//            maxCarName = car["name"] as! String
//            maxCarValue = carScore
//        }
//        i += 1
//    } else {
//        continueValue = false
//    }
//}
//return maxCarName


//var carList:Array<Any> = []
//for index in list.values {
//    var someList = [String:Any].self
//    someList = index as! [String : Any].Type
//    carList.append(someList)
//}
//
//
//print(carList)

