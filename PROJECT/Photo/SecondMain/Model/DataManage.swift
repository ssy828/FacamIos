//
//  DataManage.swift
//  SecondMain

import Foundation

let userdefaultsForkey = "dataList"
class DataManager {
    // 싱글턴 패턴
    static var single = DataManage()
    
    var photoList: [PhotoModel] = []
    
    private init(){ }
    
    // 사진 정보 저장
    private func loadData() {
        guard let list = UserDefaults.standard.value(forKey: userdefaultsForkey) as? [[String: Any]] else { return }
        for photo in list
        {
            if let onePhoto = PhotoModel(dataDic: photo)
            {
                photoList.append(onePhoto)
            }
        }
    }
    
    // 사진 저장
    func addPhoto() {
        // 사진을 저장할 딕셔너리 형태의 배열?
        var list: [Any] = []
        for photo in list
        {
            list.append(photo)
        }
        UserDefaults.standard.set(list, forKey: userdefaultsForkey)
        
    }
    
}
