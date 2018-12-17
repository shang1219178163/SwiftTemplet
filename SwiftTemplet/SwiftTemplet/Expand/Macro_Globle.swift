
//
//  Macro_Globle.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/15.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

// MARK: -tag

let kTAG_LABEL = 100;
let kTAG_BTN = 200;
let kTAG_BTN_RightItem = 260;
let kTAG_BTN_BackItem = 261;

let kTAG_IMGVIEW = 300;
let kTAG_TEXTFIELD = 400;
let kTAG_TEXTVIEW = 500;
let kTAG_ALERT_VIEW = 600;
let kTAG_ACTION_SHEET = 700;
let kTAG_PICKER_VIEW = 800;
let kTAG_PICKER_DATE = 900;

let kTAG_VIEW = 1000;
let kTAG_VIEW_Segment = 1100;
let kTAG_VIEW_radio = 1200;
let kTAG_VIEW_Picture = 1300;


// MARK: -MacroGeometry与计算有关的尺寸属性

let kH_StatusBar: CGFloat = 20.0;
let kH_NaviagtionBar: CGFloat = 44.0;
let kH_TabBar: CGFloat = 49.0;

let kH_PickerView: CGFloat = 180.0;


let kX_GAP: CGFloat = 15.0;
let kY_GAP: CGFloat = 10.0;
let kPadding: CGFloat = 8.0;

let kW_LayerBorder: CGFloat = 0.5;
let kWH_ArrowRight: CGFloat = 25.0;

let kSize_Arrow = CGSize(width: 25.0, height: 25.0);

let kTimerValue = 65;
let kRatio_IDCard: CGFloat = 1.58;
let kAnimationDuration_Toast = 1.5;
let kAnimationDuration_Drop = 0.5;

let kH_CellHeight: CGFloat = 60.0;


let kW_item: CGFloat = 80.0;
let kW_progressView: CGFloat = 130.0;

let kH_LABEL: CGFloat = 25;
let kH_LABEL_TITLE: CGFloat = 30.0;
let kH_LABEL_SMALL: CGFloat = 20.0;

let kH_TEXTFIELD: CGFloat = 30.0;
let kH_LINE_VIEW: CGFloat =  1/3.0;
let kW_LINE_Vert: CGFloat =  3.0;


// MARK: -font

let kFZ_First =  18;
let kFZ_Second = 16;
let kFZ_Third =  14;
let kFZ_Fouth =  12;
let kFZ_Fifth =  10;

// MARK: -视图

let kIMG_arrowRight = "img_arrowRight_gray";
let kIMG_arrowDown = "img_arrowDown_black";
let kIMG_arrowBack = "img_arrowLeft_white";
let kIMG_arrowUp = "img_arrowUp_blue";

let kIMG_portrait = "img_portrait_N";
let kIMG_portrait_N = "img_portrait_N";
let kIMG_portrait_H = "img_portrait_H";
let kIMG_pictureAdd = "img_pictureAdd";
let kIMG_pictureDelete = "img_pictureDelete";

let kIMG_defaultFailed = "img_failedDefault";
let kIMG_defaultFailed_S = "img_failedDefault_S";
let kIMG_defaultPortrait = "img_portrait_N";

let kIMG_sexBoy = "img_sex_boy";
let kIMG_sexGril = "img_sex_gril";

let kIMG_elemetDec = "img_elemet_decrease";
let kIMG_elemetInc = "img_elemet_increase";

let kIMG_scan = "img_scan";
let kIMG_NFC = "img_NFC";

let kIMG_inquiry = "img_dialog_inquiry";
let kIMG_update = "img_dialog_update";
let kIMG_warning = "img_dialog_warning";

let kIMG_notice = "img_notice";
let kIMG_location_H = "img_location_H";
let kIMG_more = "img_more";

let kIMG_selected_NO = "btn_selected_NO";
let kIMG_selected_YES = "btn_selected_YES";
let kIMG_Add = "btn_add";

let kIMG_like_H = "img_like_H";
let kIMG_like_W = "img_like_W";

let kMsg_NetWorkRequesting = "网络请求中...";
let kMsg_NetWorkFailed = "网络请求失败,请稍后再试";
let kMsg_NetWorkNodata = "暂无数据";
let kMsg_NetWorkNoMoredata = "没有更多数据了";
let kMsg_NetWorkFailed_Params = "参数错误,请稍后再试";

let kMsg_Locationing = "定位中...";
let kMsg_LocationSuccess = "位置信息更新成功!";
let kMsg_LocationFailed = "定位失败,请稍后再试";
let kMsg_IDCardFailed = "身份证识别失败,请稍后再试";
let kMsg_IDCardSuccess = "身份证识别成功";


let kActionTitle_Know = "知道了";
let kActionTitle_Sure = "确定";
let kActionTitle_Cancell = "取消";
let kActionTitle_Delete = "删除";
let kActionTitle_Drop = "彻底删除";
let kActionTitle_Call = "呼叫";
let kActionTitle_Update = "立即升级";

let kActionTitle_Collect = "收藏";
let kActionTitle_Recover = "恢复";


//MARK: -通用

let kDes_week              =   "星期一,星期二,星期三,星期四,星期五,星期六,星期天";
let kDes_month             =   "正月, 二月, 三月, 四月, 五月, 六月, 七月, 八月,九月, 十月, 冬月, 腊月";
let kDes_day              =   "初一, 初二, 初三, 初四, 初五, 初六, 初七, 初八, 初九, 初十,十一, 十二, 十三, 十四, 十五, 十六, 十七, 十八, 十九, 二十, 廿一, 廿二, 廿三, 廿四, 廿五, 廿六, 廿七, 廿八, 廿九, 三十, 三十一";
