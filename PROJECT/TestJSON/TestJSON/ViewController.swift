//
//  ViewController.swift
//  TestJSON
//
//  Created by SONGYEE SHIN on 2017. 11. 15..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        var request = URLRequest(url: URL(string: "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/post/")!)
        request.httpMethod = "GET"
        request.addValue("Token 173b78e9e0a0553f45fee10f2abf459a118a29a3", forHTTPHeaderField: "Authorization")
        
        // URLSessionTask생성
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
//            print(data)
//            print("----")
//            print(error)
//            print(response)
            // 바로 보내주기
            if let data = data
            {
                do{
                    let dic = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                }catch{
                    
                }
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

