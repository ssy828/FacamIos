//
//  DummyData.swift
//  MyLogin
//
//  Created by SONGYEE SHIN on 2017. 10. 16..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

struct DummyData
{
    var image: String// 이미지
    var exhibitionName: String// 전시명
    var exhibitionPlace: String// 전시장소
    var startDate: String// 시작날짜 // 우리가 쓸때는 Date
    var endDate: String// 종료날짜
    
    init?(dataDic: [String: Any]) // 키: String, 값: Any 타입
        // [String: String] -> 다운 캐스팅 안해도 됨
    {
        guard let img = dataDic["image"] as? String else {return nil} // 값이 있으면 다운 캐스팅해서 img에 할당
        self.image = img
        guard let title = dataDic["exhibitionName"] as? String else{return nil}
        self.exhibitionName = title
        guard let place = dataDic["exhibitionPlace"] as? String else{return nil}
        self.exhibitionPlace = place
        guard let startD = dataDic["startDate"] as? String else{return nil}
        self.startDate = startD
        // ---.dateFormat = "yyyy년 MM월 dd" : 들어오는 데이터와 형식이 같아야함!
        // 예) 2015년 7월 21로 들어온 경우!
        guard let endD = dataDic["endDate"] as? String else {return nil}
        self.endDate = endD
    }
    
    
}
