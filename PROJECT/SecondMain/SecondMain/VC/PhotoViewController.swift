//
//  PhotoViewController.swift
//  SecondMain

import UIKit

class PhotoViewController: UIViewController {

    let picker = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func photoBtn(_ sender: Any)
    {
        
        let alert = UIAlertController(title: "타입", message: "고르세요", preferredStyle: UIAlertControllerStyle.actionSheet)
        let library = UIAlertAction(title: "사진", style: UIAlertActionStyle.default) { (action) in
            self.openLibrary()
        }
        let camera = UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        alert.addAction(library)
        alert.addAction(camera)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
// MARK: 메소드
extension PhotoViewController
{
    
    // 알림창 메소드
    func alert( title: String, handler: ((UIAlertAction) -> Void)? )
    {
        let alert = UIAlertController(title: "타입", message: "고르세요", preferredStyle: UIAlertControllerStyle.actionSheet)
        let action = UIAlertAction(title: title, style: UIAlertActionStyle.default, handler: handler)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    // 라이브러리
    func openLibrary()
    {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    // 카메라
    func openCamera()
    {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }else{
            print("Not available")
        }
        
    }
}
// MARK: UIImagePickerControllerDelegate
extension PhotoViewController: UIImagePickerControllerDelegate
{
    
    // 사진을 선택후 불리는 델리게이트
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            imageView.image = image
            print(info)
        }
        
       dismiss(animated: false, completion: nil)
    }
    // 취소했을때 불리는 델리게이트
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK:
extension PhotoViewController: UINavigationControllerDelegate
{
    
}


