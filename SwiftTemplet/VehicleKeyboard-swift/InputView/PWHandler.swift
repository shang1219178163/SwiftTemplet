//
//  PWHandler.swift
//  VehicleKeyboardDemo
//
//  Created by 杨志豪 on 2018/6/28.
//  Copyright © 2018年 yangzhihao. All rights reserved.
//

import UIKit

import SnapKit

@objc public protocol PWHandlerDelegate{
    @objc  func plateInputComplete(plate: String)
    @objc  optional func palteDidChnage(plate:String,complete:Bool)
    @objc  optional func plateKeyBoardShow()
    @objc  optional func plateKeyBoardHidden()
}

public class PWHandler: NSObject,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,PWKeyBoardViewDeleagte, UITextFieldDelegate {
    
    //格子中字体的颜色
    @objc public var textColor = UIColor.black
    //格子中字体的大小
    @objc public var textFontSize:CGFloat = 17
    //设置主题色（会影响格子的边框颜色、按下去时提示栏颜色、确定按钮可用时的颜色）
    @objc public var mainColor = UIColor(red: 65 / 256.0, green: 138 / 256.0, blue: 249 / 256.0, alpha: 1)
    //当前格子中的输入内容
    @objc public  var paletNumber = ""
    //每个格子的背景色
    @objc public var itemColor = UIColor.white
    //格子之间的间距
    @objc public var itemSpacing:CGFloat = 0
    
    //边框颜色
    @objc public var cellBorderColor = UIColor(red: 216/256.0, green: 216/256.0, blue: 216/256.0, alpha: 1)
    
    //每个格子的圆角(ps:仅在有间距时生效)
    @objc public var cornerRadius:CGFloat = 2
    
    @objc public weak var  delegate : PWHandlerDelegate?
    
    let identifier = "PWInputCollectionViewCell"
    
    var maxCount = 7
    var selectIndex = 0
    @objc public var inputTextfield :UITextField!

    var selectView = UIView()
    var isSetKeyboard = false//预设值时不设置为第一响应对象
    var view = UIView()
    
    public override init() {
        super.init()
        
        inputCollectionView.addObserver(self, forKeyPath: "hidden", options: .new, context: nil);
    }
  
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        DDLog("change_%@", change);
        selectView.isHidden = (change![NSKeyValueChangeKey.newKey] != nil);
    }
    
    /*
     将车牌输入框绑定到UITextField
     **/
    @objc public func bindTextField(_ textField: UITextField) -> Void {
        
        inputTextfield = textField
        inputTextfield.inputView = keyboardView
        inputTextfield.inputAccessoryView = {
            let switchWidth: CGFloat = 70.0
            
            let view: UIView = {
                let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
                
                view.layer.borderWidth = 1;
                view.layer.borderColor = cellBorderColor.cgColor;
                return view;
            }()
            
            inputCollectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - switchWidth, height: 50)
            view.addSubview(inputCollectionView)
            
            let btn: UIButton = {
                let view: UIButton = UIButton(type: .custom)
                view.frame = CGRect(x: UIScreen.main.bounds.width - switchWidth, y: 0, width: switchWidth, height: 50)
                view.setImage(UIImage(named: "plateNumberSwitch_N"), for: .normal)
                view.setImage(UIImage(named: "plateNumberSwitch_H"), for: .selected)
                view.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
                view.imageView?.contentMode = .scaleAspectFit
                
                view.layer.borderWidth = 1;
                view.layer.borderColor = cellBorderColor.cgColor;
                view.addActionHandler({ (control) in
                    control.isSelected = !control.isSelected;
                    //                    DDLog(control.isSelected)
                    self.changeInputType(isNewEnergy: control.isSelected)
                    
                }, for: .touchUpInside)
                return view;
            }()
            
            view.addSubview(btn)
            return view;
        }()
        
        setBackgroundView()
    }
    /*
     将车牌输入框绑定到一个你自己创建的UIview
     **/
    @objc public func setKeyBoardView(view: UIView){
        self.view = view
        //        inputCollectionView.frame = view.bounds;
        
        if view.isKind(of: UITextField.classForCoder()) {
            inputTextfield = (view as! UITextField);
        } else {
            inputTextfield = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
            if view.isKind(of: UIButton.classForCoder()) == true {
                if let title = (view as! UIButton).titleLabel!.text {
                    inputTextfield.placeholder = "  " + title;
                    (view as! UIButton).setTitle("", for: .normal)
                }
            }
            view.addSubview(inputTextfield)
            
            if CGRect.zero.equalTo(view.frame) == true {
                inputTextfield.snp.makeConstraints { (make) in
                    make.edges.equalToSuperview()
                }
            }
        }
                
        inputTextfield.inputView = keyboardView
        inputTextfield.inputAccessoryView = {
            let switchWidth: CGFloat = 70.0
            
            let view: UIView = {
                let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
                
                view.layer.borderWidth = 1;
                view.layer.borderColor = cellBorderColor.cgColor;
                return view;
            }()
            
            inputCollectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - switchWidth, height: 50)
            view.addSubview(inputCollectionView)
            
            let btn: UIButton = {
                let view: UIButton = UIButton(type: .custom)
                view.frame = CGRect(x: UIScreen.main.bounds.width - switchWidth, y: 0, width: switchWidth, height: 50)
                view.setImage(UIImage(named: "plateNumberSwitch_N"), for: .normal)
                view.setImage(UIImage(named: "plateNumberSwitch_H"), for: .selected)
                view.imageEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
                view.imageView?.contentMode = .scaleAspectFit
                
                view.layer.borderWidth = 1;
                view.layer.borderColor = cellBorderColor.cgColor;
                view.addActionHandler({ (control) in
                    control.isSelected = !control.isSelected;
                    //                    DDLog(control.isSelected)
                    self.changeInputType(isNewEnergy: control.isSelected)
                    
                }, for: .touchUpInside)
                return view;
            }()
            
            view.addSubview(btn)
            return view;
        }()
        
        setBackgroundView()
        
