//
//  MainViewController.swift
//  MainPageProject
//
//  Created by youngmin joo on 2017. 10. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var mainTableVIew: UITableView!
    
    var dataManager:ProfileDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager = ProfileDataManager()
//
//        // 번들에서 가져온 파일의 경로를 String으로 바꾸고 baspath에 할당
//        guard let basepath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist") else{return}
//
//       // 이걸 배열로 만들어줌
//        guard let list = NSArray(contentsOfFile: basepath) as? [Any] else{return}
//
//        print(list)
//
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -섹션별 row 개수 리턴 코드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager?.profilesData.count ?? 0
    }

     // MARK: -cell 관리(구현)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 재사용하기위해 스토리보드에 "cell"입력
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileTableViewCell
        // 각 Row마다 데이터가 표시될 템플릿 아까만든 ProfileTableViewCell이고, ProfileTableViewCell class로 다운 캐스팅하여 프로퍼티에 접근
        let profileModel:ProfileModel = dataManager!.profilesData[indexPath.row]
        // 각 프로퍼티에 들어갈 데이터를 적용함
        cell.data = profileModel
        // 셀에 데이터를 넣은 것
        // 셀한테 데이터를 주고 다 표시해
        // 뷰컨트롤러: 데이터가 필요할때만 달라고 하는 것
        cell.textLabel?.text = profileModel.nickname
        cell.detailTextLabel?.text = profileModel.statusDesc
        cell.imageView?.image = UIImage(named:profileModel.profileImageName)
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? ProfileTableViewCell else {return}
        guard let nextVC = segue.destination as? DetailViewController else {return}
        nextVC.data = cell.data
    }
    // 세그: 객체를 누른 sender:
    // UI와 데이터가 연결 안 되어있으므로
    // 프로파일 데이터 인덱스패스를 통해서 알아야하므로
    // 셀 자체가 데이터를 갖고있는 것
    // 클릭된 아이가 다음 뷰컨틀로러에게 보내주는것 

}
