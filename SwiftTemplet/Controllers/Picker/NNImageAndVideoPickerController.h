//
//  NNImageAndVideoPickerController.h
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/16.
//  Copyright © 2020 BN. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NNImageAndVideoPickerController : UIViewController

// 设置开关
@property (assign, nonatomic) BOOL showTakePhoto;  ///< 允许拍照
@property (assign, nonatomic) BOOL showTakeVideo;  ///< 允许拍视频
@property (assign, nonatomic) BOOL sortAscending;     ///< 照片排列按修改时间升序
@property (assign, nonatomic) BOOL allowPickingVideo; ///< 允许选择视频
@property (assign, nonatomic) BOOL allowPickingImage; ///< 允许选择图片
@property (assign, nonatomic) BOOL allowPickingGif;
@property (assign, nonatomic) BOOL allowPickingOriginalPhoto; ///< 允许选择原图
@property (assign, nonatomic) BOOL showSheet; ///<
@property (assign, nonatomic) NSInteger maxCount;  ///< 照片最大可选张数，设置为1即为单选模式
@property (assign, nonatomic) NSInteger columnNumber;
@property (assign, nonatomic) BOOL allowCrop;
@property (assign, nonatomic) BOOL needCircleCrop;
@property (assign, nonatomic) BOOL allowPickingMuitlpleVideo;
@property (assign, nonatomic) BOOL showSelectedIndex;
///默认黑色
@property (strong, nonatomic) UIColor *navigationBarTintColor;

@property (nonatomic, copy) void (^didFinishPickerBlock)(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto);

- (void)show;

@end

NS_ASSUME_NONNULL_END
