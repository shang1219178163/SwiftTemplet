//
//  WebSocketViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/3/2.
//  Copyright © 2021 BN. All rights reserved.
//

/**
 //  WSEngine.swift 中 有 bug,服务器不可用时,有时会定留在 waiting 状态,
 public func connectionChanged(state: ConnectionState) {
 ...
 case .waiting:
     break
 ...
}
 做错误兼容性处理, 改为如下
 public func connectionChanged(state: ConnectionState) {
 ...
 case .waiting:
     let error = WSError(type: .serverError, message: "服务器不可用时, iPhone真机有时不走错误, 走此处", code: 500)
     handleError(error)
     break
 ...
}
 */

import UIKit
import Starscream


class WebSocketViewController: UIViewController {
    
    lazy var socketManager: WebSocketManager = {
        let manager = WebSocketManager.init(URL(string: "http://localhost:8080")!)
        return manager
    }()
//    var socket: WebSocket!
    var isConnected = false
    
    // MARK: -lifycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = controllerName
                
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "链接", style: .plain, target: self, action: #selector(disconnect(_:)))
        
        socketManager.connect()
    }
    
    // MARK: -funtions
    @objc func disconnect(_ sender: UIBarButtonItem) {
        if isConnected {
            sender.title = "Connect"
            socketManager.disconnect()
        } else {
            sender.title = "Disconnect"
            socketManager.connect()
        }
    }
    
    @objc func writeText(_ sender: UIBarButtonItem) {
        socketManager.write(string: "hello there!")
    }
}



@objcMembers public class WebSocketManager: NSObject {
    
    private(set) var socket: WebSocket!
    private(set) var isConnected = false
    
    var connectedBlk:(([String: String])->Void)?
    var connectedErrorBlk:((WebSocketManager, String)->Void)?
    var disconnectedBlk:((String, UInt16)->Void)?
    var receivedTextBlk:((String)->Void)?
    var receivedDataBlk:((Data)->Void)?

    convenience init(_ url: URL) {
        self.init()

        var request = URLRequest(url: url) //https://localhost:8080
        request.timeoutInterval = 30
        self.socket = WebSocket(request: request)
        self.socket.delegate = self
    }
    
    public func initSocket(With url: URL){
        var request = URLRequest(url: url)
        request.timeoutInterval = 30
        self.socket = WebSocket(request: request)
        self.socket.delegate = self
    }
    
    // MARK: -funtions
    func handleError(_ error: Error?) {
        if let e = error as? WSError {
            print("websocket encountered an error: \(e.message)")
            connectedErrorBlk?(self, e.message)
        } else if let e = error {
            print("websocket encountered an error: \(e.localizedDescription)")
            connectedErrorBlk?(self, e.localizedDescription)
        } else {
            print("websocket encountered an error")
            connectedErrorBlk?(self, "网络异常, 链接断开, 请尝试重连")
        }
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    func connect() {
        socket.connect()
    }
    
    func write(string: String) {
        socket.write(string: string)
    }
    
    func write(data: Data, completion: (() -> ())?) {
        socket.write(data: data, completion: completion)
    }
}

extension WebSocketManager: WebSocketDelegate{
    
    public func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected(let headers):
            isConnected = true
            print("websocket is connected: \(headers)")
            connectedBlk?(headers)
            
        case .disconnected(let reason, let code):
            isConnected = false
            print("websocket is disconnected: \(reason) with code: \(code)")
            disconnectedBlk?(reason, code)

        case .text(let string):
            print("Received text: \(string)")
            receivedTextBlk?(string)
            
        case .binary(let data):
            print("Received data: \(data.count)")
            receivedDataBlk?(data)
            
        case .ping(_):
            break
        case .pong(_):
            break
        case .viabilityChanged(_):
            break
        case .reconnectSuggested(_):
            break
        case .cancelled:
            isConnected = false
        case .error(let error):
            isConnected = false
            handleError(error)
        }
    }
}
