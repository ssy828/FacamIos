

import Foundation
let name = ["kpp","asdf","av","sdf"]

class DataCenter {
    
    //
    static var maincenter: DataCenter = DataCenter()
    
    //
    var nameList:[String] = []
    
    private init() //private init 은 외부에서 접근제한
    {
        loadNameList()
    }
    
    func loadNameList() {
        //plist에서 데이터 불러와서 nameList에 할당
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" + "userName.plist"
        
        if let list =  NSArray(contentsOfFile:path) as? [String]
        {
            nameList = list
        }
        
    }
    
    func addName(_ name: String) {
        nameList.append(name)

    }
    
    func saveNameList() {
        //nameList 에 있는 데이터를 plist에 저장
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/" + "userName.plist"
        
        NSArray(array:nameList).write(toFile: path, atomically: true)
        
        
    }
    
}
