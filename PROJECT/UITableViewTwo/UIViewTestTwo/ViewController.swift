//
//  ViewController.swift
//  UIViewTestTwo
//
//  Created by SONGYEE SHIN on 2017. 9. 29..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 뷰 만들기
        createView()
        updateLayout()
        makeTableVie()
        
    }
    weak var subView: UIView! // 메모리 관리차원으로 weak로 만듦
    // UI는 대부분 weak로 만듦
    weak var lb: UILabel!
    weak var scroll:UIScrollView!
    
    // 뷰를 만드는 것을 클로저에 위임해서 클로저에서 인스턴스를 만든행위하고
    // 뷰디드로드에 추가하는 행위
    // 클로저에서 인스턴스 생성  -> 이런 방식이 스위프트에 많이 사용함
//    let subView2: UIView = {
//        // UIView
//        let subView2: UIView = UIView()
//        // 속성
//
//        subView.backgroundColor = UIColor(red: 122/255, green: 0.5, blue: 0.5, alpha: 1)
//
//        subView.alpha = 1
//        subView.tag = 10
//
//        return subView
//    }() // 만들자마자 클로저가 바로 실행 ( ) 이거때문에
    
    // 테이블뷰 만들기 -> 테이블뷰 : 컨텐츠뷰 사이즈 정할 필요 없다!
    func makeTableVie()  {
        let tableView: UITableView = UITableView(frame: CGRect(x:0,y:0,width:view.frame.size.width, height:view.frame.size.height), style: .plain)
        // 스타일 지정해주는 게 좋음
       
        // 데이터 소스 : 데이터에 관한 소스를 달라고 하는 것
        tableView.dataSource = self // 꼭필요함!
        view.addSubview(tableView)
        
        
    }
//    // 섹션읙 개수
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//    }
    
    // 섹션당 row개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        // 테이블 뷰에 row를 10개를 만들어야해 -> 테이블 뷰에 반환함
    }
    // 화면에 새로운 셀이 보일때마다 값이 새로 생성됨
    // 셀에 해당하는 UI가 무엇인지 uiView cell타입으로 주는 것
    // 이곳은 데이터만 넣어줄 것
    // 내가 필요한 것만 부를께 그때만 생성해줘!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let section = indexPath.section
        
        let cell = UITableViewCell()
        // 인스턴스 생성 = 힙에 저장되므로 메모리 용량이 계속 차므로 되도록이면 이렇게 쓰지 말것
        
        // 재사용하면 됨
        // 밑으로 내리면 끝날때 다시 밑에서 다시 추가됨
        
        return cell
    }
    
    // 테이블 뷰의 가로 세로 크기를 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    
    // 뷰를 만들고 추가하는 역할
    func createView()
    {
//         closer()
//
//        view.addSubview(subView2)
        
        // UIView
        let subView: UIView = UIView()
        subView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        // 구조체: 데이터로 만들어진 것
        // x,y좌표 넓이 높이 값을 가진 데이터를 할당한다
        // 속성
        subView.backgroundColor = UIColor(red: 122/255, green: 0.5, blue: 0.5, alpha: 1)
        // subView가 아예 투명하므로 내 밑에 있는 애들도 투명해지므로
        // 보통은 백그라운드 알파값을 줄여줌
        subView.alpha = 0.5  // alpha 값을 주는 경우 거의 없음.
        subView.tag = 10
        // 뷰 추가
        self.view.addSubview(subView)
        self.subView = subView
        
        // UIScrollView - 상속
        let scrollView: UIScrollView = UIScrollView()
        scrollView.delegate = self //
        //view.addSubview(scrollView)
        view.addSubview(scrollView)
        self.scroll = scrollView
        
        // UILable - 텍스트, UIImage - 이미지, UIScrollView - 여러개의 뷰를 보여줌
        let lb:UILabel = UILabel() // 단순하게 인스턴스 생성
        lb.text = "안녕?"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.tag = 100
        scroll.addSubview(lb)// 스크롤뷰위에 라벨 버튼 넣기 아래로 갈수록 늦게 올라옴
      //  view.addSubview(lb)
        self.lb = lb // lb 변수를 전체 프로퍼티 lb에 넣어줌
        
        // 버튼 추가
        // custom을 안쓸거면 타입을 변경!
        // type:.system
        let button: UIButton = UIButton(type:.system) // 1. 타입설정은 초기화 수준에서만 가능
        //2. 상태 선택(노멀, 하이라이트...)   // 변경만 하려고 쓰는 경우 쓰면 되고 안써도 그만!
        button.setTitle("buttonName", for: .normal)  // 집어넣어야하는 값이 상태도 값을 가지고 있어야하므로
        button.setTitle("버튼이름", for: .highlighted)
        // 3. addTagetting
        button.addTarget(self, action: #selector(btnAction(_:)), for: UIControlEvents.touchUpInside)
        scroll.addSubview(button)
        // view.addSubview(button)
        // 셀렉터가 실행될 인스턴스를 가르킴
        
        
        // UITableView - UIView 상속
        // UICollectionView
        
        
        // UIController - addTarget
        // UIButton,UISwitch,UISegumentController,UISlider, UItextField // UIController 상속 받음
        
        
    }
    @objc func btnAction(_ sender: UIButton)
    {
        
    }
    
    // 레이아웃에 대한 정리만 하는 것
    func updateLayout()
    {
        let screenSizeWidth: CGFloat = view.frame.size.width
        let viewWidth: Int = 200
        subView?.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewWidth)
        
        scroll.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewWidth)// 프레임 사이즈를 먼저 정하고
        // 컨텐츠 사이즈 지정 -> 현재보고 있는 스크롤뷰 사이즈 대비 몇배라고 생각!
        scroll.contentSize = CGSize(width: scroll.frame.size.width*10, height: scroll.frame.size.height*10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

