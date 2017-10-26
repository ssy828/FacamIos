
import UIKit

class InputViewController: UIViewController {
    @IBOutlet var tf:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func savehandlerBtn(_ sender: UIButton) {
        let name = tf.text ?? ""
     
        DataCenter.maincenter.addName(name)
        
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    

   

}
