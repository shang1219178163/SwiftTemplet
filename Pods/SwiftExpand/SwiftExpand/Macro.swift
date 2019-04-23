
//
//  Macro.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/15.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

// MARK: -系统私有类
public let kUIButtonBarButton: String          = "UIButtonBarButton";
public let kUIModernBarButton: String          = "_UIModernBarButton";
public let kUITabBarButton: String             = "UITabBarButton";
public let kUITabBarSwappableImageView: String = "UITabBarSwappableImageView";

// MARK: -kSet
/// 0123456789
public let kSetNumber: String      =   "0123456789";
/// 0123456789.
public let kSetFloat: String       =   "0123456789.";
/// ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
public let kSetAlpha: String       =   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
/// ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
public let kSetAlpha_Num: String   =   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
/// ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.
public let kSetAlpha_Float: String =   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.";

// MARK: -kArr
/// avg.floatValue
public let kArr_avg_float: String       = "@avg.floatValue";
/// sum.intValue
public let kArr_sum_inter: String       = "@sum.intValue";
/// max.intValue
public let kArr_max_inter: String       = "@max.intValue";
/// min.intValue
public let kArr_min_inter: String       = "@min.intValue";
/// sum.floatValue
public let kArr_sum_float: String       = "@sum.floatValue";
/// max.floatValue
public let kArr_max_float: String       = "@max.floatValue";
/// min.floatValue
public let kArr_min_float: String       = "@min.floatValue";
/// uppercaseString
public let kArr_upper_list: String      = "uppercaseString";
/// lowercaseString
public let kArr_lower_list: String      = "lowercaseString";
/// distinctUnionOfArrays.self(数组内部去重)
public let kArrs_unionDist_list: String = "@distinctUnionOfArrays.self";
/// unionOfArrays.self
public let kArrs_union_list: String     = "@unionOfArrays.self";

// MARK: -tag

public let kTAG_LABEL: Int        = 100;
public let kTAG_BTN: Int          = 200;
public let kTAG_RightItem: Int    = 260;
public let kTAG_BackItem: Int     = 261;

public let kTAG_IMGVIEW: Int      = 300;
public let kTAG_TEXTFIELD: Int    = 400;
public let kTAG_TEXTVIEW: Int     = 500;
public let kTAG_ALERT_VIEW: Int   = 600;
public let kTAG_ACTION_SHEET: Int = 700;
public let kTAG_PICKER_VIEW: Int  = 800;
public let kTAG_PICKER_DATE: Int  = 900;

public let kTAG_VIEW: Int         = 1000;
public let kTAG_VIEW_Segment: Int = 1100;
public let kTAG_VIEW_radio: Int   = 1200;
public let kTAG_VIEW_Picture: Int = 1300;


// MARK: -计算有关的尺寸属性
/// 屏幕宽度
public let kScreenWidth: CGFloat           = UIScreen.main.bounds.width;
/// 屏幕高度
public let kScreenHeight: CGFloat          = UIScreen.main.bounds.height;
/// 顶部状态栏 20
public let kStatusBarHeight: CGFloat       = 20.0;
/// 导航栏高 44
public let kNaviBarHeight: CGFloat         = 44.0;
public let kBarHeight: CGFloat             = 64.0;
/// 底部tabBar高度 49
public let kTabBarHeight: CGFloat          = 49.0;
/// 选择器默认高度 180
public let kPickerViewHeight: CGFloat      = 180.0;

public let kX_GAP: CGFloat                 = 15.0;
public let kY_GAP: CGFloat                 = 10.0;
/// 视图布局最小间隙
public let kPadding: CGFloat               = 8.0;
/// 右指箭头尺寸
public let kSizeArrow: CGSize              = CGSize(width: 25.0, height: 35.0);
///
public let kSizeSelected: CGSize           = CGSize(width: 35.0, height: 35.0);

/// 身份证宽高比
public let kRatioIDCard: CGFloat           = 0.63;
/// 视图展示动画时间 0.3
public let kDurationShow: TimeInterval     = 0.3;
/// 视图展示动画时间 0.5
public let kDurationDrop: TimeInterval     = 0.5;
/// 视图展示动画时间 1.5
public let kDurationToast: TimeInterval    = 1.5;
/// 视图展示动画时间 5.0
public let kDurationRotation: TimeInterval = 5.0;
/// Cell默认高度
public let kH_CellHeight: CGFloat          = 60.0;

public let kW_item: CGFloat                = 80.0;
public let kW_progressView: CGFloat        = 130.0;
/// UILabel 高度25
public let kH_LABEL: CGFloat               = 25;
/// UILabel 高度30
public let kH_LABEL_TITLE: CGFloat         = 30.0;
/// UILabel 高度20
public let kH_LABEL_SMALL: CGFloat         = 20.0;
/// UITextField 高度30
public let kH_TEXTFIELD: CGFloat           = 30.0;
/// UITableViewSeparatorView高0.33
public let kH_LINE_VIEW: CGFloat           = 1/3.0;
public let kW_LINE_Vert: CGFloat           = 3.0;
/// 视图layer线宽 0.5
public let kW_LayerBorder: CGFloat         = 0.5;


// MARK: -font

public let kFontSize18: CGFloat  =  18;
public let kFontSize16: CGFloat  = 16;
public let kFontSize14: CGFloat  =  14;
public let kFontSize12: CGFloat  =  12;
public let kFontSize10: CGFloat  =  10;

// MARK: -视图

public let kIMG_arrowRight: String      = "img_arrowRight_gray";
public let kIMG_arrowDown: String       = "img_arrowDown_black";
public let kIMG_arrowDown_white: String = "img_arrowDown_white";

