//
//  DataModel.swift
//  TestJSON
//


import Foundation

// 서버에서 받아온 정보에 맞게 만든는 것
struct DataModel
{
    let tempMax: Double
    let tempMin: Double
    
    init?(json: [String: Any]) {
        // 키값은 똑같으므로 연달아 사용
        // init에 옵셔널 일 수도 있어서 nil을 써줘야함
        guard let main = json["main"] as? [String: Any],
            let tempMax = main["temp_max"] as? Double,
            let tempMin = main["temp_min"] as? Double else { return nil }
        self.tempMax = tempMax
        self.tempMin = tempMin
    }
    
}
