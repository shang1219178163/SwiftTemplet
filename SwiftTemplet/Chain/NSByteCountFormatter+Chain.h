//
//	NSByteCountFormatter+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 11:11
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSByteCountFormatter (Chain)

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^allowedUnitsChain)(NSByteCountFormatterUnits);

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^countStyleChain)(NSByteCountFormatterCountStyle);

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^allowsNonnumericFormattingChain)(BOOL);

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^includesUnitChain)(BOOL);

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^includesCountChain)(BOOL);

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^includesActualByteCountChain)(BOOL);

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^adaptiveChain)(BOOL);

@property(nonatomic, copy, readonly) NSByteCountFormatter *(^zeroPadsFractionDigitsChain)(BOOL);


@end

NS_ASSUME_NONNULL_END
