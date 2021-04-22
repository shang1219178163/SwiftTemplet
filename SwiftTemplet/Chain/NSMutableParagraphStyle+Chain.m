//
//	NSMutableParagraphStyle+Chain.m
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 11:47
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import "NSMutableParagraphStyle+Chain.h"

@implementation NSMutableParagraphStyle (Chain)

- (NSMutableParagraphStyle * (^)(CGFloat))lineSpacingChain{
    return ^(CGFloat value) {
        self.lineSpacing = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))paragraphSpacingChain{
    return ^(CGFloat value) {
        self.paragraphSpacing = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(NSTextAlignment))alignmentChain{
    return ^(NSTextAlignment value) {
        self.alignment = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))firstLineHeadIndentChain{
    return ^(CGFloat value) {
        self.firstLineHeadIndent = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))headIndentChain{
    return ^(CGFloat value) {
        self.headIndent = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))tailIndentChain{
    return ^(CGFloat value) {
        self.tailIndent = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(NSLineBreakMode))lineBreakModeChain{
    return ^(NSLineBreakMode value) {
        self.lineBreakMode = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))minimumLineHeightChain{
    return ^(CGFloat value) {
        self.minimumLineHeight = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))maximumLineHeightChain{
    return ^(CGFloat value) {
        self.maximumLineHeight = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(NSWritingDirection))baseWritingDirectionChain{
    return ^(NSWritingDirection value) {
        self.baseWritingDirection = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))lineHeightMultipleChain{
    return ^(CGFloat value) {
        self.lineHeightMultiple = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))paragraphSpacingBeforeChain{
    return ^(CGFloat value) {
        self.paragraphSpacingBefore = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(float))hyphenationFactorChain{
    return ^(float value) {
        self.hyphenationFactor = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(NSArray<NSTextTab *> *))tabStopsChain{
    return ^(NSArray<NSTextTab *> * value) {
        self.tabStops = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(CGFloat))defaultTabIntervalChain{
    return ^(CGFloat value) {
        self.defaultTabInterval = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(BOOL))allowsDefaultTighteningForTruncationChain{
    return ^(BOOL value) {
        self.allowsDefaultTighteningForTruncation = value;
        return self;
    };
}

- (NSMutableParagraphStyle * (^)(NSLineBreakStrategy))lineBreakStrategyChain{
    return ^(NSLineBreakStrategy value) {
        self.lineBreakStrategy = value;
        return self;
    };
}



@end
