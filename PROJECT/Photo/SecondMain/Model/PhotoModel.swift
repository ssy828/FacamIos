//
//  PhotoModel.swift
//  SecondMain
//

import Foundation
import UIKit

// MARK: 사진을 가져옴
struct PhotoModel{
    var title: String
    var imageData: Data
    
    // 데이터를 딕셔너리로 만듦
    var dataDic: [String: Any] {
        return ["name": title, "imageData": imageData]
    }
    
    // 이미지
    var image: UIImage? {
        return UIImage(data: imageData)
    }

    
    // init 2개 중에 1개 불림  -> 필요에 따라
    init(title: String, data: Data) {
        self.title = title
        self.imageData = data
    }
    // 저장한 데이터를 불러올때 쓰일 데이터모델
    init?(dataDic: [String: Any]) {
        guard let name = dataDic["title"] as? String else { return nil }
        self.title = name
        guard let data = dataDic["imageData"] as? Data else { return nil }
        self.imageData = data
        
    }

}



