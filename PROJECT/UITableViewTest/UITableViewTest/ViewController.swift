//
//  ViewController.swift
//  UITableViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 29..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 테이블 뷰 만들기
        let tableView: UITableView = UITableView(frame: view.bounds, style: UITableViewStyle.plain)  // view.bounds 뷰전체 크키
        tableView.dataSource = self // 이 방식도 ok 
        // self: viewController를 표시
        // 테이블뷰가 할 데이터소스 프로퍼티를 뷰컨트롤러가 저장된 데이터를 테이블 뷰의 데이터소스에 할당.
        // ************
        tableView.delegate = self // 이방식도 ok
        // delegate가 있어야지 크기 지정가능
        
        tableView.register(MyCustomCell.self, forCellReuseIdentifier: "MyCustomCell")// 테이블 뷰에 등록 // 둘의 이름 같이
        // UITableViewCell.self -> self 인스턴스 아님! 클래스 자체임!! 클래스이름.self!!
        // 데이터가 없을 경우 클래스가 만들어줄 것이므로!!
        // forCellReuseIdentifier: "cell" == tableView.dequeueReusableCell(withIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        view.addSubview(tableView)
    }
    //    let color: [String] = ["보라","노랑","초록","주황","검정","분홍"]
    let color: [String] = ["1","2","3","4","5","6","7","8"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return 100
        return color.count
    }
    
    // 섹션 2개로 나눔
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            // 그냥 번호만 띄어줌
             let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = color[indexPath.row]
            return cell
        }else{
            // 커스텀셀을 만들어서 이미지를 만듦
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCustomCell", for: indexPath) as! MyCustomCell
            cell.setImage(name: color[indexPath.row])
            return cell
        }
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCustomCell// 다운캐스팅?: UITableView가 "cell"이 MyCustomCell을을 받아야하므로// 위에 선언된 indexPath의 파라미터를 이용함
        // deque: 끄집어 낸다. Reusable 재사용할 셀을 끄집어 낸다.
        // identified에서 없는 경우만 새로 생성 -> 있으면 재사용
        
//        cell.textLabel?.text = "\(indexPath.row)"  // ?: 옵셔널 체이닝
//        cell.textLabel?.text = color[indexPath.row]
//        cell.selectionStyle = .blue //선택시 파란색
        // 셀에 데이터 넣어줌
//        cell.setImage(name: color[indexPath.row])
        
//        return cell
    }
    
    // 크기변경은 테이블뷰 델리게이트
    // row 하나당 셀 하나씩의 높이를 100으로
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        // 이곳에서 MyCustomCell에 있는 이미지뷰의 크기를 바꿔야함 <- 크기변경을 나눠놨기 때문
//        let cell: MyCustomCell = tableView.cellForRow(at: indexPath) as! MyCustomCell // 다운캐스팅!
//        이렇게 하면 무한반복 위의 메소드랑 계속 번갈아가면서 실행되므로 에러!!
//        return 250
        
        // 섹션이 0일 경우 섹션 높이를 100으로 설정
        if indexPath.section == 0{
            return 50
        }else{
            return 250
        }
    }
    
    // 내가 지금 지정한 셀의 위치
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let colorName = color[indexPath.row] // 눌린 셀의 위치 , 텍스트의 위치
    
        // 알러트 창 띄우기
        let alertC: UIAlertController = UIAlertController(title: "테이블 텍스트", message: "\(colorName) 선택함", preferredStyle: UIAlertControllerStyle.alert)
        // 알러트 액션
        let action: UIAlertAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
        alertC.addAction(action)
        present(alertC, animated: true, completion: nil)
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

