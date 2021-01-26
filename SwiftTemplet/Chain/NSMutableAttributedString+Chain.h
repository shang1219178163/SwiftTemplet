//
//  NSMutableAttributedString+Chain.h
//  KTAttributedString
//
//  Created by Bin Shang on 2020/12/20.
//  Copyright © 2020 Shang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Chain)

// addAttrs
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^addAttrs)(NSDictionary<NSAttributedStringKey, id> *);

// ParagraphStyle
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^paragraphStyle)(NSParagraphStyle *);

// Font
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^font)(UIFont *);
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^fontSize)(CGFloat);

// ForegroundColor
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^color)(UIColor *);

// BackgroundColor
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^bgColor)(UIColor *);

// Link
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^link)(NSString *);

// Link
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^linkURL)(NSURL *);

// Obliqueness
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^oblique)(CGFloat);
// baselineOffset
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^baselineOffset)(CGFloat);

// Kern
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^kern)(CGFloat);

// Expansion
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^expansion)(CGFloat);

// Ligature
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^ligature)(NSUInteger);

// UnderlineStyle
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^underline)(NSUnderlineStyle, UIColor *);

// StrikethroughStyle(负值填充效果，正值中空效果)
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^strikethrough)(NSUnderlineStyle, UIColor *);

// Stroke
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^stroke)(UIColor *, CGFloat);

// Shadow
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^shadow)(NSShadow *);

// TextEffect
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^textEffect)(NSString *);

// Attachment
@property(nonatomic, strong, readonly) NSMutableAttributedString *(^attachment)(NSTextAttachment *);

@end


@interface NSString (Chain)

@property(nonatomic, strong, readonly) NSMutableAttributedString *matt;

@end


@interface NSAttributedString (Chain)

@property(nonatomic, strong, readonly) NSMutableAttributedString *matt;

@end

NS_ASSUME_NONNULL_END




