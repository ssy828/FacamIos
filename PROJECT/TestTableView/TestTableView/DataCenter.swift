//

import Foundation

class DataCenter {
    // 싱글턴 패턴
    static var mainCenter: DataCenter = DataCenter()
    
    // 이름을 집어넣고 관리할 프로퍼티가 필요함!
    var nameList: [String] = []
    
    // 외부에서 접근 금지!
    private init() { }
    
    
    // 파일 가져오는
    func loadNameList() {
        // MARK: -pList에서 데이터 불러와 nameList에 할당
        let basePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        
        let documentPath = basePath[0] + "/Data.plist"
        guard let array = NSArray(contentsOfFile: documentPath) as? [String] else {return} // 해당경로 파일을 배열에 담기
        self.nameList = array
        
    }
    
    // MARK: -데이터 추가
    func addName(_ name: String) {
        // nameList에 추가!
        self.nameList.append(name)
    }
    
    // MARK: -pList에 저장하는 메소드
    func saveNameList() {
        // nameList에 있는 데이터 pList에 저장
        
    }
}
