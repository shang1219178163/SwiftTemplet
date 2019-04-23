//
//  PickerViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/28.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class PickerViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
        
    var pickerView:UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = createBtnBarItem("picker", image: nil, isLeft: false, isHidden: false) { (control) in
            self.customPickerView.show();
            self.btn.transform = CGAffineTransform.identity

        }
        
        itemView.frame = CGRect(x: kX_GAP, y: kY_GAP - 100, width: kScreenWidth - kX_GAP*2, height: 100.0)
        view.addSubview(itemView)
        
        // 创建一个按钮，点击按钮获得选择框被选中的索引
        view.addSubview(btn)

        cardView.frame = CGRectMake(kX_GAP, itemView.frame.maxY + kY_GAP, kScreenWidth - kX_GAP*2, 170)
        view.addSubview(cardView)
        
        cardViewOne.frame = CGRectMake(kX_GAP, cardView.frame.maxY + kY_GAP, kScreenWidth - kX_GAP*2, 170)
        view.addSubview(cardViewOne)
        
        payCardView.frame = CGRectMake(kX_GAP, cardViewOne.frame.maxY + kY_GAP, kScreenWidth - kX_GAP*2, 120)
        view.addSubview(payCardView)
        
        mileageCardView.frame = CGRectMake(kX_GAP, payCardView.frame.maxY + kY_GAP, kScreenWidth - kX_GAP*2, 120)
        view.addSubview(mileageCardView)
                
        cardView.addGestureTap { (control) in
            self.versionView.show();
        }

//        view.getViewLayer()
    }
    
    func setupPickerView() -> Void {
        // 创建UIPickerView控件
        pickerView = UIPickerView()
        
        DDLog(pickerView.frame)
        
        let ration: CGFloat = kScreenWidth/320.0*216
        pickerView.frame = CGRectMake(0, kY_GAP, kScreenWidth, ration)
        //        view.addSubview(pickerView)
        
        // 设置代理和数据源
        pickerView.delegate = self;
        pickerView.dataSource = self
        
        // 设置选择框的默认值
        pickerView.selectRow(1, inComponent: 0, animated: true)
        pickerView.selectRow(2, inComponent: 1, animated: true)
        pickerView.selectRow(3, inComponent: 2, animated: true)
    }
    
    lazy var btn: UIButton = {
        let view = UIButton(frame: CGRectMake(0,0,100,30))
        view.center = self.view.center
        view.backgroundColor = UIColor.blue
        view.setTitle("获取信息", for: .normal)
        
        view.addActionHandler({ (control) in
            if self.pickerView != nil {
                return
            }
            print("被选中的索引为：\(self.pickerView.selectedRow(inComponent: 0))、\(self.pickerView.selectedRow(inComponent: 1))、\(self.pickerView.selectedRow(inComponent: 2))")
            view.transform = view.transform.translatedBy(x: 0, y: -20)

        }, for: .touchUpInside)
        
        return view
    }()
    
    // MARK: UIPickerViewDataSource
    /**
     设置选择框的列数
     */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    /**
     设置选择框的行数
     */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
    
    // MARK:UIPickerViewDelegate
    /**
     设置选择框各选项的内容
     */
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(component) + "-" + String(row)
    }
    
    /// itemsView
    lazy var itemView: BNItemsView = {
        var view = BNItemsView(frame: .zero)
        
        var list:[String] = []
        for i in 0...4 {
            list.append("\(i)")
        }
        view.items = list
        
        
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any)
                
                switch btn.tag {
                case 0:
                    self.datePicker.show()
                    
                default:
                    break
                }
                
            }
        })
        return view;
    }()
    
    ///
    lazy var customPickerView: BNPickerView = {
        var view = BNPickerView(frame: .zero)
        view.pickerView.delegate = self;
        view.pickerView.dataSource = self
        view.block({ (pickerView, tag) in
            DDLog(tag)
        })
        return view
    }()
    
    //MARK: -lazy
    lazy var datePicker: BNDatePicker = {
        var view = BNDatePicker();
        view.block({ (sender, idx) in
            DDLog(view,sender.datePicker.date,idx);
          
        })
        return view;
    }()
    
    lazy var cardView: BNVehicleInfoCardView = {
        var view = BNVehicleInfoCardView(frame: .zero)
        view.imgViewRight.isHidden = true
        
        view.imgView.image = UIImageNamed("bug")
        view.labelLeft.text = "陕A-U2200"
        view.labelSub.text = "222222"
        view.labelSubOne.text = "333333"
        
//        view.gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
//        view.gradientLayer.colors = [UIColorHex("#999999").withAlphaComponent(0.8).cgColor, UIColorHex("#999999").cgColor]

        return view
    }()
    
    lazy var cardViewOne: BNVehicleInfoCardView = {
        var view = BNVehicleInfoCardView(frame: .zero)
        view.imgViewRight.isHidden = true
        
        view.imgView.image = UIImageNamed("bug")
        view.labelLeft.text = "陕A-U2200"
        view.labelSub.text = "222222"
        view.labelSubOne.text = "333333"
        
        view.type = 1
        return view
    }()
    
    lazy var payCardView: BNRecordCardView = {
        var view = BNRecordCardView(frame: .zero)

        view.labelLeft.text = "总支付金额(元)"
        view.labelLeftSub.text = "1000"
        view.labelRight.text = "总支付次数"
        view.labelRightSub.text = "200"

        view.gradientLayer.colors = [UIColorHex("#1a965a").withAlphaComponent(1.0).cgColor, UIColorHex("#1a965a").withAlphaComponent(1.0).cgColor]

        return view
    }()
    
    lazy var  mileageCardView: BNRecordCardView = {
        var view = BNRecordCardView(frame: .zero)
        
        view.labelLeft.text = "总次数"
        view.labelLeftSub.text = "200"
        view.labelRight.text = "已补贴次数"
        view.labelRightSub.text = "168"
        view.type = 1;
        

        return view
    }()
    
    lazy var versionView: BNUpdateVersionView = {
        var view = BNUpdateVersionView(frame: .zero)
//        view.label.text = "发现新版本"
//        view.labelOne.text = "V1.2.0"
//        view.labelTwo.text = "更新内容:"
//        view.labelThree.text = "1.界面改版,新增消息通知\n2.新增充值功能\n3.部分界面优化"
        view.labelThree.text = "kkjsdaf;a;f;asdkpwfwaiefkdsafsdak'fad'fkldslfskl;adkf;lsdvmnvnb离开家金坷垃 几节课阿斯蒂芬就物品";

        view.type = 1
        view.block({ (versionView, idx) in
            DDLog(idx)
        })
        return view
    }()
}

