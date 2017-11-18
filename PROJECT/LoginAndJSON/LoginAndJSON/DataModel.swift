//
//  DataModel.swift
//  LoginAndJSON


import Foundation
// 엑스코드 9부터!
struct PostDataprams: Codable
{
    var content: String
    var title: String
    var imgCover: String?
    
    var param: [String: String] {
        return ["title": title , "content": content]
    }
    
    
    // decoding
    // 여기부분을 보고 매칭을 시키는 것
    enum CodingKeys: String,CodingKey
    {
        // 원시값을 안써줘도 괜찮다
        // title과 위의 프로퍼티 변수명과 같아야함!
        case title
        case content
        case imgCover = "img_Cover"
    }
    
//    init?(dataDic: [String: String])
//    {
//        guard let content = dataDic["content"] else { return nil }
//        self.content = content
//        guard let title = dataDic["title"] else { return nil }
//        self.title = title
//        guard let imgCover = dataDic["img_cover"] else { return nil}
//        self.imgCover = imgCover
//    }
}


