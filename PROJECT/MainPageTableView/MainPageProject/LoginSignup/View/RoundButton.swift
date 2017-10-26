
import UIKit
// 각각 버튼에 적용시키기 위한 디자인 코드
class RoundButton: UIButton {
   
    
    // 스토리보드 코드 : NSCoder
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 20
        self.layer.borderColor = self.tintColor.cgColor
        self.layer.borderWidth = 1
    }

}
