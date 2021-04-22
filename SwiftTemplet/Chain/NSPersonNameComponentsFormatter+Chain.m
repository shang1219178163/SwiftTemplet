//
//	NSPersonNameComponentsFormatter+Chain.m
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/19 14:17
//	Copyright © 2021 Bin Shang. All rights reserved.
//



#import "NSPersonNameComponentsFormatter+Chain.h"

@implementation NSPersonNameComponentsFormatter (Chain)

- (NSPersonNameComponentsFormatter * (^)(NSPersonNameComponentsFormatterStyle))styleChain{
    return ^(NSPersonNameComponentsFormatterStyle value) {
        self.style = value;
        return self;
    };
}

- (NSPersonNameComponentsFormatter * (^)(BOOL))phoneticChain{
    return ^(BOOL value) {
        self.phonetic = value;
        return self;
    };
}


@end



@implementation NSPersonNameComponents (Chain)

- (NSPersonNameComponents * (^)(NSString * _Nonnull))namePrefixChain{
    return ^(NSString * value) {
        self.namePrefix = value;
        return self;
    };
}

- (NSPersonNameComponents * (^)(NSString * _Nonnull))givenNameChain{
    return ^(NSString * value) {
        self.givenName = value;
        return self;
    };
}

- (NSPersonNameComponents * (^)(NSString * _Nonnull))middleNameChain{
    return ^(NSString * value) {
        self.middleName = value;
        return self;
    };
}

- (NSPersonNameComponents * (^)(NSString * _Nonnull))familyNameChain{
    return ^(NSString * value) {
        self.familyName = value;
        return self;
    };
}

- (NSPersonNameComponents * (^)(NSString * _Nonnull))nameSuffixChain{
    return ^(NSString * value) {
        self.nameSuffix = value;
        return self;
    };
}

- (NSPersonNameComponents * (^)(NSString * _Nonnull))nicknameChain{
    return ^(NSString * value) {
        self.nickname = value;
        return self;
    };
}

- (NSPersonNameComponents * (^)(NSPersonNameComponents * _Nonnull))phoneticRepresentationChain{
    return ^(NSPersonNameComponents * value) {
        self.phoneticRepresentation = value;
        return self;
    };
}

- (NSString * (^)(NSPersonNameComponentsFormatter * _Nonnull))stringByChain{
    return ^(NSPersonNameComponentsFormatter * value) {
        NSString *result = [value stringFromPersonNameComponents:self];
        return result;
    };
}


@end
