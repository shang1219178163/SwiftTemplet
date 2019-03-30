//
//  BNOperationStateView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/26.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SnapKit

class BNOperationStateView: UIView {

    weak var parController: UIViewController?
    
    var type: Int = 0{
        willSet {
           DDLog(newValue)
            
            var topImage = "icon_operation_noPermisssion"
            var topTitle = "无权限"
            var topTitleColor = "#df504c"
            var topBgViewColor = "#ffeaed"

            var tipInfo = "您无权限运营"

            switch newValue {
            case 1://未审核
                topTitle = "无权限"
                topImage = "icon_car_red_ban"
                tipInfo = "您无权限运营"
                topTitleColor = "#df504c"
                topBgViewColor = "#ffeaed"
                
            case 2://未运营
                topTitle = "未运营"
                topImage = "icon_car_gray"
                tipInfo = "目前未参与运营"
                topTitleColor = "#999999"
                topBgViewColor = "#eeeeee"

            case 3://蓄车中
                topTitle = "蓄车中"
                topImage = "icon_car_orange"
                tipInfo = "已等待" + "1小时3分钟"
                topTitleColor = "#f67722"
                topBgViewColor = "#fff6d3"
                
            case 4://待接客
                topTitle = "待接客"
                topImage = "icon_operation_waitClient"
                topTitleColor = "#f67722"
                topBgViewColor = "#fff6d3"
                
//                let tipInfo = getAttString("请于12:32前到达T2地上停车场", textTaps: ["12:32","T2地上停车场"], tapColor: UIColor.red)
                let tipInfo = getAttString("请于12:32前到达T2地上停车场", textTaps: ["12:32","T2地上停车场"], font: 18, tapFont: 18, color: .black, tapColor: UIColorHex(topTitleColor), alignment: .center)
                label.attributedText = tipInfo;
                
            case 5://接客中
                topTitle = "接客中"
                topImage = "icon_operation_waitClient"
                tipInfo = "已到达T2地上停车场"
                topTitleColor = "#f67722"
                topBgViewColor = "#fff6d3"

            case 6://运客中
                topTitle = "正在运客"
                topImage = "icon_carLeft_green"
                topTitleColor = "#2dae70"
                topBgViewColor = "#effff7"

                
            default://无权限
                topTitle = "无权限"
                topImage = "icon_car_red_ban"
            }

            topIcon.image = UIImageNamed(topImage)
            topLabel.textColor = UIColorHex(topTitleColor)
            topLabel.text = topTitle + "- \(newValue)"
            topBgView.backgroundColor = UIColorHex(topBgViewColor)
            if [4,].contains(newValue) == false {
                label.text = tipInfo
            }
            
            setNeedsLayout()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(operationView3)
        addSubview(operationView5)
        addSubview(operationView6)

        addSubview(topBgView)
        addSubview(topIcon)
        addSubview(topLabel)
        addSubview(label)
        
        label.backgroundColor = UIColor.green
    }
    
    convenience init(frame: CGRect, parController: UIViewController!) {
        self.init(frame: frame)
        self.parController = parController
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnBgViewH: CGFloat = 50
        topBgView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(btnBgViewH)
        }
        
        topIcon.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.left.right.equalToSuperview()
            make.height.equalTo(20)
        }
        
