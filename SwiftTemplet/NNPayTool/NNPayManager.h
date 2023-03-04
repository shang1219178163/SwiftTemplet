//
//  NNPayManager.h
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/1/22.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//
//开放平台登录https://openhome.alipay.com/platform/appManage.htm

#import <Foundation/Foundation.h>
#import <AlipaySDK/AlipaySDK.h>
#import <WechatOpenSDK/WXApi.h>
//#import <WechatOpenSDK-XCFramework/WXApi.h>

#define kNoncestr_WX    @"noncestr"
#define kPackage_WX     @"package"
#define kPartnerid_WX   @"partnerid"
#define kPrepayid_WX    @"prepayid"
#define kSign_WX        @"sign"
#define kTimestamp_WX   @"timestamp"


NS_ASSUME_NONNULL_BEGIN

extern NSString * const kUniversalLink ;
/////应用注册scheme,Info.plist定义URL types
extern NSString * const kPayURLScheme ;

extern NSString * const kAliAppId ;

extern NSString * const kWeChatAppId ;
extern NSString * const kWeChatAppSecret ;

/**
 支付结果回调

 @param obj 回调实体对象,微信BaseResp对象,支付宝resultDic
 @param orderno 微信不返回订单号为nil,支付宝为resultDic重解析的订单号
 */
typedef void(^NNPayBlock)(id obj, NSString *orderno, BOOL success);

/**
 wx登录结果回调
 */
typedef void(^NNAuthWXBlock)(NSString *identifier);
/**
 ali登录结果回调
 */
typedef void(^NNAuthALiBlock)(NSDictionary *dic);


/// 支付管理工具
@interface NNPayManager : NSObject

+ (instancetype)shared;

- (void)authWXRequest:(void (^ __nullable)(BOOL success))completion handler:(NNAuthWXBlock)handler;
- (void)authAliRequest:(NSString *)info handler:(NNAuthALiBlock)handler;

- (void)payALI:(NSString *)string orderno:(NSString *)orderno handler:(NNPayBlock)handler;

/// 回调入口
- (BOOL)handlePayResultOpenURL:(NSURL *)url;

- (void)payWX:(NSDictionary *)dic orderno:(NSString *)orderno handler:(NNPayBlock)handler;

@end


/// 支付宝回调订单结果模型
@interface NNAliTradePayResponseModel : NSObject

@property (nonatomic, copy) NSString *app_id;

@property (nonatomic, copy) NSString *auth_app_id;

@property (nonatomic, copy) NSString *charset;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, copy) NSString *out_trade_no;

@property (nonatomic, copy) NSString *seller_id;

@property (nonatomic, copy) NSString *timestamp;

@property (nonatomic, copy) NSString *total_amount;

@property (nonatomic, copy) NSString *trade_no;

- (instancetype)initWithDict:(NSDictionary<NSString *,id> *)dict;

@end

NS_ASSUME_NONNULL_END
