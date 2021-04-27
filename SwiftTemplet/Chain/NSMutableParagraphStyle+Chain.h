//
//	NSMutableParagraphStyle+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 11:47
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableParagraphStyle (Chain)

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^lineSpacingChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^paragraphSpacingChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^alignmentChain)(NSTextAlignment);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^firstLineHeadIndentChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^headIndentChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^tailIndentChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^lineBreakModeChain)(NSLineBreakMode);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^minimumLineHeightChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^maximumLineHeightChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^baseWritingDirectionChain)(NSWritingDirection);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^lineHeightMultipleChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^paragraphSpacingBeforeChain)(CGFloat);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^hyphenationFactorChain)(float);

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^tabStopsChain)(NSArray<NSTextTab *> *) API_AVAILABLE(macos(10.0), ios(7.0));
@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^defaultTabIntervalChain)(CGFloat) API_AVAILABLE(macos(10.0), ios(7.0));
@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^allowsDefaultTighteningForTruncationChain)(BOOL) API_AVAILABLE(macos(10.11), ios(9.0));
@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^lineBreakStrategyChain)(NSLineBreakStrategy) API_AVAILABLE(macos(10.11), ios(9.0));

@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^addTabStopChain)(NSTextTab *) API_AVAILABLE(macos(10.11), ios(9.0));
@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^removeTabStopChain)(NSTextTab *) API_AVAILABLE(macos(10.11), ios(9.0));
@property(nonatomic, copy, readonly) NSMutableParagraphStyle *(^setParagraphStyleChain)(NSParagraphStyle *) API_AVAILABLE(macos(10.11), ios(9.0));

@end

NS_ASSUME_NONNULL_END
