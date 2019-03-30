//
//  EntryViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/11.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class EntryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    deinit {
        DDLog(1111)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 70;

//        _ScrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        tableView.tableFooterView = footerView
        view.addSubview(tableView);

        let btn = createBtnBarItem("custom", image: nil, isLeft: false, isHidden: false) { (sender) in
            if let btn = sender as? UIButton {
                DDLog(btn.titleLabel?.text)
                self.goController("CustomViewController", obj: nil, objOne: nil)
            }
        }
    
        view.addSubview(suspendBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        tableView.frame = view.bounds
    }
    
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.row]
        if (itemList[2] as! String) == "" {
            return  UITableViewAutomaticDimension;
        }
        let height = (itemList[2] as! String).cgFloatValue()
        return height
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        let value0 = itemList[0] as! String
        let value1 = itemList[1] as! String
        let value2 = itemList[2] as! String
        let value3 = itemList[3] as! String
        let value4 = itemList[4] as! String
        
        switch (itemList[1] as! String).intValue() {
        case 1:
            let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne
            cell.labelLeft.text = value0
            cell.labelRight.text = value4
            
            cell.isHidden = value2.cgFloatValue() > 0.0 ? false : true
            cell.getViewLayer()
            return cell
            
        case 102:
            let cell = UITableViewCellDatePicker.cellWithTableView(tableView) as! UITableViewCellDatePicker
            cell.labelLeft.text = value0
            cell.textfield.text = value4
            cell.textfield.textAlignment = .right
            cell.getViewLayer()

            return cell
            
        case 104:
            let cell = UITableViewCellSegment.cellWithTableView(tableView) as! UITableViewCellSegment
            cell.labelLeft.text = value0
            cell.segmentCtl.itemList = (itemList.last as! [String])
            cell.segmentCtl.addActionHandler({ (sender:UIControl) in
                if let control = sender as? UISegmentedControl {
                    DDLog(control.selectedSegmentIndex)
                }
            }, for: .valueChanged)
     
            cell.getViewLayer()
            
            return cell
            
        case 105:
            let cell = UITableViewCellStep.cellWithTableView(tableView) as! UITableViewCellStep
            cell.labelLeft.text = value0
            cell.ppBtn.minValue = 0
            cell.ppBtn.maxValue = 10
            //            cell.ppBtn.currentNumber = value4
            cell.ppBtn.currentNumber = "6"
            
            cell.textfield.textAlignment = .right
            cell.getViewLayer()
            return cell
            
        case 106:
            let cell = UITableViewCellTextField.cellWithTableView(tableView) as! UITableViewCellTextField
            cell.labelLeft.text = value0
            cell.textfield.asoryView(true, unitName: (itemList.last as! String))
            //            cell.textfield.rightView = nil;
            
            cell.textfield.textAlignment = .right
            
            cell.block { (sender:AnyObject) in
                if let textField = sender as? UITextField {
                    DDLog(textField.text as Any)
                }
            }
            cell.getViewLayer()
            return cell
            
        case 107:
            let cell = UITableViewCellTextView.cellWithTableView(tableView) as! UITableViewCellTextView
            cell.labelLeft.text = value0
            cell.type = 1;
            cell.textView.placeHolderTextView.text = "最多140字"
            cell.block { ( view:UITableViewCellTextView, text:String) in
                DDLog(text)
            }
            
            cell.getViewLayer()
            return cell
        case 108:
            let cell = UITableViewCellDateRange.cellWithTableView(tableView) as! UITableViewCellDateRange
            cell.dateRangeView.labTitle.text = value0
            cell.dateRangeView.block { (dateRangeView) in
                DDLog(dateRangeView.dateStart,dateRangeView.dateEnd)
                
            }
            cell.getViewLayer()
            return cell
            
        case 109:
            let cell = UITableViewCellSlider.cellWithTableView(tableView) as! UITableViewCellSlider
            cell.labelLeft.text = value0
            cell.sliderCtl.value = 50
            cell.sliderCtl.addActionHandler({ (sender:UIControl) in
                if let control = sender as? UISlider {
                    DDLog(control.value)
                }
            }, for: .valueChanged)

            cell.getViewLayer()
            
            return cell
            
        case 110:
            let cell = UITableViewCellSwitch.cellWithTableView(tableView) as! UITableViewCellSwitch
            cell.labelLeft.text = value0
//            cell.switchCtl.isOn = false
            cell.layoutType = 1
            cell.switchCtl.addActionHandler({ (sender:UIControl) in
                if let control = sender as? UISwitch {
                    DDLog(control.isOn)
                }
            }, for: .valueChanged)
            
//            cell.getViewLayer()
            
            return cell
            
        case 111:
            let cell = UITableViewCellSheet.cellWithTableView(tableView) as! UITableViewCellSheet
            cell.labelLeft.text = value0
            cell.itemList = ["阿里","腾讯","百度","谷歌",]
            cell.block { (title) in
                DDLog(title)
            }
            cell.getViewLayer()
            return cell
            
        case 112:
            let cell = UITableViewCellPickerView.cellWithTableView(tableView) as! UITableViewCellPickerView
            cell.labelLeft.text = value0
            cell.block { (view, title, obj) in
                DDLog(title,obj)
            }
            
            cell.getViewLayer()
            return cell
        case 115:
            let cell = UITableViewCellPhotoPicker.cellWithTableView(tableView) as! UITableViewCellPhotoPicker
            cell.defaultView.block { (view, list) in
                DDLog(list.count)
            }
            
            cell.getViewLayer()
            return cell
            
        case 150:
            let cell = UITableViewCellDefault.cellWithTableView(tableView) as! UITableViewCellDefault
            cell.defaultView.labelLeft.text = value0
            cell.defaultView.labelRight.text = value4
            cell.isHidden = value2.cgFloatValue() > 0.0 ? false : true
            cell.getViewLayer()
            return cell
            
        default:
            break
            
        }
        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        //MARK: -func
    func titleViewTap() -> Void {
        textField.text = "闭包的回调方法"
        
        let _ = textField.addGestureTap { (recognizer) in
            UIApplication.shared.keyWindow?.endEditing(true)
            UIApplication.shared.keyWindow?.rootViewController?.present(self.alertCtrl, animated: true, completion: nil)
            
            if let view = recognizer.view as? UITextField {
                UIView.animate(withDuration: 0.5, animations: {
                    view.rightView?.transform = (view.rightView?.transform.rotated(by:  CGFloat(Double.pi)))!
                    
                }, completion: nil)
            }
        }
        navigationItem.titleView = textField
    }
    
    lazy var textField: UITextField = {
        var view = UITextField(frame: .zero);
        view.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)
        view.textAlignment = .left;
        view.contentVerticalAlignment = .center;
        view.autocapitalizationType = .none;
        view.autocorrectionType = .no;
        view.clearButtonMode = .whileEditing;
        view.backgroundColor = .clear;
        view.returnKeyType = .done
        
        view.textColor = .white
        view.textAlignment = .center;
        view.asoryView(true, unitName: kIMG_arrowDown);
        return view
    }()
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        var alertController = UIAlertController.createSheet("请选择", items:nil, completion: { (action:UIAlertAction) in
            DDLog("完成取消")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.textField.rightView?.transform = .identity
                
            }, completion: nil)
            
        })
        return alertController
    }()
    
    //MARK: -Lazy Property
    lazy var allList: [[[String]]] = {
        var array: [[[String]]] = [
            [["卡数量  ", "1", "60.0", "", "cardName", ],
             ["充值数量", "105", "60.0", "", "validEndTime", ],
             ["结束时间", "102", "60.0", "", "balance", ],
             ["应付金额", "106", "60.0", "", "recharge",  "  元    "],
             ],
            [["内嵌车场  ", "1", "60.0", "", "cardName", "1",],
             ["卡类型  ", "1", "60.0", "", "cardName", ],
             ["结束日期", "102", "60.0", "", "validEndTime",],
             ["充值时长", "106", "60.0", "", "balance", "  小时"],
             ["缴费金额", "106", "60.0", "", "recharge", "  元    "],
             ]
        ]
        return array
    }()
    
    lazy var list:[[Any]] = {
//        return self.allList.first!;
        var array: [[Any]] = [
            ["起止时间:", "108", "60.0", "", "recharge", ],
            ["商品名称:", "1", "60.0", "", "cardName", ],
            ["*商品数量:", "105", "60.0", "", "validEndTime", ],
            ["*上架时间:", "102", "60.0", "", "balance", ],
            ["商品价格:", "106", "60.0", "", "recharge",  "  元    "],
            ["商品种类:", "104", "60.0", "", "recharge",  ["一代","二代","三代",],],
            ["库存周期:", "109", "60.0", "", "recharge", ],
            ["继续生产:", "110", "60.0", "", "recharge",  ["生产","不生产",],],
            ["品牌列表:", "111", "60.0", "", "recharge", ],
            ["生产厂家:", "112", "60.0", "", "recharge", ],
            ["*备注信息:", "107", "160.0", "", "recharge", ],
            ["*default:", "150", "60.0", "", "recharge", ],
//            ["*图片选择:", "115", "", "", "recharge", ],

             ]
        return array
    }()
    
 
    lazy var footerView: BNTableFooterView = {
        var view = BNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        view.label.text = ""
        view.label.textAlignment = .center
        view.btn.setTitle("提交", for: .normal)
        view.btn.addActionHandler({[weak self] (sender:UIControl) in
            let obj = sender as! UIButton
            DDLog(obj.tag)
            
            }, for: .touchUpInside)
        return view
    }()
    
    lazy var suspendBtn: BNSuspendBtn = {
        var view = BNSuspendBtn(frame: CGRectMake(kScreenWidth - 60, 80, 60, 60))
        view.insets = UIEdgeInsets(top: 40, left: 60, bottom: 80, right: 100)
        view.parController = self
        view.addActionHandler({ (sender) in
            DDLog(sender.center)
        }, for: .touchUpInside)
        return view
    }()
}
