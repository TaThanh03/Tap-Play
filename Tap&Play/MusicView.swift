//
//  MusicView.swift
//  Tap&Play
//
//  Created by TA Trung Thanh on 16/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class MusicView: UIView {
    
    private let label_status = UILabel()
    private let label_songTitle = UILabel()
    private let label_songNumber = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        //gestures
        let tapDetect = UITapGestureRecognizer(target: self, action: #selector(tapDetection(sender:)))
        tapDetect.numberOfTapsRequired = 2
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetection(sender:)))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetection(sender:)))
        swipeRight.direction = .right
        self.addGestureRecognizer(tapDetect)
        self.addGestureRecognizer(swipeLeft)
        self.addGestureRecognizer(swipeRight)
        
        
        label_status.text = ""
        
        
        
        
        
        
        self.displayInSize(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapDetection(sender: UITapGestureRecognizer){
        if sender.state == .ended {
            print("double tap")
        }
    }
    
    @objc func swipeDetection(sender: UISwipeGestureRecognizer){
        if sender.direction == .left {
            print("swipe left")
        }
        if sender.direction == .right {
            print("swipe right")
        }
    }
    
    func displayInSize(size: CGSize) {
        
    }
}
