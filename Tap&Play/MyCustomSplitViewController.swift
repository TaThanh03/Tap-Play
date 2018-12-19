//
//  MyCustomSplitViewController.swift
//  Tap&Play
//
//  Created by TA Trung Thanh on 19/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class MyCustomSplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    var content = [[OneCell]]()
    /*
    func splitViewController(_ svc: UISplitViewController,
                             willShow vc: UIViewController,
                             invalidating barButtonItem: UIBarButtonItem)
    {
        if let detailView = svc.viewControllers.first as? UINavigationController {
            svc.navigationItem.backBarButtonItem = nil
            detailView.topViewController?.navigationItem.leftBarButtonItem = nil
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool
    {
        guard let navigationController = primaryViewController as? UINavigationController,
            let controller = navigationController.topViewController as? ColorsViewController
            else {
                return true
        }
        return controller.collapseDetailViewController
    }*/
}
