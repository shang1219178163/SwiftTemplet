//
//  AppGlobleConfig.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/25.
//  Copyright © 2019 BN. All rights reserved.
//

//import Foundation

//#ifdef DEBUG
//public let kIsProduction     =   NO;
//#else
//public let kIsProduction     =   YES;
//#endif

/// 协议条款网址
public let kAgreementURL     = "";

/// 商店appID
public let kAppStoreID       = "1223960667";

//MARK: - -极光

public let kAppKey_JPush     =   "";
public let kAppSecret_JPush  =   "";
public let kChannel_JPush    =   "App Store";


//MARK: - -友盟

public let kAppKey_UMeng     =       "";
public let kChannel_UMeng    =   "App Store";

//MARK: - -地图

public let kGDMapKey         =    "1a8e500dff6009ff698a67b53869985a";


//MARK: - -支付宝支付
/**
 -----------------------------------
 支付宝支付需要配置的参数
 -----------------------------------
 */

//开放平台登录https://openhome.alipay.com/platform/appManage.htm
//管理中心获取APPID
public let kAPPID_Ali         =        "";
//合作伙伴身份ID(partnerID)
public let kPID_Ali           =          "";

//应用注册scheme,在AliSDKDemo-Info.plist定义URL types
public let kPay_URLScheme_Ali =    "com.payAli.iOSClient";

/*=====================================================================*/

//MARK: - -微信支付
/**
 注意:支付单位为分
 
 */

public let kAppID_WX          =        "";
public let kAppKey_WX         =        "";

public let kAppID_QQ          =       "";
public let kAppKey_QQ         =       "";


//MARK: - -RecognizeCard
/**
 身份证识别
 */
public let kRecognizeCard_AppKey    =  "";
public let kRecognizeCard_AppSecret =  "";
public let kRecognizeCard_AppCode   = "";
