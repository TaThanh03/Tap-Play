//
//  MusicView.swift
//  Tap&Play
//
//  Created by TA Trung Thanh on 16/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit
import MediaPlayer

class MusicView: UIView, MPMediaPickerControllerDelegate {
    
    private let myMediaPlayer = MPMusicPlayerController.applicationMusicPlayer
    private let myMusicPicker = MPMediaPickerController(mediaTypes: MPMediaType.music)
    private let myMusicQuery = MPMediaQuery.songs()
    
    private let label_status = UILabel()
    private let label_songTitle = UILabel()
    private let label_songNumber = UILabel()
    private var switch_play = false
    
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
        //music
        myMediaPlayer.setQueue(with: myMusicQuery)
        myMediaPlayer.repeatMode = .all
        
        label_status.text = ""
        label_status.textColor = UIColor.white
        
        self.displayInSize(size: UIScreen.main.bounds.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapDetection(sender: UITapGestureRecognizer){
        if sender.state == .ended {
            print("double tap")
            if switch_play == false {
                myMediaPlayer.play()
                switch_play = true
            } else {
                myMediaPlayer.pause()
                switch_play = false
            }
        }
    }
    @objc func swipeDetection(sender: UISwipeGestureRecognizer){
        if sender.direction == .left {
            print("swipe left")
            myMediaPlayer.skipToNextItem()
        }
        if sender.direction == .right {
            print("swipe right")
            myMediaPlayer.skipToPreviousItem()
        }
    }
    
    func displayInSize(size: CGSize) {
        
    }
    
}
