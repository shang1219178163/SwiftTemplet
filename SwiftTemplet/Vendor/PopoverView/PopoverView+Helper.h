//
//  PopoverView+Helper.h
//  AccessControlSystem
//
//  Created by Bin Shang on 2019/6/28.
//  Copyright © 2019 irain. All rights reserved.
//
/*
- (NSArray *)popoverlist{
    if (!_popoverlist) {
        //        NSArray * list = @[@"授权设备", @"认证方式", @"角色权限", @"锁定账号", @"重置密码", @"更新资料", @"删除账号",];
        NSArray * list = @[
                           @{
                               @"index": @"0",
                               @"title": @"授权设备",
                               @"controllerName": @"",
                               },
                           @{
                               @"index": @"1",
                               @"title": @"认证方式",
                               @"controllerName": @"",
                               },
                           @{
                               @"index": @"2",
                               @"title": @"角色权限",
                               @"controllerName": @"",
                               },
                           @{
                               @"index": @"3",
                               @"title": @"锁定账号",
                               @"controllerName": @"",
                               },
                           @{
                               @"index": @"4",
                               @"title": @"重置密码",
                               @"controllerName": @"",
                               },
                           @{
                               @"index": @"5",
                               @"title": @"更新资料",
                               @"controllerName": @"ACSUserInfoModifyController",
                               },
                           @{
                               @"index": @"6",
                               @"title": @"删除账号",
                               @"controllerName": @"",
                               },
                           ];
        
        NSMutableArray *marr = [NSMutableArray array];
        for (NSDictionary *dic in list) {
            PopoverItemModel *model = [[PopoverItemModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [marr addObject:model];
        }
        _popoverlist = marr.copy;
    }
    return _popoverlist;
}
 
 [PopoverView showView:item list:self.popoverlist handler:^(PopoverAction * _Nonnull action, PopoverItemModel * _Nonnull model) {
     DDLog(@"%@", action.title);

 }];
 
 */

#import "PopoverView.h"

@class PopoverItemModel;

NS_ASSUME_NONNULL_BEGIN

@interface PopoverView (Helper)

+ (void)showView:(UIView *)view titles:(NSArray<NSString *> *)titles block:(void (^)(PopoverView *popover))block handler:(void (^)(PopoverAction *action))handler;

+ (void)showView:(UIView *)view titles:(NSArray<NSString *> *)titles lockArrowDirection:(BOOL)lockArrowDirection  handler:(void (^)(PopoverAction *action))handler;

+ (void)showView:(UIView *)view list:(NSArray<PopoverItemModel *> *)list handler:(void (^)(PopoverAction *action, PopoverItemModel *model))handler;

@end


@interface PopoverItemModel : NSObject

@property(nonatomic, assign) NSString * _Nullable index;
@property(nonatomic, strong) NSString * title;
@property(nonatomic, strong) UIImage * _Nullable image;
@property(nonatomic, assign) BOOL hidden;
@property(nonatomic, strong) NSString * _Nullable vcName;

@property(nonatomic, strong) id _Nullable obj;

@end

NS_ASSUME_NONNULL_END
