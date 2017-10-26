//
//  ViewController.swift
//  TestDataModeling
//
//  Created by SONGYEE SHIN on 2017. 10. 16..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var titleLB: UILabel!
    
    @IBOutlet weak var artistLB: UILabel!
    
    @IBOutlet weak var genreLB: UILabel!

    @IBOutlet weak var tableView: UITableView!
    
    //  앨범
    var albumModel: AlbumModel?
    
    // 연사프로퍼티
    var sonList: [SongData]?{
        return albumModel?.songList
    }
    func creatAlbumDataToMoel()
    {
        self.albumModel = AlbumModel(dataDic: album)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       creatAlbumDataToMoel()
        titleLB.text = self.albumModel?.albumInfo.albumTitle
        artistLB.text = self.albumModel?.albumInfo.artist
        genreLB.text = self.albumModel?.albumInfo.genre
        
        tableView.dataSource = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // 스토리보드에서 id값을 줘서 끝
        
//        if let test = AlbumModel(dataDic: album)
//        {
//            print(test)
//
//        }
        
// 리소스파일주소 가져오고  데이터 불러오기!
        //        if let path = Bundle.main.path(forResource: "UserPlist", ofType: "plist")
        //        {
        //            if let dic = NSDictionary(contentsOfFile: path) as? [String:String]
        //            {
        //                print(dic)
        //            }
        //        }
        // 순서대로 작동! Bundle을 가져와서 리소스 파일 주소를 가져오고
        // 데이터를 NSDictionary(딕셔너리)를 통해서 파일을 불러와 딕셔너리 형태로 바꾼 것을
        // dic에 할당함
//        if let path = Bundle.main.path(forResource: "UserPlist", ofType: "plist"),
//            let dic = NSDictionary(contentsOfFile: path) as? [String: Any]
//        {
//            let userDataModel = UserModel(dataDic: dic)
//            // UserModel구조체에 userDataModel에 이니셜라이저호출할때 dic을 넣어 실행한 값을 할당!
//
//        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sonList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // 99퍼 있으므로.. 왜??
        cell.textLabel?.text = sonList![indexPath.row].songTitle
        
        return cell
    }

}

