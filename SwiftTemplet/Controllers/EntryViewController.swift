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

class EntryViewController: UIViewController {
    deinit {
        DDLog(1111)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbView.rowHeight = UITableView.automaticDimension;
        tbView.estimatedRowHeight = 70;

//        _ScrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        tbView.tableFooterView = footerView
        view.addSubview(tbView);

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
        
//        tbView.frame = view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        //MARK: -func
    func titleViewTap() {
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
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
        var alertController = UIAlertController.createSheet("请选择", msg: nil, items:nil, handler: { (controller: UIAlertController, action:UIAlertAction) in
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
            [["卡数量  ", "UITableViewCellOne", "60.0", "", "cardName", ],
             ["充值数量", "UITableViewCellStep", "60.0", "", "validEndTime", ],
             ["结束时间", "UITableViewCellDatePicker", "60.0", "", "balance", ],
             ["应付金额", "UITableViewCellTextField", "60.0", "", "recharge",  "  元    "],
             ],
            [["内嵌车场  ", "UITableViewCellOne", "60.0", "", "cardName", "1",],
             ["卡类型  ", "UITableViewCellOne", "60.0", "", "cardName", ],
             ["结束日期", "UITableViewCellDatePicker", "60.0", "", "validEndTime",],
             ["充值时长", "UITableViewCellTextField", "60.0", "", "balance", "  小时"],
             ["缴费金额", "UITableViewCellTextField", "60.0", "", "recharge", "  元    "],
             ]
        ]
        return array
    }()
    
    lazy var list:[[String]] = {
//        return self.allList.first!;
        var array: [[String]] = [
            ["起止时间:", "UITableViewCellDateRange", "60.0", "", "recharge", ],
            ["商品名称:", "UITableViewCellOne", "60.0", "", "cardName", ],
            ["*商品数量:", "UITableViewCellStep", "60.0", "", "validEndTime", ],
            ["*上架时间:", "UITableViewCellDatePicker", "60.0", "", "balance", ],
            ["商品价格:", "UITableViewCellTextField", "60.0", "", "recharge",  "  元    "],
            ["商品种类:", "UITableViewCellSegment", "60.0", "", "recharge",  "一代,二代,三代",],
            ["库存周期:", "UITableViewCellSlider", "60.0", "", "recharge", ],
            ["继续生产:", "UITableViewCellSwitch", "60.0", "", "recharge",  "生产,不生产",],
            ["品牌列表:", "UITableViewCellSheet", "60.0", "", "recharge", ],
            ["生产厂家:", "UITableViewCellPickerView", "60.0", "", "recharge", ],
            ["验 证 码:", "UITableViewCellCode", "60.0", "", "recharge", ],
            ["*备注信息:", "UITableViewCellTextView", "160.0", "", "recharge", ],
            ["*default:", "UITableViewCellDefault", "60.0", "", "recharge", ],
//            ["*图片选择:", "UITableViewCellPhotoPicker", "", "", "recharge", ],

             ]
        return array
    }()
    
 
    lazy var footerView: NNTableFooterView = {
        var view = NNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        view.label.text = ""
        view.label.textAlignment = .center
        view.btn.setTitle("提交", for: .normal)
        view.btn.addActionHandler({[weak self] (sender:UIControl) in
            let obj = sender as! UIButton
            DDLog(obj.tag)
            
            }, for: .touchUpInside)
        return view
    }()
    
    lazy var suspendBtn: NNSuspendButton = {
          var view = NNSuspendButton(frame: CGRectMake(kScreenWidth - 60, 80, 60, 60))
          view.insets = UIEdgeInsets(top: 40, left: 0, bottom: 80, right: 0)
//          view.parController = self
          view.addActionHandler({ (sender) in
              DDLog(sender.center)
          }, for: .touchUpInside)
          return view
      }()
}

extension EntryViewController: UITableViewDataSource, UITableViewDelegate {
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.row]
        if itemList[2] == "" {
            return  UITableView.automaticDimension;
        }
        let height = itemList[2].cgFloatValue
        return height
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        let value0 = itemList[0]
        let value1 = itemList[1]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]
        
