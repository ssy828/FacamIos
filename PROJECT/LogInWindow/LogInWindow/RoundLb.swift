

import UIKit
@IBDesignable
class RoundLb: UILabel {
    @IBInspectable var radius: CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = radius
        }
    }
}
