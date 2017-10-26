
//import Foundation
//
//class DataCenter
//{
//    static var main: DataCenter = DataCenter()

    // MARK: -불러오기 : 파일 일부분만 필요
//    func loadUserData() -> UserModel?
//    {
//        // path
//        let documentPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/UserPlist.plist"
//
//        // MARK:-쓰기할때: 파일이 꼭 필요함
//        // 파일이 존재하지 않다면
//        if !FileManager.default.fileExists(atPath: documentPath)
//        {
//            // 1. 복사
//            if let bundlePath = Bundle.main.path(forResource: "UserPlist", ofType: "plist")
//            {
//                // 번들 -> 번들의 싱글턴 -> path 메소드 : 파일이름 / 확장자명
//                // String옵셔널이유: 파일이 없을 수도 있으므로
//                do {
//                    // 성공하면 이쪽 실행
//                    try FileManager.default.copyItem(atPath: bundlePath, toPath: documentPath)
//                    // throw : 예외상황
//                } catch {
//                    // 위에서 성공을 못하면 여기서 실행
//                    print("Copy Fail")
//                }
//            }
//            // 2. 만들기
//            // 수정
            // 새로운 딕셔너리를 만든 다음에 그곳에 넣고 만들기
//            var dic:[String:String] = [:]
//            dic.updateValue("wingman", forKey: "user_id")
//            dic.updateValue("1004", forKey: "pwd")
//            dic.updateValue("2017.04.19", forKey: "birthday")
//
//            // 저장
//            let nsDic = NSDictionary(dictionary: dic)
//            nsDic.write(toFile: documentPath, atomically: true)
       // }

        // MARK: -파일 존재함
        // 이곳에서 무조건 파일 존재한다고 봄! catch문 빼고
        // 이곳에서 파일 불러옴
//        if var dic = NSDictionary(contentsOfFile: documentPath) as? [String: Any]
//        {
//            // 수정
//            dic.updateValue("wingman", forKey: "user_id")
//            dic.updateValue("1004", forKey: "pwd")
//            dic.updateValue("2017.04.19", forKey: "birthday")
//            
//            // 저장
//            let nsDic = NSDictionary(dictionary: dic)
//            nsDic.write(toFile: documentPath, atomically: true)
//        }
//    }
//    
//    // MARK: -쓰기
//    func wirteUserData(data: UserModel)
//    {
//        
//    }
//}

