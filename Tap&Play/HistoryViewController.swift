//
//  HistoryViewController.swift
//  Tap&Play
//
//  Created by TA Trung Thanh on 15/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        let tbi = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        self.tabBarItem = tbi
        self.title = "history" //used by the navigation controller
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view = UIView(frame: UIScreen.main.bounds)
        self.drawInSize(UIScreen.main.bounds.size)
    }
    
    func drawInSize(_ size:CGSize) {
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.drawInSize(size)
    }
    
}

