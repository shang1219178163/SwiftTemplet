//
//  AudioPlayer.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/13.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
//import AudioToolbox
//import AVFAudio
import AVFoundation

@objc protocol AudioPlayerDelegate: NSObjectProtocol {
    /// 播放状态
    @objc optional func playerStateDidChange(_ player: AudioPlayer)
    /// 获取播放时间
    @objc optional func playerCurrentTimeDidChange(_ player: AudioPlayer)
    /// 播放结束
    @objc optional func playerPlaybackDidEnd(_ player: AudioPlayer)
    /// 播放错误
    @objc optional func player(_ player: AudioPlayer, didFailWithError error: Error?)
}


@objcMembers class AudioPlayer: NSObject {
    enum PlayState {
        case stopped /// 停止播放
        case playing /// 正在播放
        case paused /// 暂停播放
        case failed /// 播放错误
    }
    
    weak var delegate: AudioPlayerDelegate?
    
    private var player: AVPlayer?
    private var playerItem: AVPlayerItem?

    /// Pauses playback automatically when resigning active.
    var playbackPausesWhenResigningActive: Bool = true

    /// Pauses playback automatically when backgrounded.
    var playbackPausesWhenBackgrounded: Bool = true

    /// Resumes playback when became active.
    var playbackResumesWhenBecameActive: Bool = true

    /// Resumes playback when entering foreground.
    var playbackResumesWhenEnteringForeground: Bool = true

    /// 最大时间
    var maximumDuration: TimeInterval {
        get {
            if let playerItem = self.playerItem {
                return CMTimeGetSeconds(playerItem.duration)
            } else {
                return CMTimeGetSeconds(CMTime.indefinite)
            }
        }
    }

    /// 当前时间
    var currentTimeInterval: TimeInterval {
        get {
            if let playerItem = self.playerItem {
                return CMTimeGetSeconds(playerItem.currentTime())
            } else {
                return CMTimeGetSeconds(CMTime.indefinite)
            }
        }
    }

    /// 播放状态
    var playState: PlayState = .stopped {
        didSet {
            self.delegate?.playerStateDidChange?(self)
        }
    }

    /// 播放
    func play() {
        if let p = player {
            p.play()
        }
    }

    /// 暂停
    func pause() {
        if let p = player, playState == .playing {
            p.pause()
        }
    }

    /// 停止
    func stop() {
        if playState == .stopped {
            return
        }
        self.player?.pause()
        self.playState = .stopped
        self.delegate?.playerPlaybackDidEnd?(self)
    }

    /// 快进/快退
    func seek(to time: CMTime) {
        if let playerItem = self.playerItem {
            return playerItem.seek(to: time, completionHandler: nil)
        }
    }

    /// 改变播放状态
    func changePlay() {
        switch playState {
        case .playing:
            pause()
        case .paused:
            play()
        default:
            pause()
        }
    }

    private func addObserver() {
        player?.addPeriodicTimeObserver(forInterval: CMTimeMake(value: 1, timescale: 100), queue: .main, using: { [weak self] (cmTime) in
            guard let `self` = self else { return }
            self.delegate?.playerCurrentTimeDidChange?(self)
        })

        player?.addObserver(self, forKeyPath: "timeControlStatus", options: .new, context: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus", let p = player {
            switch p.timeControlStatus {
            case .paused:
                playState = .paused
            case .playing:
                playState = .playing
            case .waitingToPlayAtSpecifiedRate:
                fallthrough
            default:
                break
            }
        }
    }

    private func addApplicationObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleApplicationWillResignActive(_:)), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleApplicationDidBecomeActive(_:)), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleApplicationDidEnterBackground(_:)), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleApplicationWillEnterForeground(_:)), name: UIApplication.willEnterForegroundNotification, object: nil)
    }

    @objc private func handleApplicationWillResignActive(_ aNotification: Notification) {
        if playState == .playing && playbackPausesWhenResigningActive {
            pause()
        }
    }

    @objc private func handleApplicationDidBecomeActive(_ aNotification: Notification) {
        if playState == .paused && playbackResumesWhenBecameActive {
            play()
        }
    }

    @objc private func handleApplicationDidEnterBackground(_ aNotification: Notification) {
        if playState == .playing && playbackPausesWhenBackgrounded {
            pause()
        }
    }

    @objc private func handleApplicationWillEnterForeground(_ aNoticiation: Notification) {
        if playState != .playing && playbackResumesWhenEnteringForeground {
            play()
        }
    }

    func player(_ url: String) {
        guard let u = URL(string: url) else { return }
        playerItem = AVPlayerItem(url: u)
        if player == nil {
            player = AVPlayer(playerItem: playerItem)
            addObserver()
            addApplicationObservers()
            do {
                /// 使用这个category的应用不会随着手机静音键打开而静音，可在手机静音下播放声音
                try AVAudioSession.sharedInstance().setCategory(.playback)
            } catch {}
        } else {
            /// 替换播放的 playerItem
            player?.replaceCurrentItem(with: playerItem)
        }
//        addPlayToEndTimeObserver()
        play()
    }

}
