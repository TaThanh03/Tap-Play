import UIKit

class MusicViewController: UIViewController {
    private let v = MusicView(frame: UIScreen.main.bounds)
    
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
        self.view = v
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        v.displayInSize(size: size)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

