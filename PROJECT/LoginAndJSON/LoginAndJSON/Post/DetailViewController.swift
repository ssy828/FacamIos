//
//  DetailViewController.swift
//  LoginAndJSON


import UIKit
// 디테일

protocol DetailViewControllerDelegate: class {
    
    func didFinishPost(_ viewcontroller: DetailViewController)
}


class DetailViewController: UIViewController {

    var network = NetworkManager.one
    let picker = UIImagePickerController()
    weak var delegate: DetailViewControllerDelegate?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLB: UITextField!
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
    
    // MARK: 사진 저장후 메소드
    @IBAction func saveAll(_ sender: Any)
    {
        guard let title = titleLB.text, !title.isEmpty else { return }
        
        network.post(
            title: title,
            content: textView.text,
            image: imageView.image,
            completion: { isSuccess in
                if isSuccess {
                    self.delegate?.didFinishPost(self)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        )
    }
    
    
    // MARK: 사진 바뀌는 메소드
    @IBAction func addPhoto(_ sender: Any)
    {
        let alertController = Alert.showAlert(title: "사진앨범", msg: "사진앨범", actionStyle: UIAlertActionStyle.default, cancelAction: false) { [weak self] _ in
            guard let `self` = self else {return}
            self.openLibrary()
            
        }
        self.present(alertController, animated: false, completion: nil)
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
