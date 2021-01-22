//
//  IOPUserDetailModel.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/17.
//  Copyright © 2020 BN. All rights reserved.
//

#import "IOPUserDetailModel.h"

@implementation IOPUserDetailModel

static NSDictionary<NSString *, NSString *> * _contactTypeDic = nil;
+ (NSDictionary<NSString *, NSString *> *)contactTypeDic{
    if (!_contactTypeDic) {
        _contactTypeDic = @{
            @"1": @"法人",
            @"2": @"实际控制人",
            @"3": @"代理人",
            @"4": @"其他",
        };
    }
    return _contactTypeDic;
}

static NSDictionary<NSString *, NSString *> * _certificateTypeDic = nil;
+ (NSDictionary<NSString *, NSString *> *)certificateTypeDic{
    if (!_certificateTypeDic) {
        _certificateTypeDic = @{
            @"1": @"事业单位法人证书",
            @"2": @"统一社会信用代码证书",
            @"3": @"有偿服务许可证（军队医院适用）",
            @"4": @"医疗机构执业许可证（军队医院适用）",
            @"5": @"企业营业执照（挂靠企业的党组织适用）",
            @"6": @"组织机构代码证（政府机关适用）",
            @"7": @"社会团体法人登记证书",
            @"8": @"民办非企业单位登记证书",
            @"9": @"基金会法人登记证书",
            @"10": @"慈善组织公开募捐资格证书",
            @"11": @"农民专业合作社法人营业执照",
            @"12": @"宗教活动场所登记证",
            @"13": @"其他证书/批文/证明",
        };
    }
    return _certificateTypeDic;
}



@end