//        view.translatesAutoresizingMaskIntoConstraints = false
        if view.isKind(of: UITextField.classForCoder()) == false {
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
            view.addGestureRecognizer(tap)
            
            //监听键盘
            NotificationCenter.default.addObserver(self, selector: #selector(plateKeyBoardShow), name:UIResponder.keyboardDidShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(plateKeyBoardHidden), name:UIResponder.keyboardWillHideNotification, object: nil)
        }
        
    }
//    @objc public func setKeyBoardView(view: UIView){
//        self.view = view
////        inputCollectionView.frame = view.bounds;
//
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(tap:)))
//        view.addGestureRecognizer(tap)
//        view.addSubview(inputCollectionView)
//        setNSLayoutConstraint(subView: inputCollectionView, superView: view)
//
//        if view.isKind(of: UITextField.classForCoder()) {
//            inputTextfield = (view as! UITextField);
//        } else {
//            inputTextfield = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
//            view.addSubview(inputTextfield)
//        }
//
//        inputTextfield.inputView = keyboardView
//
//        //因为直接切给collectionView加边框 会盖住蓝色的选中边框   所以加一个和collectionView一样大的view再切边框
//        setBackgroundView()
//
//        //监听键盘
//        NotificationCenter.default.addObserver(self, selector: #selector(plateKeyBoardShow), name:UIResponder.keyboardDidShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(plateKeyBoardHidden), name:UIResponder.keyboardWillHideNotification, object: nil)
//    }
    
    @objc lazy var inputCollectionView: UICollectionView = {
        let view: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.register(UINib(nibName: identifier, bundle: Bundle(for: PWHandler.self)), forCellWithReuseIdentifier: identifier)
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue);
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.isScrollEnabled = false
        
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    @objc lazy var keyboardView: PWKeyBoardView = {
        let view: PWKeyBoardView = PWKeyBoardView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.mainColor = mainColor
        view.delegate = self

        return view
    }()
    
    
    /*
     手动弹出键盘
     **/
    @objc public func vehicleKeyBoardBecomeFirstResponder(){
        inputTextfield.becomeFirstResponder()
    }
    
    /*
     手动隐藏键盘
     **/
    @objc public func vehicleKeyBoardEndEditing(){
        UIApplication.shared.keyWindow?.endEditing(true)
    }
    
    /*
     检查是否是符合新能源车牌的规则
     **/
    @objc public func checkNewEnginePlate() ->Bool{
        for i in 0..<paletNumber.count {
            let listModel =  KeyboardEngine.generateLayout(keyboardType: PWKeyboardType.civilAndArmy, inputIndex: i, presetNumber: KeyboardEngine.subString(str: paletNumber, start: 0, length: i), numberType:.newEnergy,isMoreType:false);
            var result = false
            for j in 0..<listModel.rowArray().count {
                for k in 0..<listModel.rowArray()[j].count{
                    let key = listModel.rowArray()[j][k]
                    if KeyboardEngine.subString(str: paletNumber, start: i, length: 1) == key.text,key.enabled {
                        result = true
                    }
                }
            }
            if !result {
                return false
            }
        }
        return true
    }
 
    
    /*
     检查输入车牌的完整
     **/
    @objc public func isComplete()-> Bool{
        return paletNumber.count == maxCount
    }
    
    @objc public func setPlate(plate:String,type:PWKeyboardNumType){
        paletNumber = plate;
        let isNewEnergy = type == .newEnergy
        var numType = type;
        selectIndex = plate.count
        if  numType == .auto,paletNumber.count > 0,KeyboardEngine.subString(str: paletNumber, start: 0, length: 1) == "W" {
            numType = .wuJing
        } else if numType == .auto,paletNumber.count == 8 {
            numType = .newEnergy
        }
        keyboardView.numType = numType
        isSetKeyboard = true
        changeInputType(isNewEnergy: isNewEnergy)
    }
    
    @objc public func changeInputType(isNewEnergy:Bool){
        let keyboardView = inputTextfield.inputView as! PWKeyBoardView
        keyboardView.numType = isNewEnergy ? .newEnergy : .auto
        var numType = keyboardView.numType
        if  paletNumber.count > 0,KeyboardEngine.subString(str: paletNumber, start: 0, length: 1) == "W" {
            numType = .wuJing
        }
        maxCount = (numType == .newEnergy || numType == .wuJing) ? 8 : 7
        if paletNumber.count > maxCount {
            paletNumber = KeyboardEngine.subString(str: paletNumber, start: 0, length: paletNumber.count - 1)
        } else if maxCount == 8,paletNumber.count == 7 {
            selectIndex = 7
        }
        if selectIndex > (maxCount - 1) {
            selectIndex = maxCount - 1
        }
        keyboardView.updateText(text: paletNumber, isMoreType: false, inputIndex: selectIndex)
        inputTextfield.text = paletNumber;

        updateCollection()
    }
    
    private func setBackgroundView(){
        if itemSpacing <= 0 {
            let backgroundView = UIView(frame: inputCollectionView.bounds)
            backgroundView.isUserInteractionEnabled = false
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.layer.borderWidth = 1
            backgroundView.layer.borderColor = cellBorderColor.cgColor
            backgroundView.layer.masksToBounds = true
            backgroundView.layer.cornerRadius = cornerRadius
            
            view.addSubview(backgroundView)
            setNSLayoutConstraint(subView: backgroundView, superView: view)
            selectView.isUserInteractionEnabled = false
        }
//        view.addSubview(selectView)
        inputCollectionView.addSubview(selectView)
    }
    
    private func setNSLayoutConstraint(subView:UIView,superView:UIView){
        if (superView.constraints.count > 0) {
            let topCos = NSLayoutConstraint(item: subView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
            let leftCos = NSLayoutConstraint(item: subView, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
            let rightCos = NSLayoutConstraint(item: subView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
            let bottomCos = NSLayoutConstraint(item: subView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
            superView.addConstraints([topCos,leftCos,rightCos,bottomCos])
        }
    }
    
    @objc func plateKeyBoardShow(){
        if inputTextfield.isFirstResponder {
            delegate?.plateKeyBoardShow?()
        }
    }
    
    @objc func plateKeyBoardHidden(){
        if inputTextfield.isFirstResponder {
            delegate?.plateKeyBoardHidden?()
        }
    }
    
    @objc func tapAction(tap:UILongPressGestureRecognizer){
        let tapPoint = tap.location(in: view)
        let indexPath = inputCollectionView.indexPathForItem(at: tapPoint)
        if indexPath != nil {
            collectionView(inputCollectionView, didSelectItemAt: indexPath!)
        }
    }
    
    
    func updateCollection(){
        inputCollectionView.reloadData()
        if !inputTextfield.isFirstResponder,!isSetKeyboard {
            inputTextfield.becomeFirstResponder()
        }
        isSetKeyboard = false
    }
    
    func selectComplete(char: String, inputIndex: Int) {
        
        var isMoreType = false
        if char == "删除" , paletNumber.count >= 1 {
            paletNumber = KeyboardEngine.subString(str: paletNumber, start: 0, length: paletNumber.count - 1)
            selectIndex = paletNumber.count
        } else  if char == "确定"{
            UIApplication.shared.keyWindow?.endEditing(true)
            delegate?.plateInputComplete(plate: paletNumber)
            return
        } else if char == "更多" {
            isMoreType = true
        } else if char == "返回" {
            isMoreType = false
        } else {
            if paletNumber.count <= inputIndex{
                paletNumber += char
            } else {
                let NSPalet = NSMutableString(string: paletNumber)
                NSPalet.replaceCharacters(in: NSRange(location: inputIndex, length: 1), with: char)
                paletNumber = NSString.init(format: "%@", NSPalet) as String
            }
            let keyboardView = inputTextfield.inputView as! PWKeyBoardView
            let numType = keyboardView.numType == .newEnergy ? PWKeyboardNumType.newEnergy : KeyboardEngine.detectNumberTypeOf(presetNumber: paletNumber)
            maxCount = (numType == .newEnergy || numType == .wuJing) ? 8 : 7
            if maxCount > paletNumber.count || selectIndex < paletNumber.count - 1 {
                selectIndex += 1;
            }
        }
        keyboardView.updateText(text: paletNumber, isMoreType: isMoreType, inputIndex: selectIndex)
        inputTextfield.text = paletNumber
        updateCollection()
        if (!isMoreType){
            delegate?.palteDidChnage?(plate:paletNumber,complete:paletNumber.count == maxCount)
        }
    }
    
    
    func getPaletChar(index:Int) -> String{
        if paletNumber.count > index {
            let NSPalet = paletNumber as NSString
            let char = NSPalet.substring(with: NSRange(location: index, length: 1))
            return char
        }
        return ""
    }
    
    
    func corners(view:UIView, index :Int){
        if itemSpacing > 0 {
            view.layer.cornerRadius = cornerRadius
        } else {
            //当格子之间没有间距时，第一个的左边和最后一个的右边会切圆角，其他都是直角
            view.addRounded(cornevrs: UIRectCorner.allCorners, radii: CGSize(width: 0, height: 0))
            if index == 0{
                view.addRounded(cornevrs: UIRectCorner(rawValue: UIRectCorner.RawValue(UInt8(UIRectCorner.topLeft.rawValue) | UInt8(UIRectCorner.bottomLeft.rawValue))), radii: CGSize(width: 2, height: 2))
            } else if index == maxCount - 1 {
                view.addRounded(cornevrs: UIRectCorner(rawValue: UIRectCorner.RawValue(UInt8(UIRectCorner.topRight.rawValue) | UInt8(UIRectCorner.bottomRight.rawValue))), radii: CGSize(width: 2, height: 2))
            }
        }
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        inputCollectionView.removeObserver(self, forKeyPath: "hidden")

    }
    
    //MARK:- collectionViewDelegate
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectIndex = indexPath.row > paletNumber.count ? paletNumber.count : indexPath.row
        keyboardView.updateText(text: paletNumber, isMoreType: false, inputIndex: selectIndex)
        updateCollection()
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return maxCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.frame.size.width - CGFloat(maxCount - 1) * itemSpacing ) / CGFloat(maxCount)) - 0.01, height: collectionView.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PWInputCollectionViewCell
        cell.charLabel.text = getPaletChar(index: indexPath.row)
        cell.charLabel.textColor = textColor
        cell.charLabel.font = UIFont.systemFont(ofSize: textFontSize)
        cell.backgroundColor = itemColor
        if indexPath.row == selectIndex {
            //给cell加上选中的边框
            selectView.layer.borderWidth = 2
            selectView.layer.borderColor = mainColor.cgColor
            selectView.frame = cell.frame
            var rightSpace :CGFloat = (maxCount - 1) == selectIndex ? 0 : 0.5
            if itemSpacing > 0 {
                rightSpace = 0
            }
            selectView.center = CGPoint(x: cell.center.x + rightSpace, y: cell.center.y)
            corners(view: selectView, index: selectIndex)
        }
        if itemSpacing > 0 {
            cell.layer.borderWidth = 1
            cell.layer.borderColor = cellBorderColor.cgColor
        }
        corners(view: cell, index: indexPath.row)
        cell.layer.masksToBounds = true
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
    
}


