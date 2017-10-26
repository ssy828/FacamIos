//
//  ButtonConvertViewController.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 26..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ButtonConvertViewController: UIViewController {

    // MARK: - Property
    var tagArray: [Int] = []
    var buttonArray: [UIButton] = []// 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // MARK: - 버튼의 줄 프레임 바꾸기
        let widthF = (view.frame.size.width-20)/3
        let heightF = ((view.frame.size.height-40)/2)/3 // 전체 세로에서 반을 나눈 것을 삼등분 할 것이므로
        // y좌표를 위에서 20 밑에서 20으로 떨어뜨려놓기위해서
        // 1번째
        var btnFrame = CGRect(x:10,y:20,width:widthF,height: heightF) // width와 heigth는 고정이고
        // x좌표와 y좌표만 바뀌면 됨!
        buttonAddView(frame: btnFrame, tag: 1)
        // 2번째 버튼
        btnFrame = CGRect(x: 10+widthF, y: 20, width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 2)
        // 3번째 버튼
        btnFrame = CGRect(x: 10+(widthF*2), y: 20, width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 3)
        
        // 4번째버튼
        btnFrame = CGRect(x: 10, y: 20+heightF, width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 4)
        
        // 5번째버튼
        btnFrame = CGRect(x: 10+widthF, y: 20+heightF, width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 5)
        
        // 6번째버튼
        btnFrame = CGRect(x: 10+(widthF*2), y: 20+heightF, width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 6)
        
        // 7번째버튼
        btnFrame = CGRect(x: 10, y: 20+(heightF*2), width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 7)
        
        // 8번째버튼
        btnFrame = CGRect(x: 10+widthF, y: 20+(heightF*2), width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 8)
        
        // 9번째버튼
        btnFrame = CGRect(x: 10+(widthF*2), y: 20+(heightF*2), width: widthF, height: heightF)
        // btnFrame 변수에 x좌표 y좌표만 마꾸면 되므로
        buttonAddView(frame: btnFrame, tag: 9)
        
        
        
    }
  
    // MARK: - 버튼을 뷰에 추가하는 방식
    //  *** 반복적으로 묶이는 것을 메소드 안에 넣고 바껴야하는 것을 파라미터로 넣기!!
    
    // MARK: - 클매님 도움을 받아서 조금 바꿔서 해본 것!
    func buttonAddView(frame: CGRect, tag: Int)  { // 파라미터를 이용해서 서로 메소드를 부르면 됨
        // return값이 없는 이유: 버튼을 추가하는 곳에만 쓰이므로 굳이 값을 반환할 필요가 없다!!!
        let btn: UIButton = UIButton(type:.system) // .system으로 해야 내가 값을 만들수 있음 // 이건 UIBUttonType
        btn.frame = frame// frame(프로퍼티): frame 파라미터 -> CGRect사용
        // 반복이 될 것은 고정을 시킬 것 -> frame:CGRect(x:x,y:y)
        // 도형함수파트 : 제곱함수를 도형함수에 접목시키기 위해 파라미터를 이용한 것과 같음
        view.addSubview(btn)    //view에 버튼 추가
        btn.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        btn.tag = tag //  버튼 인스턴스가 태그 프로퍼티에 파라미터 tag값을 할당!
        btn.setTitle("Button\(tag)", for: UIControlState.selected)
        // 버튼위에 글씨 추가
        btn.setTitleColor(.black, for: UIControlState.selected)
        btn.addTarget(self, action: #selector(btnConvertColor), for: UIControlEvents.touchUpInside)
        btn.layer.cornerRadius = 20
        
        switch btn.tag {
        case 1,3,5,7,9:
            buttonArray.append(btn)
        default:
            break
        }
        // self : ButtonConvertViewController의 인스턴스가 하는 것 // UIControlEvents -> 클래스
        // selector: 메소드를  for: 내가 버튼을 클릭했을 때 실행하겠다
    }
    
    @objc func btnConvertColor(_ sender: UIButton) {
       // tagArray = [sender.tag] // 미리 만든 태그 배열에  누른 버튼 태그를 넣기!
        sender.isSelected = !sender.isSelected // sender.isSelcted = true
        // ->
        
        switch sender.tag {
        case 1,3,5,7,9:
            if sender.isSelected {
                for button in buttonArray {
                    button.isSelected = true
                }
            } else {
                for button in buttonArray {
                    button.isSelected = false
                }
            }
        default:
            break
        }
        
//        if sender.isSelected {  // == true일 경우 생략
//            // 버튼이 눌렀을 경우 다시 선택을 없애야 하므로
//    
//            sender.isSelected = false
//            sender.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
//            
//        }else{
//            sender.isSelected = true
//            sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        }
    }
    
    
    // 반복 되는 것을 더 줄이는 방식: 어차피 width랑 height는 같으므로 고정시켜버리고
    // x,y 값만 바꾼다.
    //    func buttonAddView(x:CGFloat,y:CGFloat, tag: Int)  { // 파라미터를 이용해서 서로 메소드를 부르면 됨
    //        // return값이 없는 이유: 버튼을 추가하는 곳에만 쓰이므로 굳이 값을 반환할 필요가 없다.
    //        let allWidth = (view.frame.size.width-20)/3
    //        let allHeight = ((view.frame.size.height-20)/2)/3
    //        let btn: UIButton = UIButton(frame:CGRect(x: x, y: y, width: allWidth, height: allHeight)) // frame(프로퍼티): frame 파라미터 -> CGRect사용
    //        // 반복이 될 것은 고정을 시킬 것 -> frame:CGRect(x:x,y:y)
    //        // 도형함수파트 : 제곱함수를 도형함수에 접목시키기 위해 파라미터를 이용한 것과 같음
    //        view.addSubview(btn)    //view에 버튼 추가
    //        btn.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    //        btn.tag = tag //  버튼 인스턴스가 태그 프로퍼티에 파라미터 tag값을 할당!
    //        btn.addTarget(self, action: #selector(btnConvertColor), for: UIControlEvents.touchUpInside)
    //        // self : ButtonConvertViewController의 인스턴스가 하는 것 // UIControlEvents -> 클래스
    //        // selector: 메소드를  for: 내가 버튼을 클릭했을 때 실행하겠다
    //    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
