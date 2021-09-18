//
//  AudioPlayerDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/17.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

//import AVFoundation
import AVKit


class AudioPlayerDemoController: UIViewController {

    lazy var playerVC: AVPlayerViewController = {
        let vc = AVPlayerViewController()
        
        return vc
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "AudioPlayer"
        navigationItem.rightBarButtonItems = ["Next"].map({
            return UIBarButtonItem(obj: $0) { item in
                DDLog(item.title)
//            let vc = UIViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
//                self.playVideo(<#T##urlString: String##String#>)
            }
        })

    }
    

    func playVideo(_ urlString: String) {
        guard let videoUrl = URL(string: urlString) else {
            return }
        //步骤1：获取视频路径
//        var webVideoPath: String = "http://api.junqingguanchashi.net/yunpan/bd/c.php?vid=/junqing/1213.mp4"
//        var videoUrl: NSURL = NSURL(string: webVideoPath)
        //步骤2：创建AVPlayer
        let avPlayer = AVPlayer(url: videoUrl)
        //步骤3：使用AVPlayer创建AVPlayerViewController，并跳转播放界面
        let playerVC = AVPlayerViewController()
        playerVC.player = avPlayer
        self.present(playerVC, animated: true, completion: nil)
    }

}
