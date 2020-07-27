//
//  AppleSignIn.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import AuthenticationServices


@available(iOS 13.0, *)
class NNAppleSignInManager: NSObject {

    static var shared = NNAppleSignInManager()
    
    private var callBack:((Bool, String)->Void)?
    
//    var user = ""
//    var familyName = ""
//    var givenName = ""
//    var email = ""
    var identityTokenString = ""
    var authorizationCodeString = ""
    
    var user: String {
        get {
            return UserDefaults.standard.string(forKey: "AppleUser") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AppleUser")
        }
    }
    
   var familyName: String {
        get {
            return UserDefaults.standard.string(forKey: "AppleFamilyName") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AppleFamilyName")
        }
    }
    
    var givenName: String {
        get {
            return UserDefaults.standard.string(forKey: "AppleGivenName") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AppleGivenName")
        }
    }
    
    var email: String {
        get {
            return UserDefaults.standard.string(forKey: "AppleEmail") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "AppleEmail")
        }
    }
    
    // MARK: -funtions
    func createApleIDButton(_ type: ASAuthorizationAppleIDButton.ButtonType, style: ASAuthorizationAppleIDButton.Style) -> ASAuthorizationAppleIDButton {
        let sender = ASAuthorizationAppleIDButton(type: type, style: style)
        return sender
    }
    
    //发起苹果登录
    func loginInWithApple(_ callBack: ((Bool, String)->Void)?) {
        self.callBack = callBack
        // 基于用户的Apple ID授权用户，生成用户授权请求的一种机制
        let provider = ASAuthorizationAppleIDProvider()
        // 授权请求AppleID
        let request = provider.createRequest()
        // 在用户授权期间请求的联系信息
        request.requestedScopes = [ASAuthorization.Scope.fullName, ASAuthorization.Scope.email]
        // 由ASAuthorizationAppleIDProvider创建的授权请求 管理授权请求的控制器
        let authVC = ASAuthorizationController(authorizationRequests: [request])
        // 设置授权控制器通知授权请求的成功与失败的代理
        authVC.delegate = self
        // 设置提供 展示上下文的代理，在这个上下文中 系统可以展示授权界面给用户
        authVC.presentationContextProvider = self
        // 在控制器初始化期间启动授权流
        authVC.performRequests()
    }
    
    // 如果存在iCloud Keychain 凭证或者AppleID 凭证提示用户
    func perfomExistingAccountSetupFlows(_ callBack: ((Bool, String)->Void)?) {
        self.callBack = callBack

        // 基于用户的Apple ID授权用户，生成用户授权请求的一种机制
        let provider = ASAuthorizationAppleIDProvider()
        // 授权请求AppleID
        let request = provider.createRequest()
        // 为了执行钥匙串凭证分享生成请求的一种机制
        let pwdProvider = ASAuthorizationPasswordProvider()
        let pwdRequest = pwdProvider.createRequest()
        // 由ASAuthorizationAppleIDProvider创建的授权请求 管理授权请求的控制器
        let authVC = ASAuthorizationController(authorizationRequests: [request, pwdRequest])
        // 设置授权控制器通知授权请求的成功与失败的代理
        authVC.delegate = self
        // 设置提供 展示上下文的代理，在这个上下文中 系统可以展示授权界面给用户
        authVC.presentationContextProvider = self
        // 在控制器初始化期间启动授权流
        authVC.performRequests()
    }
        
    func monitorAppSignInState(_ block: @escaping (Bool, String)-> Void) {
        if user == "" {
            block(false, "用户标识符错误")
            return
        }
        
        let provider = ASAuthorizationAppleIDProvider()
        provider.getCredentialState(forUserID: user) { (credentialState, error) in
            var msg = "未知错误"
            var authorized = false
        
            switch credentialState {
            case .revoked:
                msg = "授权被撤销"

            case .authorized:
                msg = "已授权"
                authorized = true

            case .notFound:
                msg = "未查到授权信息"

            case .transferred:
                msg = "授权信息变动"

            default:
                break
            }
            block(authorized, msg)
        }
    }
    
    private func loginWithServer(user: String, token: String, code: String) {
    //向你的服务器验证, 验证通过即可登录
        
    }
}


@available(iOS 13.0, *)
extension NNAppleSignInManager : ASAuthorizationControllerDelegate {
    //授权成功地回调
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if authorization.credential.isKind(of: ASAuthorizationAppleIDCredential.self) {
            // 用户登录使用ASAuthorizationAppleIDCredential
            let appleIDCredential = authorization.credential as! ASAuthorizationAppleIDCredential
            let user = appleIDCredential.user
            self.user = user

            // 用于判断当前登录的苹果账号是否是一个真实用户，取值有：unsupported、unknown、likelyReal
            let realUserStatus = appleIDCredential.realUserStatus
            //初次授权的，才返回以下参数
            if let fullName = appleIDCredential.fullName,
                let familyName = fullName.familyName,
                let givenName = fullName.givenName,
                let email = appleIDCredential.email {
                self.familyName = familyName
                self.givenName = givenName
                self.email = email
                
                UserDefaults.standard.synchronize()
            }
            //每次授权的，都返回以下参数
            if let identityToken = appleIDCredential.identityToken,
                let authorizationCode = appleIDCredential.authorizationCode,
                let identityTokenString = String(data: identityToken, encoding: .utf8),
                let authorizationCodeString = String(data: authorizationCode, encoding: .utf8) {
                
                self.identityTokenString = identityTokenString
                self.authorizationCodeString = authorizationCodeString
                print(#function, self.user, identityTokenString, authorizationCodeString)
            }
            
            print(#function, user, email, identityTokenString, authorizationCodeString)
            DispatchQueue.main.async {
                self.callBack?(true, user)
            }
            // 服务器验证需要使用的参数
        } else if authorization.credential.isKind(of: ASPasswordCredential.self) {
            // 这个获取的是iCloud记录的账号密码，需要输入框支持iOS 12 记录账号密码的新特性，如果不支持，可以忽略
            // Sign in using an existing iCloud Keychain credential.
            // 用户登录使用现有的密码凭证
            let pwdCreddential = authorization.credential as! ASPasswordCredential
            // 密码凭证对象的用户标识 用户的唯一标识
            let user = pwdCreddential.user
            // 密码凭证对象的密码
            let password = pwdCreddential.password
            
            print(#function, user, password)
            DispatchQueue.main.async {
                self.callBack?(true, user)
            }
        } else {
            // "授权信息不符合"
            print(#function, "未知错误")
        }
    }
        
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        var msg: String = ""
        switch (error as NSError).code {
        case ASAuthorizationError.canceled.rawValue :
            msg = "用户取消了授权请求"
        case ASAuthorizationError.failed.rawValue :
            msg = "授权请求失败"
        case ASAuthorizationError.invalidResponse.rawValue :
            msg = "授权请求无响应"
        case ASAuthorizationError.notHandled.rawValue :
            msg = "未能处理授权请求"
        case ASAuthorizationError.unknown.rawValue :
            msg = "授权请求失败原因未知"
        default:
            break
        }
        DispatchQueue.main.async {
            self.callBack?(false, msg)
        }
    }
}

@available(iOS 13.0, *)
extension NNAppleSignInManager: ASAuthorizationControllerPresentationContextProviding {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.last ?? ASPresentationAnchor()
//        return (UIApplication.shared.delegate as! AppDelegate).window!
    }
    
}
