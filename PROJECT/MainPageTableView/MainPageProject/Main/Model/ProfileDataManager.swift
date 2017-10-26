//
//  ProfileDataManager.swift
//  MainPageProject
//
//  Created by youngmin joo on 2017. 10. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import Foundation
class ProfileDataManager
{
    
    private var profiles:[ProfileModel] = []
    
    // 연산프로퍼티 : 어디선가 프로파일매니저 인스턴스가
    // 프로파일 프로퍼티에 담긴 데이터를 반환해주는 것
    var profilesData:[ProfileModel]{ // 프로파일 데이터: 프로파일모델타입의 묶음(배열)
//        get {
//            return profiles
//        }
        // 위의 코드와 같음
        return profiles // get만 사용: get{} 생략가능!
    }

    init() {
        loadData() //프로파일데이터매니저 인스턴스가 생성될 때(초기화되면서)호출
    }
    
    func loadData()
    {
        
        //번들에서 데이터 가져와서 profiles만들기
        if let filePath = Bundle.main.path(forResource: "FreindInfo", ofType: "plist"),
            let dataList = NSArray(contentsOfFile:filePath) as? [Any]
        {
            for data in dataList
            {
                if let realData = data as? [String:String],
                    let dataModel = ProfileModel(data: realData)
                {
                    profiles.append(dataModel)
                }
            }
        }
        
    }
}







