import UIKit
import MediaPlayer

class MusicViewController: UIViewController , MPMediaPickerControllerDelegate{
    
    private let myMediaPlayer = MPMusicPlayerController.applicationMusicPlayer
    private let myMusicPicker = MPMediaPickerController(mediaTypes: MPMediaType.music)
    private let myMusicQuery = MPMediaQuery.songs()
    
    private let label_status = UILabel()
    private let label_songTitle = UILabel()
    private let label_songNumber = UILabel()
    private var switch_play = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
        let icon = UIImage(named: "tete")
        let tbi = UITabBarItem(title: "music", image: icon, tag: 2)
        self.tabBarItem = tbi
        self.title = "music" //used by the navigation controller
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view = UIView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = UIColor.black//gestures
        let tapDetect = UITapGestureRecognizer(target: self, action: #selector(tapDetection(sender:)))
        tapDetect.numberOfTapsRequired = 1
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetection(sender:)))
        swipeLeft.direction = .left
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetection(sender:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(tapDetect)
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
        //music
        myMediaPlayer.setQueue(with: myMusicQuery)
        
        label_status.text = "bla bla"
        label_status.textColor = UIColor.white
        //label_status.textAlignment = .center
        self.view.addSubview(label_status)
        
        self.displayInSize(size: UIScreen.main.bounds.size)
    }
    
    
    func displayInSize(size: CGSize) {
        let top = 100
        label_status.frame = CGRect(x: 50, y: top, width: Int(size.width - 20), height: 30)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func addCell(title: String) {
        if let tbc = self.tabBarController as? MyCustomTabController {
            let inSection = [OneCell(l: title)]
            tbc.content += [inSection]
        }
        if let svc = self.splitViewController as? MyCustomSplitViewController {
            let inSection = [OneCell(l: title)]
            svc.content += [inSection]
        }
        
    }
    
    @objc func tapDetection(sender: UITapGestureRecognizer){
        if sender.state == .ended {
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
            updateInfo()
        }
        if sender.direction == .right {
            print("swipe right")
            myMediaPlayer.skipToPreviousItem()
            updateInfo()
        }
    }
    
    func updateInfo() {
        myMediaPlayer.stop()
        myMediaPlayer.play()
        let trackInfo = myMediaPlayer.nowPlayingItem
        
        let a = trackInfo?.artist
        let t = trackInfo?.title
        label_status.text = "title: \(t ?? "no title") artist: \(a ?? "no artist")"
        addCell(title: t ?? "no title")
    }
}

