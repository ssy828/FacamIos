//
//  newVCViewController.swift
//  TestJSON
//
//  Created by SONGYEE SHIN on 2017. 11. 15..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
import CoreLocation

// 37.516303, 127.020013

class newVC: UIViewController {
    
    @IBOutlet weak var tempMinLB: UILabel!
    @IBOutlet weak var tempMaxLB: UILabel!
    
    //    var weatherData: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
    
    // 서버에서 날씨데이터 가져오는 메소드
    func fetch()
    {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?APPID=b688a589cea12ecdd76bc9df98515684&lat=37.516303&lon=127.020013")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        // weak self: 순환참조로 인해서 weak로 해도 됨!
        session.dataTask(with: request) { [weak self] (data, response, error) in
            //            print(response)
            guard let `self` = self else { return }
            
            // 데이터를 꺼내오기!
            if let data = data
            {
                do{
                    let dic = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    print(dic) // 데이터 안에 무엇이 들었는지 확인
                    // MARK: 데이터 바로 가져오기
    //  self.weatherData = DataModel(json: dic) : 여러군데서 사용할 경우
                    if let weather = DataModel(json: dic){// : 한군데서만 사용할 경우// -273.15 온도
                        //                    print(weather!)
                        // 서버와 앱이 비동기식이므로 지금 이부분에서는 얘가 서버에서 데이터를 받아 왔는지 모르므로
                        DispatchQueue.main.async {
                            let tempMAX = weather.tempMax - 273.15
                            let tempMIN = weather.tempMin - 273.15
                            self.tempMaxLB.text = "\(tempMAX)"
                            self.tempMinLB.text = "\(tempMIN)"
                        }
                        
                    }
                }catch let error{
                    print("\(error.localizedDescription)")
                }
            }
            }.resume()
        
        // 이미 이곳은 데이터가 들어온 상태
    }
    
    
    
}
