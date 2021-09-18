//
//  AudioViewController.m
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/18.
//  Copyright © 2021 BN. All rights reserved.
//

#import "AudioViewController.h"
#import <Photos/Photos.h>

@interface AudioViewController ()

@end

@implementation AudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)hanldleAsset:(PHAsset *)asset{
    PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
    options.version = PHVideoRequestOptionsVersionOriginal;
    [[PHImageManager defaultManager] requestAVAssetForVideo:asset
                                                    options:options
                                              resultHandler:^(AVAsset *asset, AVAudioMix *audioMix, NSDictionary *info) {
        if ([asset isKindOfClass:[AVURLAsset class]]) {
            AVURLAsset *urlAsset = (AVURLAsset*)asset;
            NSNumber *size;
            [urlAsset.URL getResourceValue:&size forKey:NSURLFileSizeKey error:nil];
            NSLog(@"size is %f",[size floatValue]/(1024.0*1024.0));
     }
    }];
    
//    [PHImageManager.defaultManager requestExportSessionForVideo:asset options:AVAssetExportPresetMediumQuality exportPreset:AVAssetExportPresetMediumQuality resultHandler:^(AVAssetExportSession * _Nullable exportSession, NSDictionary * _Nullable info) {
//    }];
}

//- (void)methodName {
//    PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
//    options.version = PHImageRequestOptionsVersionCurrent;
//    options.deliveryMode = PHVideoRequestOptionsDeliveryModeAutomatic;
//
//    PHImageManager *manager = [PHImageManager defaultManager];
//    [manager requestExportSessionForVideo:asset options:options exportPreset:AVAssetExportPresetMediumQuality resultHandler:^(AVAssetExportSession * _Nullable exportSession, NSDictionary * _Nullable info)
//
//    NSString *savePath = [self createPathWithFileName:fileName direName:fileDir rootDir:rootDir];
//
//    exportSession.outputURL = [NSURL fileURLWithPath:savePath];
//    exportSession.shouldOptimizeForNetworkUse = NO;
//    exportSession.outputFileType = AVFileTypeMPEG4;
//    [exportSession exportAsynchronouslyWithCompletionHandler:^{
//
//    switch ([exportSession status]) {
//
//    case AVAssetExportSessionStatusFailed:
//
//    {
//
//    if (failure) {
//
//    NSError *e = [exportSession error];
//
//    NSLog(@"%@",e);
//
//    failure([[exportSession error] localizedDescription]);
//
//    }
//
//    break;
//
//    }
//
//    case AVAssetExportSessionStatusCancelled:
//
//    {
//
//    if (cancell) {
//
//    cancell();
//
//    }
//
//    break;
//
//    }
//
//    case AVAssetExportSessionStatusCompleted:
//
//    {
//
//    if (result) {
//
//    result(savePath,[savePath lastPathComponent]);
//
//    }
//
//    break;
//
//    }
//
//    default:
//
//    break;
//
//    }
//
//    } ];
//
//    }];
//}

@end
