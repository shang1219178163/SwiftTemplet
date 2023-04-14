//
//  SingletonOC.h
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/4/11.
//  Copyright © 2023 BN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingletonOC : NSObject

@property(nonatomic, readonly) SingletonOC *sharedInstance;

@end

NS_ASSUME_NONNULL_END