        switch value1 {
        case "UITableViewCellOne":
            let cell = UITableViewCellOne.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelRight.text = value4
            
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellDatePicker":
            let cell = UITableViewCellDatePicker.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.text = value0
            cell.textfield.text = value4
            cell.textfield.textAlignment = .right
            cell.getViewLayer()

            return cell
            
        case "UITableViewCellSegment":
            let cell = UITableViewCellSegment.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.text = value0
            let titles = (itemList.last as! NSString).components(separatedBy: ",")
            cell.segmentCtl.itemList = titles
            cell.segmentCtl.addActionHandler({ (sender: UIControl) in
                if let control = sender as? UISegmentedControl {
                    DDLog(control.selectedSegmentIndex)
                }
            }, for: .valueChanged)
     
            cell.getViewLayer()
            
            return cell
            
        case "UITableViewCellStep":
            let cell = UITableViewCellStep.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.text = value0
            cell.ppBtn.minValue = 0
            cell.ppBtn.maxValue = 10
            //            cell.ppBtn.currentNumber = value4
            cell.ppBtn.currentNumber = "6"
            
            cell.textfield.textAlignment = .right
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left
            
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
            
        case "UITableViewCellTextView":
            let cell = UITableViewCellTextView.dequeueReusableCell(tableView)
            cell.type = 1;
            cell.textView.placeHolderTextView.text = "最多140字"
            cell.block { ( view:UITableViewCellTextView, text:String) in
                DDLog(text)
            }
            
            cell.getViewLayer()
            return cell
        case "UITableViewCellDateRange":
            
//            let cell = UITableViewCellDateRange.dequeueReusableCell(tableView) as! UITableViewCellDateRange
//            let cell = UITableViewCellDateRange.dequeueReusableCell(tableView) as! UITableViewCellDateRange
//            let cell = tableView.dequeueReuCell(for: UITableViewCellDateRange())
//            let cell = tableView.dequeueReuCell(for: UITableViewCellDateRange.self)
//            let cell = tableView.dequeueReusableCell(for: UITableViewCellDateRange())
            let cell:UITableViewCellDateRange = UITableViewCellDateRange.dequeueReusableCell(tableView)
                cell.dateRangeView.labTitle.font = UIFont.systemFont(ofSize: 14)
                cell.dateRangeView.labTitle.textColor = UIColor.textColor3
                cell.isHidden = value2.cgFloatValue <= 0.0
                cell.hasAsterisk = value0.contains("*")
            
            cell.dateRangeView.labTitle.text = value0
            cell.dateRangeView.block { (dateRangeView) in
                DDLog(dateRangeView.dateStart,dateRangeView.dateEnd)
                
            }
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellSlider":
            let cell = UITableViewCellSlider.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
//            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.text = value0
            cell.sliderCtl.value = 50
            cell.sliderCtl.addActionHandler({ (sender: UIControl) in
                if let control = sender as? UISlider {
                    DDLog(control.value)
                }
            }, for: .valueChanged)

            cell.getViewLayer()
            
            return cell
            
        case "UITableViewCellSwitch":
            let cell = UITableViewCellSwitch.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.text = value0
//            cell.switchCtl.isOn = false
//            cell.layoutType = 1
            cell.switchCtl.addActionHandler({ (sender: UIControl) in
                if let control = sender as? UISwitch {
                    DDLog(control.isOn)
                }
            }, for: .valueChanged)
            
//            cell.getViewLayer()
            
            return cell
            
        case "UITableViewCellSheet":
            let cell = UITableViewCellSheet.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.text = value0
            cell.itemList = ["阿里","腾讯","百度","谷歌",]
            cell.block { (title) in
                DDLog(title)
            }
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellPickerView":
            let cell = UITableViewCellPickerView.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.labelLeft.text = value0
            cell.block { (view, title, obj) in
                DDLog(title,obj)
            }
            
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellPhotoPicker":
            let cell = UITableViewCellPhotoPicker.dequeueReusableCell(tableView)
            
            cell.defaultView.block { (view, list) in
                DDLog(list.count)
            }
            
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellCode":
            let cell = UITableViewCellCode.dequeueReusableCell(tableView)
            cell.btnCode.addActionHandler({ (control) in
                DDLog(self.list.count)
                if let sender: UIButton = control as? UIButton {
                    sender.timerStart(60)
                }
            }, for: .touchUpInside)
          
            cell.getViewLayer()
            return cell
            
        case "UITableViewCellDefault":
            let cell = UITableViewCellDefault.dequeueReusableCell(tableView)
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.defaultView.labelLeft.text = value0
            cell.defaultView.labelRight.text = value4
            cell.getViewLayer()
            return cell
            
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
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
        
}


public extension UITableView{

    /// 泛型复用cell - aClass: "类名()"
//    final func dequeueReusableCell<T: UITableViewCell>(for aClass: T, identifier: String = String(describing: T.self), style: UITableViewCell.CellStyle = .default) -> T{
//        return dequeueReusableCell(for: T.self, identifier: identifier, style: style)
//    }
//
//    /// 泛型复用cell - cellType: "类名.self" (备用默认值 T.self)
//    final func dequeueReusableCell<T: UITableViewCell>(for cellType: T.Type, identifier: String = String(describing: T.self), style: UITableViewCell.CellStyle = .default) -> T{
////        let identifier = String(describing: T.self)
//        var cell = self.dequeueReusableCell(withIdentifier: identifier);
//        if cell == nil {
//            cell = T.init(style: style, reuseIdentifier: identifier);
//        }
//
//        cell!.selectionStyle = .none;
//        cell!.separatorInset = .zero;
//        cell!.layoutMargins = .zero;
//        return cell! as! T;
//    }
//
//    /// 泛型复用cell - aClass: "类名()"
//    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for aClass: T, identifier: String = String(describing: T.self)) -> T{
//        return dequeueReusableHeaderFooterView(for: T.self, identifier: identifier)
//    }
//
//    /// 泛型复用cell - cellType: "类名.self" (备用默认值 T.self)
//    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for cellType: T.Type, identifier: String = String(describing: T.self)) -> T{
//        var cell = self.dequeueReusableHeaderFooterView(withIdentifier: identifier);
//        if cell == nil {
//            cell = T.init(reuseIdentifier: identifier);
//        }
//        cell!.layoutMargins = .zero;
//        return cell! as! T;
//    }

}