        topLabel.snp.makeConstraints { (make) in
            make.top.equalTo(topIcon.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(20)
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(topBgView.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.bottom.equalToSuperview().offset(-kX_GAP)
        }
        
        operationView3.snp.makeConstraints { (make) in
            make.top.equalTo(topBgView.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.bottom.equalToSuperview().offset(-kX_GAP)
        }
        
        operationView3LabelOne.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        operationView3LabelTwo.snp.makeConstraints { (make) in
            make.top.equalTo(operationView3LabelOne.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(kY_GAP)
        }
        
        //
//        operationView5.snp.makeConstraints { (make) in
//            make.top.equalTo(topBgView.snp.bottom).offset(kPadding)
//            make.left.equalToSuperview()
//            make.right.bottom.equalToSuperview().offset(-kX_GAP)
//        }
        
//        sliderControlView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(kY_GAP)
//            make.left.right.equalToSuperview()
//            make.height.equalTo(40)
//        }

//        operationView5LabelOne.snp.makeConstraints { (make) in
//            make.top.equalTo(sliderControlView.snp.bottom).offset(kPadding)
//            make.left.right.equalTo(sliderControlView)
//            make.bottom.equalToSuperview().offset(-kY_GAP)
//        }
        operationView5.frame = CGRectMake(0, btnBgViewH, kScreenWidth - kX_GAP*2, 120)
        sliderControlView.frame = CGRectMake(0, kY_GAP, kScreenWidth - kX_GAP*2, 55);
        operationView5LabelOne.frame = CGRectMake(0, sliderControlView.frame.maxY+kY_GAP, kScreenWidth - kX_GAP*2, 25)

//        operationView6.isHidden = type == 6 ? false : true
//        label.isHidden = !operationView6.isHidden
        operationView6.snp.makeConstraints { (make) in
            make.edges.equalTo(label)
        }

        let width = (UIScreen.width - kX_GAP*2*2 - kPadding*2)/2.0
        threeLabView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(width)
        }

        lineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding)
            make.left.equalTo(threeLabView.snp.right).offset(kPadding - 0.5)
            make.bottom.equalToSuperview().offset(-kPadding)
            make.width.equalTo(1.0)
        }

        threeLabViewOne.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(threeLabView)
            make.left.equalTo(lineView.snp.right).offset(kPadding)
            make.width.equalTo(width)
        }

        label.isHidden = true
        operationView3.isHidden = true
        operationView5.isHidden = true
        operationView6.isHidden = true

        switch type {
        case 3:
            operationView3.isHidden = false
            
        case 5:
            operationView5.isHidden = false

            
        case 6:
            operationView6.isHidden = false
            
        default:
            label.isHidden = false
            
            break
        }
    }
    
    lazy var topBgView: UIView = {
        var view = UIView(frame: .zero)
        
        return view
    }()
    
    lazy var label: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "目前未参与运营";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.tag = 10;
        return view;
    }();
    
    
    lazy var topIcon: UIImageView = {
        var view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var topLabel: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "目前未参与运营";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.tag = 10;
        return view;
    }();

    /// 正在运客
    lazy var operationView6: UIView = {
        var view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addSubview(threeLabView)
        view.addSubview(threeLabViewOne)
        view.addSubview(lineView)
        
        return view
    }()
    
    lazy var threeLabView: BNThreeLabelView = {
        var view = BNThreeLabelView(frame: .zero)
        view.labelTop.text = "2.5"
        view.labelMid.text = "公里"
        view.labelBom.text = "标准2~60公里"

        return view
    }()
    
    lazy var threeLabViewOne: BNThreeLabelView = {
        var view = BNThreeLabelView(frame: .zero)
        view.labelTop.text = "32"
        view.labelMid.text = "分钟"
        view.labelBom.text = "标准20~60分钟"
        
        return view
    }()
    
    lazy var lineView: UIView = {
        var view = UIView(frame: .zero)
        view.backgroundColor = UIColorHex("#e5e5e5")
        return view
    }()
    
    /// 蓄车中
    lazy var operationView3: UIView = {
        var view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addSubview(operationView3LabelOne)
        view.addSubview(operationView3LabelTwo)
        
        return view
    }()
    
    lazy var operationView3LabelOne: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "已等待";
        view.textColor = UIColorHex("#444444");
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 15)
        return view;
    }();
    
    lazy var operationView3LabelTwo: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "1小时3分钟";
        view.textColor = UIColor.black;
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 30)

        return view;
    }();
    
    /// 接客中
    lazy var operationView5: UIView = {
        var view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.addSubview(sliderControlView)
        view.addSubview(operationView5LabelOne)
        
        return view
    }()
    
    //滑块
    lazy var sliderControlView: BNSliderControlView = {
        var view = BNSliderControlView(frame: .zero)
        view.text = "滑动开始运客";
        view.textFinish = "操作成功!";
        view.thumbImage = UIImageNamed("icon_carLeft_green");
        view.thumbFinishImage = UIImageNamed("icon_car_red");
        return view
    }()
    
    lazy var operationView5LabelOne: UILabel = {
        var view = UILabel(frame: .zero);
        view.text = "已到达...";
        view.textColor = UIColorHex("#444444");
        view.textAlignment = .center;
        view.font = UIFont.systemFont(ofSize: 13)
        
        return view;
    }();
}
