//
//  DetailViewController.swift
//  LoginAndJSON


import UIKit
// 디테일
class DetailViewController: UIViewController {

    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func addPhoto(_ sender: Any)
    {
        let alertController = Alert.showAlert(title: "사진앨범", msg: "사진앨범", actionStyle: UIAlertActionStyle.default, cancelAction: false) {[weak self] _ in
            guard let `self` = self else {return}
            self.openLibrary()
            
        }
        self.present(alertController, animated: false, completion: nil)
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
       
    }
    

    func openLibrary()
    {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
  

}

// MARK: UIPickerViewDelegate
extension DetailViewController: UIImagePickerControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageView.image = image
            print(info)
        }
        dismiss(animated: false, completion: nil)
    }
}
// MARK: UINavigationControllerDelegate
extension DetailViewController : UINavigationControllerDelegate
{
    
}
