
import UIKit
// 에러처리구문예제
/*
     1. Error프로토콜 채택: ErrorType 만들기
         -> Enum을 활용해서
     2. 에러 전달 메소드 만들기
         -> Return type앞에 throws 키워드 작성
     3. 에러상황일때 에러 발생
         1) throw 키워드를 사용 에러 반환
         2) do~catch를 통한 에러처리
         3) Converting to Optional Value
 
 */
class ErrorViewController: UIViewController {
   
    enum NumberCheckType: Error {
        case negativeNumber
        case biggerNum
        case nonNum
        case noData
    }
    
    func isSmallNum(baseNum: Int, targetNum:Int?) throws-> Int
    {
        guard let compareNum = targetNum else{
            throw NumberCheckType.noData
        }
        if baseNum < 0 || compareNum < 0
        {
            throw NumberCheckType.negativeNumber
        }
        
        if compareNum > baseNum
        {
            throw NumberCheckType.biggerNum
        }
        
        return compareNum
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // try -> 옵셔널로 바꾼 것 : 옵셔널체이닝과 다름
        let num = try? isSmallNum(baseNum: 5, targetNum: 10)
        
        
        // 일반 try : do~catch문 사용
        do {
            let result = try isSmallNum(baseNum: 5, targetNum: -3)
            print(result)
        } catch NumberCheckType.noData {
            print("taget에 값을 넣어주세요")
        } catch NumberCheckType.negativeNumber{
            print("양수 입력 부탁")
        } catch NumberCheckType.biggerNum{
            print("타켓 숫자를 더 적게 입력")
        }catch{ // 꼭 마지막 catch문은 써줄 것!! 무슨일이 있어도
            print("다른 에러가 있을까?")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
