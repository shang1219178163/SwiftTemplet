//
//  NNAddressPickerViewModel.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/1/6.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

#import "NNAddressPickerViewModel.h"
#import "YYModel.h"
#import "SwiftTemplet-Swift.h"

@implementation NNAddressPickerViewModel

- (void)requestListWithHandler:(nullable void(^)(NSArray<NNAddressLabelModel *> *list))handler{
//    [IOPProgressHUD showWithStatus:kAPILoading];
//    [self.districtApi startRequestWithSuccessBlock:^(__kindof IOPRequestManager *manager, NSDictionary *jsonData) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            NNAddressLabelRootModel *model = [NNAddressLabelRootModel yy_modelWithJSON:jsonData];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if (!model || !model.list) {
//                    [IOPProgressHUD showErrorWithStatus:kAPIFail];
//                    return ;
//                }
//                if (handler) {
//                    handler(model.list);
//                }
//                [IOPProgressHUD dismiss];
//            });
//        });
//
//    } failedBlock:^(__kindof IOPRequestManager *manager, IOPErrorModel *errorModel) {
//        [IOPProgressHUD showErrorWithStatus:errorModel.message];
//    }];
}


#pragma mark - lazy

- (IOPParkDistrictApi *)districtApi{
    if (!_districtApi) {
        _districtApi = [[IOPParkDistrictApi alloc]init];
        
    }
    return _districtApi;
}

@end

