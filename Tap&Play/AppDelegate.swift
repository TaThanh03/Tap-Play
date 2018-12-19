//
//  AppDelegate.swift
//  Tap&Play
//
//  Created by TA Trung Thanh on 13/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private func identifyDevice () -> SomeTypes.DeviceType {
        var myDevice : SomeTypes.DeviceType?
        let h = UIScreen.main.bounds.size.height
        let w = UIScreen.main.bounds.size.width
        let i = UIDevice.current.userInterfaceIdiom
        //iPhones
        if i == .phone && ((h < 568 && w == 320) || (w < 568 && h == 320)) {
            myDevice = .iphone35
        } else if i == .phone && ((h == 568 && w == 320) || (w == 568 && h == 320)) {
            myDevice = .iphone40
        } else if i == .phone && ((h == 667 && w == 375) || (w == 667 && h == 375)) {
            myDevice = .iphone47
        } else if i == .phone && ((h == 736 && w == 414) || (w == 736 && h == 414)) {
            myDevice = .iphone55
        } else if i == .phone && ((h == 812 && w == 375) || (w == 812 && h == 375)) {
            myDevice = .iphone58
        } else if i == .phone && ((h == 896 && w == 414) || (w == 896 && h == 414)) {
            myDevice = .iphone6x
            //ipads
        } else if i == .pad && ((h == 1024 && w == 768) || (w == 1024 && h == 768)) {
            myDevice = .ipad97
        } else if i == .pad && ((h == 1112 && w == 834) || (w == 1112 && h == 834)) {
            myDevice = .ipad105
        } else if i == .pad && ((h == 1366 && w == 1024) || (w == 1366 && h == 1024)) {
            myDevice = .ipad127
        }
        return myDevice!
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let myDevice = self.identifyDevice()
        switch myDevice {
        case .iphone35, .iphone40, .iphone47, .iphone55, .iphone58, .iphone6x:
            print("detected iPhone")
            let vc1 = MusicViewController()
            let vc2 = HistoryViewController(style: .plain)
            let nvc1 = UINavigationController(rootViewController: vc1)
            let nvc2 = UINavigationController(rootViewController: vc2)
            let tbc = MyCustomTabController()
            tbc.viewControllers = [nvc1, nvc2]
            window?.rootViewController = tbc
            
        default: //ipad
            print("detected iPad")
            let svc = MyCustomSplitViewController()
            let vc1 = HistoryViewController(style: .plain)
            let vc2 = MusicViewController()
            let nvc1 = UINavigationController(rootViewController: vc1)
            let nvc2 = UINavigationController(rootViewController: vc2)
            svc.viewControllers = [nvc1, nvc2]
            svc.delegate = svc //stupide ?
            svc.preferredDisplayMode = .primaryHidden
            window?.rootViewController = svc
        }
        window?.makeKeyAndVisible()
        return true
    }
}

