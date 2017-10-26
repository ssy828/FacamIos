//
//  PlayList.swift
//  TestDataModeling
//
//  Created by SONGYEE SHIN on 2017. 10. 17..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

struct PlayList
{
    var id: String // 플레이리스트 아이디
    var userId: String // 유저 플레이 리스트 아이디
    var title: String // 플레이리스트 이름
    var mainImgURL: String? // 플레이리스트이미지
    var thumbImgURL: String // 썸네일
    var songCount: Int // 플레이리스트에 포함된 곡 수
    var isPremium: String // Y/N : String으로 먼저 받고 bool로 처리
    var monthly: Int // 월별 모아듣기 리스트의 경우 연월 정보
    
//    init?(data: [String:Any])
//    {
//        guard let id = data["id"] as? String else{return nil}
//        self.id = id
//        guard let userId = data["userId"] as? String else{return nil}
//        self.userId = userId
//        guard let title = data["title"] as? String else{return nil}
//        self.title = title
//        if let mainImgURL = data["mainImgaURL"] as? String {
//            self.mainImgURL = mainImgURL
//        }
//
//        guard let thumbImgURL = data["thumImgURL"] as? String else {return nil}
//        self.thumbImgURL = thumbImgURL
//
//        guard let
//
//
//    }
}
