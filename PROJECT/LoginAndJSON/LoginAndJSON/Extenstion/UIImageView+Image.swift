
import Foundation
import UIKit
import Alamofire

extension UIImageView {
    
    func setImageFromServer(at urlString: String) {
        
        let url = URL(string: urlString)!
        Alamofire
            .request(url)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self.image = image
                case .failure(let error):
                    print(error)
                    return
                }
            }
    }
}
