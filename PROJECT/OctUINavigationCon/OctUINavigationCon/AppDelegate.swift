//
//  AppDelegate.swift
//  OctUINavigationCon
//
//  Created by SONGYEE SHIN on 2017. 10. 11..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        // 현재: AppDelegate와 UIApplication만 만들어짐
//        // UIApplication 먼저 실행 -> AppDelgate에서 윈도우를 만들겠다.
//
//        // 윈도우 만들기 // 뷰를 만들지 않았으므로 self.view 필요없음
//        // 스크린을 가져와야함!
//        window = UIWindow(frame: UIScreen.main.bounds)
//
//        // 뷰 컨트롤러 인스턴스 만들기
//        // 스토리보드를 통해서 가져와야하므로 스토리보드 생서
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        // 만든 스토리보드의 아이디 값으로 가져오는 것
//        // instantiateViewController(withIdentifier: "ViewController")
//        // 타입이 다르므로 다운캐스팅
//        let rootVC: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        // 윈도우 위에 뷰컨트롤러 올리기
//
//        // 여기서 무조건 설정해야함!
//        // 중간에 변경불가!
//        let naviController: UINavigationController = UINavigationController(rootViewController: rootVC)
//
//        window?.rootViewController = naviController
//        window?.makeKeyAndVisible() // 화면에 보이기 위한 역할
//        // KeyWindow: 메인이 되는 윈도우 윈도우를 여러개 만들 수 있으므로
//        // 루트뷰 위에 메인뷰를 올림
//
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

