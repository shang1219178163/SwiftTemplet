//
//	NSPersonNameComponentsFormatter+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 14:17
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSPersonNameComponentsFormatter (Chain)

@property(nonatomic, copy, readonly) NSPersonNameComponentsFormatter *(^styleChain)(NSPersonNameComponentsFormatterStyle);

@property(nonatomic, copy, readonly) NSPersonNameComponentsFormatter *(^phoneticChain)(BOOL);

@end



@interface NSPersonNameComponents (Chain)

@property(nonatomic, copy, readonly) NSPersonNameComponents *(^namePrefixChain)(NSString *);

@property(nonatomic, copy, readonly) NSPersonNameComponents *(^givenNameChain)(NSString *);

@property(nonatomic, copy, readonly) NSPersonNameComponents *(^middleNameChain)(NSString *);

@property(nonatomic, copy, readonly) NSPersonNameComponents *(^familyNameChain)(NSString *);

@property(nonatomic, copy, readonly) NSPersonNameComponents *(^nameSuffixChain)(NSString *);

@property(nonatomic, copy, readonly) NSPersonNameComponents *(^nicknameChain)(NSString *);

@property(nonatomic, copy, readonly) NSPersonNameComponents *(^phoneticRepresentationChain)(NSPersonNameComponents *);

@property(nonatomic, copy, readonly) NSString *(^stringByChain)(NSPersonNameComponentsFormatter *);

@end

NS_ASSUME_NONNULL_END
