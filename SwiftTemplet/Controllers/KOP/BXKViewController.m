////
////  AliBianXianKeSDKController.m
////  SwiftTemplet
////
////  Created by Bin Shang on 2020/9/24.
////  Copyright © 2020 BN. All rights reserved.
////
//
//#import "BXKViewController.h"
//#import <BXKAdvertSDK/BXKAdvertSDK.h>
//#import "BXKTestViewController.h"
//#import "BXKWebViewController.h"
//
//#define SDKKey      @"820906ac"
//#define SDKSecret   @"0c5d534e9f018b168b88d8542921c47f"
//
//@interface BXKViewController ()<BXKAdvertDelegate>
//
//@property (nonatomic, strong) id<BXKAdvertProtocol> advert;
//
//@end
//
//@implementation BXKViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    self.advert = [BXKAdvertFactory createWithType:BXKAdvertTypeInfoFlow comId:@"2611" delegate:self];    // 初始化广告
//    [self.advert startRequest];    // 开始请求
//}
//
//
//#pragma mark - BXKAdvertDelegate
//
//-(void)advert:(id<BXKAdvertProtocol>)advert didRequestSuccess:(NSDictionary *)response {
//    if (advert.type == BXKAdvertTypeInfoFlow) {
//            // 显示广告
//        // 推荐高度为110
//        advert.view.frame = CGRectMake(0, 100, CGRectGetWidth(self.view.bounds), 110);
//        [self.view addSubview:advert];
//    }
//}
//
//- (void)advert:(id<BXKAdvertProtocol>)advert didRequestFailure:(NSError *)error {
//    NSLog(@"error: %@", error.description);
//}
//
//-(void)advert:(id<BXKAdvertProtocol>)advert didClickWithLandingLink:(NSString *)landingLink {
//        // 处理跳转逻辑
//    BXKWebViewController *webVC = [[BXKWebViewController alloc] init];
////    webVC.URLString = landingLink;
//    [self.navigationController pushViewController:webVC animated:YES];
//}
//
//@end
