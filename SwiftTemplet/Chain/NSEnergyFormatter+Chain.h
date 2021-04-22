//
//	NSEnergyFormatter+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 13:56
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSEnergyFormatter (Chain)

@property(nonatomic, copy, readonly) NSEnergyFormatter *(^numberFormatterChain)(NSNumberFormatter *); // default is NSNumberFormatter with NSNumberFormatterDecimalStyle
@property(nonatomic, copy, readonly) NSEnergyFormatter *(^unitStyleChain)(NSFormattingUnitStyle); // default is NSFormattingUnitStyleMedium
@property(nonatomic, copy, readonly) NSEnergyFormatter *(^forFoodEnergyUseChain)(BOOL); // default is NO; if it is set to YES, NSEnergyFormatterUnitKilocalorie may be “C” instead of “kcal"


@end

NS_ASSUME_NONNULL_END
