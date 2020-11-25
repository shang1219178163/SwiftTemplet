//
//  NNPayManager.m
//  ParkingWang
//
//  Created by Bin Shang on 2020/1/22.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

#import "NNPayManager.h"

NSString * const kUniversalLink = @"https://wx.parkingwang.com/";
NSString * const kPayURLScheme = @"ParkingWang";

NSString * const kAliAppId = @"2021001188683352";

NSString * const kWeChatAppId = @"wxc7d21b10e87fc671";
NSString * const kWeChatAppSecret = @"8d090096fc678144eafe396227cf711c";

@interface NNPayManager()<WXApiDelegate>
/// 订单编号(微信支付成功后也不返回)
@property (nonatomic, strong) NSString *orderno;

@property (nonatomic, copy) NNPayBlock payBlock;
@property (nonatomic, copy) NNAuthWXBlock authWXBlock;
@property (nonatomic, copy) NNAuthALiBlock authALiBlock;

@end

@implementation NNPayManager

static NNPayManager *_instance = nil;

+ (NNPayManager *)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc]init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+(BOOL)regisetrWXApp{
    BOOL result = [WXApi registerApp:kWeChatAppId universalLink:kUniversalLink];
    return result;
}

- (void)authWXRequest:(void (^ __nullable)(BOOL success))completion handler:(NNAuthWXBlock)handler{
    if (!WXApi.isWXAppInstalled) {
        [NNPayManager showAlert:@"您未安装微信" message:nil];
        return;
    }
    
    self.authWXBlock = handler;
    
    SendAuthReq *req = [[SendAuthReq alloc]init];
    req.openID = kWeChatAppId;
    req.scope = @"snsapi_userinfo";
    req.state = @"12345";
    
    [WXApi sendReq:req completion:completion];
}


- (void)authAliRequest:(NSString *)info handler:(NNAuthALiBlock)handler{
    self.authALiBlock = handler;
    
    [[AlipaySDK defaultService] auth_V2WithInfo:info fromScheme:kPayURLScheme callback:^(NSDictionary *resultDic) {
        NSLog(@"%@", resultDic);

        self.authALiBlock(resultDic);
     }];
}

/**
 *  发起支付宝支付请求
 */
- (void)payALI:(NSString *)string orderno:(NSString *)orderno handler:(NNPayBlock)handler{
    self.payBlock = handler;
    self.orderno = orderno;

//    NSString * bodyString = [signedString stringByRemovingPercentEncoding];
//    DDLog(@"_______%@",bodyString);
    
    [[AlipaySDK defaultService] payOrder:string fromScheme:kPayURLScheme callback:^(NSDictionary *resultDic) {
        //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,跟callback一样的逻辑】
        [self handleAilPayCallBackResultDic:resultDic];
    }];
}

/**
 ALI回调数据处理
 @param resultDic 回调实体数据
 */
- (void)handleAilPayCallBackResultDic:(NSDictionary *)resultDic{
//    DDLog(@"resultDic = %@",resultDic);

    NSString *result = resultDic[@"result"];
    NSString *resultStatus = resultDic[@"resultStatus"];
    
    //9000 订单支付成功
    // 支付完成需要把返回的outtradeID给解析出来，给服务器二次确认
    if ([resultStatus isEqualToString:@"9000"]){
        NSString *jsonStr = [result stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        
        NSError *error = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error: &error];
        if (error) {
            DDLog(@"发现❌:%@", error.description);
//            return;
        }

        NSDictionary *responseDic = dic[@"alipay_trade_app_pay_response"];
        //\"out_trade_no\":\"15154064685511\"
        NSString *out_trade_no = responseDic[@"out_trade_no"];

        self.payBlock(responseDic, out_trade_no, resultStatus.integerValue == 9000);
//        [[NSNotificationCenter defaultCenter] postNotificationName:kWX_NOTI_PaySucess object:nil];
          //代码块回调方法里会调用接口,不必重复使用通知
    } else {
        //8000 正在处理中 4000  订单支付失败 6001 用户中途取消/重复操作取消 6002  网络连接出错
        self.payBlock(resultDic, self.orderno, false);
    }
}

- (void)payWX:(NSDictionary *)dic orderno:(NSString *)orderno handler:(NNPayBlock)handler{
    self.payBlock = handler;
    self.orderno = orderno;

    if(![WXApi isWXAppInstalled]) {
        [NNPayManager showAlert:@"未安装微信!" message:nil];
        return;
    }
    
    PayReq *req = [[PayReq alloc] init];
    req.nonceStr        = dic[kNoncestr_WX];
    req.package         = dic[kPackage_WX];
    req.partnerId       = dic[kPartnerid_WX];
    req.prepayId        = dic[kPrepayid_WX];
    req.sign            = dic[kSign_WX];
    req.timeStamp       = [dic[kTimestamp_WX] intValue];
    
//    req.package = @"Sign=WXPay";
//    req.sign = @"null";
    
    [WXApi sendReq:req completion:^(BOOL success) {
        if (!success) {
            [NNPayManager showAlert:@"微信支付调用失败" message:nil];
            return ;
        }
    }];
        
    //日志输出
DDLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",dic[@"appid"], req.partnerId, req.prepayId, req.nonceStr, (long)req.timeStamp, req.package, req.sign);
}


/// 回调入口
- (BOOL)handlePayResultOpenURL:(NSURL *)url{
//    DDLog(@"url____\n%@",url);

    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,跟callback一样的逻辑】
            [self handleAilPayCallBackResultDic:resultDic];
        }];
        
    } else if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,跟callback一样的逻辑】
            [self handleAilPayCallBackResultDic:resultDic];
        }];
    } else if ([url.host isEqualToString:@"待命名"]) {
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            //code：拿到授权信息，完成业务逻辑
            NSLog(@"%@%@", NSStringFromSelector(_cmd), resultDic);
            self.authALiBlock(resultDic);
        }];
    }
    return [WXApi handleOpenURL:url delegate:self];
}


#pragma mark - WXApiDelegate
/**
 微信回调代理

 @param resp 回调实体数据
 */
- (void)onResp:(BaseResp *)resp{

    if([resp isKindOfClass:[PayResp class]]){
        self.payBlock(resp, self.orderno, resp.errCode);

        NSString *message = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
//        NSString *strTitle = @"支付结果";
        switch (resp.errCode) {
            case WXSuccess:
            {
                message = @"支付结果：成功！";
                //代码块回调方法里会调用接口,不必重复使用通知
            }
                break;
            case WXErrCodeUserCancel:
                message = @"支付结果：用户点击取消！";

                break;
            case WXErrCodeSentFail:
                message = @"支付结果：发送失败！";

                break;
            case WXErrCodeAuthDeny:
                message = @"支付结果：授权失败！";

                break;
            default:
                message = @"支付结果：未知错误！";
                break;
        }
        DDLog(@"%@", message);
        [NNPayManager showAlert:@"支付结果" message:message];
    } else if([resp isKindOfClass:[SendAuthResp class]]){
        SendAuthResp *tmp = (SendAuthResp *)resp;
        self.authWXBlock(tmp.code);
    }
}


+ (void)showAlert:(NSString *)title message:(NSString *)message{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil]];
    UIViewController *rootVC = UIApplication.sharedApplication.keyWindow.rootViewController;
    [rootVC presentViewController:alertVC animated:true completion:nil];
}

@end


@implementation NNAliTradePayResponseModel

- (instancetype)initWithDict:(NSDictionary<NSString *,id> *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
