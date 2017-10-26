//
import UIKit
// 여기서는 내가 원하는 방식으로 만든 것
// delegate 선언
class SwitchTableViewCell: UITableViewCell {
    
    var delegate: SwitchTableViewCellDelegate?
    // 스위치 데이터
    @IBOutlet var swit: UISwitch!
    var indexPath : IndexPath? // ??
   
    // 연산자프로퍼티
    // 스위치 UI를 컨트롤해주는 것
    // 전에 있던 유아이를 유지하지 않고 데이터를 계속 주면서 유아이는 리셋
    var switchData:Bool = true{
        willSet{
               self.swit.isOn = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func switchChanged(_ sender: UISwitch)
    {
        print(sender.isOn)
        // self: switchTableViewCell 인스턴스
        delegate?.switchTableViewCell(self, didChangedSwitch: sender.isOn)
    }

}

protocol SwitchTableViewCellDelegate
{
    func switchTableViewCell(_ cell: SwitchTableViewCell, didChangedSwitch value: Bool)
}
