//
//  IOPUserDetailModel.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/17.
//  Copyright © 2020 BN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IOPUserDetailModel : NSObject

/// 身份证反
@property (nonatomic, copy) NSString *id_back_img;
/// 身份证正
@property (nonatomic, copy) NSString *id_just_img;
/// 身份证号
@property (nonatomic, copy) NSString *id_card;

@property (nonatomic, copy) NSString *id_card_btime;

@property (nonatomic, copy) NSString *id_card_etime;

/// 负责联系人电子邮箱
@property (nonatomic, copy) NSString *rc_email;
/// 负责联系人姓名
@property (nonatomic, copy) NSString *rc_name;
/// 负责联系人手机号码
@property (nonatomic, copy) NSString *rc_phone;


@property (class, nonatomic, copy, readonly) NSDictionary<NSString *, NSString *> *contactTypeDic;
@property (class, nonatomic, copy, readonly) NSDictionary<NSString *, NSString *> *certificateTypeDic;

@end

NS_ASSUME_NONNULL_END
