
import Foundation

struct UserService
{
    var model: Users?
    
    //getter만 있음
    var documentDirectory : URL{
        return FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
    }
    
    
    // 타입프로퍼티: 호출할때 불리게 되는데
    // 하나의 인스턴스만 가져옴 = 같은 인스턴스 = 모델이 같다!
    // 미리 호출해오기 전에 미리 메모리에서 확보하고
    // 1번만 초기화됨! -> 앱이 죽을때까지 메모리 사용하므로 : 되도록 줄여라!!
    static var sharedInstance: UserService = UserService() // 싱글턴
    
    init()
    {
            // Plist에서 정보를 가져와 model에 넣는다.
            loadData()
    }
    // 인스턴스메소드
    mutating func loadData()
    {
        
        // default : 싱글톤
//        let dataURL = FileManager.default.urls(for:
//            FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
        let dataURL = documentDirectory.appendingPathComponent("UserData.plst")
        // documentDirectory: 사용자가 저장한 정보 등등
        
        let dataStringPath = dataURL.path // String 타입
        // 파일경로를 할당!
        print(dataStringPath)
        
        // 처음에는 파일이 없으므로 참이 됨!
        if !FileManager.default.fileExists(atPath: dataStringPath)
        {
            guard let plistURL = Bundle.main.url(forResource: "UserData", withExtension: "plist") else {return}
            try! FileManager.default.copyItem(at: plistURL, to: dataURL)
        }
        
        // 호출한 url의 값을 변경하고 할당
//        self.model = NSDictionary(contentsOf: dataURL)
        guard let dataDictionary = NSDictionary(contentsOf: dataURL) as? [String:Any] else {return}
        self.model = Users(dic:dataDictionary)
    }
    // 파일이 있는지 없는지 확인
    func validateUserInfo(username: String, pwd: String) -> Bool
    {
        if let model = self.model{
            for user in model.users{
                if user.username == username && user.pwd == pwd {
                    return true
                }
            }
        }
        return false
    }
    
}