public let kIMG_arrowBack: String       = "img_arrowLeft_white";
public let kIMG_arrowUp: String         = "img_arrowUp_blue";

public let kIMG_portrait: String        = "img_portrait_N";
public let kIMG_portrait_N: String      = "img_portrait_N";
public let kIMG_portrait_H: String      = "img_portrait_H";
/// 图片添加
public let kIMG_pictureAdd: String      = "img_pictureAdd";
/// 图片删除
public let kIMG_pictureDelete: String   = "img_pictureDelete";
/// 图片加载失败
public let kIMG_defaultFailed: String   = "img_failedDefault";
/// 图片加载失败(小)
public let kIMG_defaultFailed_S: String = "img_failedDefault_S";
public let kIMG_defaultPortrait: String = "img_portrait_N";
/// 性别男
public let kIMG_sexBoy: String          = "img_sex_boy";
/// 性别女
public let kIMG_sexGril: String         = "img_sex_gril";
/// 按钮减
public let kIMG_elemetDec: String       = "img_elemet_decrease";
/// 按钮加
public let kIMG_elemetInc: String       = "img_elemet_increase";
/// 扫描图标
public let kIMG_scan: String            = "img_scan";
/// NFC图标
public let kIMG_NFC: String             = "img_NFC";

public let kIMG_inquiry: String         = "img_dialog_inquiry";
public let kIMG_update: String          = "img_dialog_update";
public let kIMG_warning: String         = "img_dialog_warning";

public let kIMG_notice: String          = "img_notice";
public let kIMG_location_H: String      = "img_location_H";
public let kIMG_more: String            = "img_more";

public let kIMG_selected_NO: String     = "btn_selected_NO";
public let kIMG_selected_YES: String    = "btn_selected_YES";
public let kIMG_Add: String             = "btn_add";

public let kIMG_like_H: String          = "img_like_H";
public let kIMG_like_W: String          = "img_like_W";

public let kMsg_NetWorkRequesting: String    = "网络请求中...";
public let kMsg_NetWorkFailed: String        = "网络请求失败,请稍后再试";
public let kMsg_NetWorkNodata: String        = "暂无数据";
public let kMsg_NetWorkNoMoredata: String    = "没有更多数据了";
public let kMsg_NetWorkFailed_Params: String = "参数错误,请稍后再试";

public let kMsg_Locationing: String          = "定位中...";
public let kMsg_LocationSuccess: String      = "位置信息更新成功!";
public let kMsg_LocationFailed: String       = "定位失败,请稍后再试";
public let kMsg_IDCardFailed: String         = "身份证识别失败,请稍后再试";
public let kMsg_IDCardSuccess: String        = "身份证识别成功";


public let kActionTitle_Know: String    = "知道了";
public let kActionTitle_Sure: String    = "确定";
public let kActionTitle_Cancell: String = "取消";
public let kActionTitle_Delete: String  = "删除";
public let kActionTitle_Drop: String    = "彻底删除";
public let kActionTitle_Call: String    = "呼叫";
public let kActionTitle_Update: String  = "立即升级";

public let kActionTitle_Collect: String = "收藏";
public let kActionTitle_Recover: String = "恢复";

public let kNilText: String     = "--";
public let kSeparateStr: String = ",";
public let kAsterisk: String    = "*";
public let kBlankHalf: String   = "  ";
public let kBlankOne: String    = "    ";
public let kBlankTwo: String    = "        ";
public let kBlankFour: String   = "                ";

//MARK: -通用

/// 一周七天
public let kDes_week: String  = "星期一,星期二,星期三,星期四,星期五,星期六,星期天";
/// 一年十二月
public let kDes_month: String = "正月, 二月, 三月, 四月, 五月, 六月, 七月, 八月,九月, 十月, 冬月, 腊月";
/// 一月31天
public let kDes_day: String   = "初一, 初二, 初三, 初四, 初五, 初六, 初七, 初八, 初九, 初十,十一, 十二, 十三, 十四, 十五, 十六, 十七, 十八, 十九, 二十, 廿一, 廿二, 廿三, 廿四, 廿五, 廿六, 廿七, 廿八, 廿九, 三十, 三十一";

/// Debug模式日志打印
public func DDLog(_ msgs: Any..., fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
    let params = msgs.compactMap{ "\($0)" }.joined(separator: "\n__");
    let formatter = DateFormatter.format("yyyy-MM-dd HH:mm:ss.SSS");
    print(formatter.string(from: Date()),"\((fileName as NSString).lastPathComponent).\(methodName)[\(lineNumber)]:\n__\(params)")

    #endif
}

//func NNLog(FORMAT,...) {
//    let formatter = DateFormatter.format(f"yyyy-MM-dd HH:mm:ss.SSS");
//    fprintf(stderr,"%s【line -%d】%s %s\n", formatter.string(from: Date()), #line,(fileName as NSString).lastPathComponent,NSString.init(format: FORMAT, CVarArg).UTF8String,]);
//}

// 日志打印，支持传入不同类型的多个参数
//
// - Parameters:
//   - message: 内容
//   - file: 文件名
//   - function: 方法名
//   - line: 行号
//public func printLog(_ messages: Any..., file: String = #file, function: String = #function, line: Int = #line) {
//    #if DEBUG
//    let message = messages.compactMap{ "\($0)" }.joined(separator: "\n__")
//    print("\((file as NSString).lastPathComponent)[\(line)] - \(function): \n__\(message)")
//    #endif
//}


