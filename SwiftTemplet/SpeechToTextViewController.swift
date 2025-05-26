//
//  SpeechToTextViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2024/11/16.
//  Copyright © 2024 BN. All rights reserved.
//

import Foundation
import UIKit
import Speech
import SwiftExpand

class SpeechToTextViewController: UIViewController, SFSpeechRecognizerDelegate {
    
    // UI 组件
    var textView: UITextView!
    var startButton: UIButton!
    
    // 语音识别相关
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US")) // 根据需要设置语言
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 确保语音识别器非空，并设置代理
        speechRecognizer?.delegate = self
        
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        textView = UITextView(frame: CGRect(x: 0, y: 88, width: kScreenWidth, height: 300))
        textView.backgroundColor = Color.green;
        view.addSubview(textView)
        
        startButton = UIButton(frame: CGRect(x: (kScreenWidth - 100) * 0.5, y: 400, width: 200, height: 50))
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.orange
        startButton.layer.cornerRadius = 6
        startButton.layer.masksToBounds = true
        startButton.setTitle("Start Recording", for: .normal)
        startButton.titleLabel?.textAlignment = NSTextAlignment.center
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.isEnabled = false

        view.addSubview(startButton)

        
        // 请求语音识别权限
        SFSpeechRecognizer.requestAuthorization { authStatus in
            DispatchQueue.main.async {
                switch authStatus {
                case .authorized:
                    self.startButton.isEnabled = true
                case .denied, .restricted, .notDetermined:
                    self.startButton.isEnabled = false
                    self.textView.text = "Speech recognition authorization was denied."
                @unknown default:
                    break
                }
            }
        }
    }
    
    @objc func startButtonTapped(_ sender: UIButton) {
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            startButton.setTitle("Start Recording", for: .normal)
        } else {
            startRecording()
            startButton.setTitle("Stop Recording", for: .normal)
        }
    }
    
    private func startRecording() {
        // 停止之前的任务
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        // 配置音频会话
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("Audio session properties couldn't be set: \(error)")
        }
        
        // 初始化语音识别请求
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create a recognition request")
        }
        
        recognitionRequest.shouldReportPartialResults = true
        
        // 配置音频输入
        let inputNode = audioEngine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        // 开启音频引擎
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            print("Audio engine couldn't start: \(error)")
        }
        
        // 开始识别任务
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { result, error in
            if let result = result {
                self.textView.text = result.bestTranscription.formattedString
            }
            if error != nil || result?.isFinal == true {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.startButton.setTitle("Start Recording", for: .normal)
            }
        })
    }
}
