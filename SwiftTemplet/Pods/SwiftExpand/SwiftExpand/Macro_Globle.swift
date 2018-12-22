
//
//  Macro_Globle.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/15.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


// MARK: -kSet

public let kSetNumber       =   "0123456789";
public let kSetFloat        =   "0123456789.";
public let kSetAlpha        =   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
public let kSetAlpha_Num    =   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
public let kSetAlpha_Float  =   "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.";

// MARK: -tag

public let kTAG_LABEL = 100;
public let kTAG_BTN = 200;
public let kTAG_RightItem = 260;
public let kTAG_BackItem = 261;

public let kTAG_IMGVIEW = 300;
public let kTAG_TEXTFIELD = 400;
public let kTAG_TEXTVIEW = 500;
public let kTAG_ALERT_VIEW = 600;
public let kTAG_ACTION_SHEET = 700;
public let kTAG_PICKER_VIEW = 800;
public let kTAG_PICKER_DATE = 900;

public let kTAG_VIEW = 1000;
public let kTAG_VIEW_Segment = 1100;
public let kTAG_VIEW_radio = 1200;
public let kTAG_VIEW_Picture = 1300;


// MARK: -MacroGeometry与计算有关的尺寸属性
public let kScreenWidth = UIScreen.main.bounds.width;
public let kScreenHeight = UIScreen.main.bounds.height;

public let kH_StatusBar: CGFloat = 20.0;
public let kH_NaviagtionBar: CGFloat = 44.0;
public let kH_TabBar: CGFloat = 49.0;

public let kH_PickerView: CGFloat = 180.0;


public let kX_GAP: CGFloat = 15.0;
public let kY_GAP: CGFloat = 10.0;
public let kPadding: CGFloat = 8.0;

public let kW_LayerBorder: CGFloat = 0.5;
public let kWH_ArrowRight: CGFloat = 25.0;

public let kSize_Arrow = CGSize(width: 25.0, height: 25.0);
public let kSize_BtnSelected = CGSize(width: 35.0, height: 35.0);

public let kTimerValue = 65;
public let kRatio_IDCard: CGFloat = 1.58;
public let kAnimationDuration_Toast = 1.5;
public let kAnimationDuration_Drop = 0.5;

public let kH_CellHeight: CGFloat = 60.0;


public let kW_item: CGFloat = 80.0;
public let kW_progressView: CGFloat = 130.0;

public let kH_LABEL: CGFloat = 25;
public let kH_LABEL_TITLE: CGFloat = 30.0;
public let kH_LABEL_SMALL: CGFloat = 20.0;

public let kH_TEXTFIELD: CGFloat = 30.0;
public let kH_LINE_VIEW: CGFloat =  1/3.0;
public let kW_LINE_Vert: CGFloat =  3.0;


// MARK: -font

public let kFZ_First =  18;
public let kFZ_Second = 16;
public let kFZ_Third =  14;
public let kFZ_Fouth =  12;
public let kFZ_Fifth =  10;

// MARK: -视图

public let kIMG_arrowRight = "img_arrowRight_gray";
public let kIMG_arrowDown = "img_arrowDown_black";
public let kIMG_arrowBack = "img_arrowLeft_white";
public let kIMG_arrowUp = "img_arrowUp_blue";

public let kIMG_portrait = "img_portrait_N";
public let kIMG_portrait_N = "img_portrait_N";
public let kIMG_portrait_H = "img_portrait_H";
public let kIMG_pictureAdd = "img_pictureAdd";
public let kIMG_pictureDelete = "img_pictureDelete";

public let kIMG_defaultFailed = "img_failedDefault";
public let kIMG_defaultFailed_S = "img_failedDefault_S";
public let kIMG_defaultPortrait = "img_portrait_N";

public let kIMG_sexBoy = "img_sex_boy";
public let kIMG_sexGril = "img_sex_gril";

public let kIMG_elemetDec = "img_elemet_decrease";
public let kIMG_elemetInc = "img_elemet_increase";

public let kIMG_scan = "img_scan";
public let kIMG_NFC = "img_NFC";

public let kIMG_inquiry = "img_dialog_inquiry";
public let kIMG_update = "img_dialog_update";
public let kIMG_warning = "img_dialog_warning";

public let kIMG_notice = "img_notice";
public let kIMG_location_H = "img_location_H";
public let kIMG_more = "img_more";

public let kIMG_selected_NO = "btn_selected_NO";
public let kIMG_selected_YES = "btn_selected_YES";
public let kIMG_Add = "btn_add";

public let kIMG_like_H = "img_like_H";
public let kIMG_like_W = "img_like_W";

public let kMsg_NetWorkRequesting = "网络请求中...";
public let kMsg_NetWorkFailed = "网络请求失败,请稍后再试";
public let kMsg_NetWorkNodata = "暂无数据";
public let kMsg_NetWorkNoMoredata = "没有更多数据了";
public let kMsg_NetWorkFailed_Params = "参数错误,请稍后再试";

public let kMsg_Locationing = "定位中...";
public let kMsg_LocationSuccess = "位置信息更新成功!";
public let kMsg_LocationFailed = "定位失败,请稍后再试";
public let kMsg_IDCardFailed = "身份证识别失败,请稍后再试";
public let kMsg_IDCardSuccess = "身份证识别成功";


public let kActionTitle_Know = "知道了";
public let kActionTitle_Sure = "确定";
public let kActionTitle_Cancell = "取消";
public let kActionTitle_Delete = "删除";
public let kActionTitle_Drop = "彻底删除";
public let kActionTitle_Call = "呼叫";
public let kActionTitle_Update = "立即升级";

public let kActionTitle_Collect = "收藏";
public let kActionTitle_Recover = "恢复";

public let kNIl_TEXT            =   "--";

//MARK: -通用

public let kDes_week              =   "星期一,星期二,星期三,星期四,星期五,星期六,星期天";
public let kDes_month             =   "正月, 二月, 三月, 四月, 五月, 六月, 七月, 八月,九月, 十月, 冬月, 腊月";
public let kDes_day              =   "初一, 初二, 初三, 初四, 初五, 初六, 初七, 初八, 初九, 初十,十一, 十二, 十三, 十四, 十五, 十六, 十七, 十八, 十九, 二十, 廿一, 廿二, 廿三, 廿四, 廿五, 廿六, 廿七, 廿八, 廿九, 三十, 三十一";
