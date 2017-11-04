//
//  customView.swift
//  TestClosure
// 클로저로 변경해 볼 것!
import UIKit

class CustomView: UIView {
    
    var delegate: CustomViewDelegate?
    
    @IBOutlet weak var testLB: UILabel!
    
//    private var btnAction
    
    @IBAction func btnAction(_ sender: Any) {
        delegate?.didSelectedBtn(self)
        
    }
    
    func changeText(differentText: String)
    {
        testLB.text = differentText
    }

}

protocol CustomViewDelegate
{
    func didSelectedBtn(_ customView: CustomView)
}
