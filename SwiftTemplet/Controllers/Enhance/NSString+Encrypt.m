//
//  NSString+Encrypt.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/29.
//  Copyright © 2020 BN. All rights reserved.
//

#import "NSString+Encrypt.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Encrypt)

- (NSString *)SHA1 {
    unsigned int outputLength = CC_SHA1_DIGEST_LENGTH;
    unsigned char output[outputLength];
    
    CC_SHA1(self.UTF8String, (unsigned int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], output);
    return [self toHexString:output length:outputLength];;
}

-(NSData *)SHA256Data{
    unsigned char hash[CC_SHA256_DIGEST_LENGTH];
    (void) CC_SHA256(self.UTF8String, (unsigned int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], hash);
    return ( [NSData dataWithBytes: hash length: CC_SHA256_DIGEST_LENGTH] );
}

- (NSString *)SHA256{
    unsigned int outputLength = CC_SHA256_DIGEST_LENGTH;
    unsigned char output[outputLength];
    
    CC_SHA256(self.UTF8String, (unsigned int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], output);
    return [self toHexString:output length:outputLength];;
}

- (NSString *)toHexString:(unsigned char*)data length:(unsigned int)length {
    NSMutableString *hash = [NSMutableString stringWithCapacity:length * 2];
    for (unsigned int i = 0; i < length; i++) {
        [hash appendFormat:@"%02x", data[i]];
        data[i] = 0;
    }
    return hash;
}

+(NSString *)encryptAESWithPlainText:(NSString *)plaintext{
    if (!plaintext) {
        return @"";
    }
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString *sha1 = [bundleIdentifier SHA1];
    NSData *key = [sha1 SHA256Data];
    NSData * encryptData = [self AEC256EncryptWithPlainText:plaintext withKey:key];
    NSString *base64String = [encryptData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return base64String;
}

+(NSString *)decryptAESWithCipherText:(NSString *)ciphertexts{
    if (!ciphertexts) {
        return @"";
    }
    
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString *sha1 = [bundleIdentifier SHA1];
    NSData *key = [sha1 SHA256Data];
    
    NSData *cipherData = [[NSData alloc]initWithBase64EncodedString:ciphertexts options:0];
    NSData *data = [self AES256DecryptWithCipherData:cipherData withKey:key];

    NSString *plainText = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return plainText;
}
/*AES256加密方法*/
+ (NSData *)AEC256EncryptWithPlainText:(NSString *)plainText withKey:(NSData *)key{
    if (plainText == nil) {
        return nil;
    }
    NSData *plainData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));

    NSUInteger dataLength = [plainData length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    bzero(buffer, sizeof(buffer));
    
    size_t numBytesEncrypted = 0;
    
    unsigned char *iv = malloc( 16 * sizeof(unsigned char) );
    [key getBytes:iv length:16];

    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          kCCAlgorithmAES,
                                          kCCOptionPKCS7Padding,
                                          [key bytes],
                                          [key length],
                                          iv /* initialization vector (optional) */,
                                          [plainData bytes], dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesEncrypted);
    NSData *encryptData;
    if (cryptStatus == kCCSuccess) {
         encryptData = [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
//     free the buffer;
//    free(buffer);
    free(iv);
    return encryptData;
}
/*AES256解密方法*/
+ (NSData *)AES256DecryptWithCipherData:(NSData *)cipherData withKey:(NSData *)key{
    if (!cipherData) {
        return nil;
    }
    // 'key' should be 32 bytes for AES256, will be null-padded otherwise
    char keyPtr[kCCKeySizeAES256+1]; // room for terminator (unused)
    bzero(keyPtr, sizeof(keyPtr)); // fill with zeroes (for padding)
    
    NSUInteger dataLength = [cipherData length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    unsigned char *iv = malloc( 16 * sizeof(unsigned char) );
    [key getBytes:iv length:16];
    
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmAES,
                                          kCCOptionPKCS7Padding,
                                          [key bytes],
                                          [key length],
                                          iv ,/* initialization vector (optional) */
                                          [cipherData bytes],
                                          dataLength, /* input */
                                          buffer, bufferSize, /* output */
                                          &numBytesDecrypted);
    NSData *encryptData;
    if (cryptStatus == kCCSuccess) {
         encryptData= [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
    }
//    free(buffer);
     //free the buffer;
    free(iv);
    return encryptData;
}


@end
