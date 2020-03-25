//
//
//  MacTemplet
//
//  Created by shang on 2020/01/06 10:35.
//  Copyright © 2020 shang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NNAddressLabelModel;


@interface NNAddressLabelRootModel : NSObject

@property (nonatomic, copy) NSString *code;

@property (nonatomic, strong) NSArray<NNAddressLabelModel *> *list;

@property (nonatomic, copy) NSString *message;

@end


@interface NNAddressLabelModel : NSObject

@property (nonatomic, copy) NSString *label;

@property (nonatomic, copy) NSString *value;

@end

