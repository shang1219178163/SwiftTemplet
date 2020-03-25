//
//  NNAddressPickerViewModel.h
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/1/6.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NNAddressLabelRootModel.h"

@class IOPParkDistrictApi;

NS_ASSUME_NONNULL_BEGIN

@interface NNAddressPickerViewModel : NSObject

@property (nonatomic, strong) IOPParkDistrictApi *districtApi;

- (void)requestListWithHandler:(nullable void(^)(NSArray<NNAddressLabelModel *> *list))handler;

@end

NS_ASSUME_NONNULL_END
