//
//  ZMKeyBoardView.swift
//  SwiftProject
//
//  Created by 牛新怀 on 2018/7/6.
//  Copyright © 2018年 牛新怀. All rights reserved.
//

import UIKit

//屏幕的宽度
private let KSCREEN_WIDTH:CGFloat  = UIScreen.main.bounds.width
//按键的高宽比
private let KEYRATIO:CGFloat = 86.0  / 63.0
//按键的宽
private let BTN_WIDTH:CGFloat = KSCREEN_WIDTH / 10.0 - 6.0

//按键的高
private let BTN_HEIGHT:CGFloat = BTN_WIDTH * KEYRATIO

//item的高
private let ITEM_HEIGHT:CGFloat = BTN_HEIGHT + 10.0

//底部安全区高度
private let SAFE_BOTTOM:CGFloat = (UIScreen.main.bounds.height == 812.0) ? 34.0 : 0.0

//总高
private let TOTAL_HEIGHT:CGFloat = ITEM_HEIGHT * 4 + 10.0 + SAFE_BOTTOM

private let itemWidth: CGFloat = 75.0

private let highlightColor: String = "#9da4af"
private let titleSelectColor: String = "#000107"

class ZMKeyBoardView: UIView {

    static let cellId = "keyBoardCellIdentifier"
    //输入源，如ITextFied
    weak public var inputSource:UIView?
    var dataSource = ZMKeyBoardUtil.getDataSourceBy()
    var changedSelect = false // 键盘上123切换是否选中
    
    init() {
        super.init(frame: .zero)
        self.frame = CGRect.init(x: 0, y: 0, width: KSCREEN_WIDTH, height: TOTAL_HEIGHT)
        configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        backgroundColor = UIColor.hex("#c8ccd3")
        collection.frame = CGRect.init(x: 0, y: 0, width: KSCREEN_WIDTH, height: 230)
        addSubview(collection)
        addSubview(capitalButton)
        addSubview(deleteButton)
        addSubview(changedButton)
        addSubview(kongButton)
        addSubview(confirmButton)
    }
    
    lazy var collection : UICollectionView = {
        let object = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: self.layout)
        object.backgroundColor = UIColor.hex( "#c8ccd3")
        object.delegate = self
        object.dataSource = self
        object.register(ZMCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: ZMKeyBoardView.cellId)
        return object
    }()

    lazy var layout : ZMCollectionLayout = {
        let object = ZMCollectionLayout()
        return object
    }()
    
    lazy var capitalButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: 3, y: BTN_HEIGHT * 2 + 10 * 3, width: 40, height: BTN_HEIGHT))
        object.setImage(imageNamed: "capitalNormal", state: .normal)
        object.setImage(imageNamed: "capitalSelect", state: .selected)
        object.setBackgroundImage(image: UIImage(color: UIColor.white)!, state: .selected)
        object.setBackgroundImage(image: UIImage(color: UIColor.hex( highlightColor))!, state: .normal)
        object.button.layer.masksToBounds = true
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardCapitalButtonStyle
        return object
    }()

    lazy var deleteButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: KSCREEN_WIDTH - 3 - 40, y: BTN_HEIGHT * 2 + 10 * 3, width: 40, height: BTN_HEIGHT))
        object.setImage(imageNamed: "keyNewDelete", state: .normal)
        object.setImage(imageNamed: "keyNewDelete", state: .highlighted)
        object.setBackgroundImage(image: UIImage(color: UIColor.hex( highlightColor))!, state: .normal)
        object.setBackgroundImage(image: UIImage(color: UIColor.white)!, state: .highlighted)
        object.button.layer.masksToBounds = true
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardDeleteButtonStyle
        return object
    }()
    
    lazy var changedButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: 3, y: capitalButton.frame.origin.y + capitalButton.frame.size.height + 10, width: itemWidth, height: BTN_HEIGHT))
        object.setTitle("123", state: .normal)
        object.setTitleColor(colorName: titleSelectColor, state: .normal)
        object.setBackgroundColor(color: UIColor.hex( highlightColor))
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardChangedButtonStyle
        return object
    }()

    lazy var kongButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: itemWidth + 9, y: changedButton.frame.origin.y, width: KSCREEN_WIDTH - itemWidth * 2 - 18, height: BTN_HEIGHT))
        object.setBackgroundImage(image: UIImage(color: UIColor.white)!, state: .normal)
        object.setBackgroundImage(image: UIImage(color: UIColor.hex( highlightColor))!, state: .highlighted)
        object.setTitle("知米中学英语", state: .normal)
        object.button.layer.masksToBounds = true
        object.setTitleColor(colorName: "#000107", state: .normal)
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardKongButtonStyle
        return object
    }()

    lazy var confirmButton : ZMKeyBoardButtonView = {
        let object = ZMKeyBoardButtonView.init(frame: CGRect.init(x: kongButton.frame.origin.x + kongButton.frame.size.width + 6, y: changedButton.frame.origin.y, width: itemWidth, height: BTN_HEIGHT))
        object.setTitle("完成", state: .normal)
        object.setTitleColor(colorName: "#ffffff", state: .normal)
        object.setTitleColor(colorName: "#000000", state: .highlighted)
        object.setBackgroundImage(image: UIImage(color: UIColor.hex( "#0960fe"))!, state: .normal)
        object.setBackgroundImage(image: UIImage(color: UIColor.white)!, state: .highlighted)
        object.button.layer.masksToBounds = true
        object.delegate = self
        object.style = KeyBoardButtonStyle.keyBoardConfirmButtonStyle
        return object
    }()

}

extension ZMKeyBoardView : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ZMKeyBoardView.cellId, for: indexPath) as! ZMCollectionViewCell
        cell.cellModel = dataSource[indexPath.section][indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
}

// 键盘单元格按钮点击方法
extension ZMKeyBoardView: KeyBoardCellDelegate {
    func KeyBoardCellBtnClick(model: ZMKeyBoadModel) {
        var textFieldText = ""
        
        if changedSelect {
            print("当前选中的字符是\(model.keyBoadString!)")
            textFieldText = model.keyBoadString!
        } else {
            if model.isCapital! {
                print("当前选中的文字是大写\(model.keyBoadString!)")
                textFieldText = model.keyBoadString!
            } else {
                print("当前选中的文字是小写\(model.keyBoadString!.lowercased())")
                textFieldText = model.keyBoadString!.lowercased()
            }
        }
        inputString(textFieldText)
        
    }
    
    
}
 // 键盘底部按钮点击方法
extension ZMKeyBoardView: ZMKeyBoardButtonViewDelegate {
    func didSelectButtonClick(view: ZMKeyBoardButtonView, buttonStyle: KeyBoardButtonStyle, sender: UIButton) {
        switch buttonStyle {
        case .keyBoardCapitalButtonStyle: do {// 大小写切换
            sender.isSelected = !sender.isSelected
            if changedSelect {
                if sender.isSelected {
                    self.dataSource = ZMKeyBoardUtil.getThirdDataSourceBy()
                } else {
                    self.dataSource = ZMKeyBoardUtil.getSecondDataSourceBy()
                }
            } else {
                for i in 0...self.dataSource.count - 1 {
                    let models = self.dataSource[i]
                    if models.count != 0 {
                        for m in 0...models.count - 1 {
                            let source = models[m]
                            source.isCapital = !source.isCapital!
                        }
                        self.dataSource[i] = models
                    }
                }
            }
            collection.reloadData()
            break
        }
        case .keyBoardDeleteButtonStyle: do { // 删除按钮
            ClearBtnClick()
            break
        }
        case .keyBoardChangedButtonStyle: do { // 123切换键盘按钮
            sender.isSelected = !sender.isSelected
            changedSelect = sender.isSelected
            sender.isSelected ? sender.setTitle("ABC", for: .normal) : sender.setTitle("123", for: .normal)
            if sender.isSelected {
                self.dataSource = ZMKeyBoardUtil.getSecondDataSourceBy()
            } else {
                self.dataSource = ZMKeyBoardUtil.getDataSourceBy()
            }
            changedCapitalButton()
            collection.reloadData()
            break
        }
        case .keyBoardKongButtonStyle: do { // 空格
            
            break
        }
        case .keyBoardConfirmButtonStyle: do { // 确定按钮
            guard let inputSource = self.inputSource else {
                return
            }
            inputSource.endEditing(true)
            break
        }
        }
    }
    
    func changedCapitalButton() {
        capitalButton.button.isSelected = false
        if changedSelect {
            capitalButton.setImage(imageNamed: "", state: .normal)
            capitalButton.setImage(imageNamed: "", state: .selected)
            capitalButton.setBackgroundColor(color: UIColor.hex( highlightColor))
            capitalButton.setBackgroundImage(image: UIImage(color: UIColor.clear)!, state: .normal)
            capitalButton.setBackgroundImage(image: UIImage(color: UIColor.clear)!, state: .selected)
            capitalButton.setTitle("#+=", state: .normal)
            capitalButton.setTitle("123", state: .selected)
            capitalButton.setTitleColor(colorName: titleSelectColor, state: .normal)
        } else {
            capitalButton.setTitle("", state: .normal)
            capitalButton.setTitle("", state: .selected)
            capitalButton.setImage(imageNamed: "capitalNormal", state: .normal)
            capitalButton.setImage(imageNamed: "capitalSelect", state: .selected)
            capitalButton.setBackgroundImage(image: UIImage(color: UIColor.white)!, state: .normal)
            capitalButton.setBackgroundImage(image: UIImage(color: UIColor.hex( highlightColor))!, state: .selected)
            
        }
    }
}

// 文字处理方法
extension ZMKeyBoardView {
    
    /// 输入框输入文字
    ///
    /// - Parameter string: 输入的文字
    private func inputString(_ string:String){
        guard let inputSource = self.inputSource else {
            return
        }
        
        //UITextField
        if(inputSource.isKind(of: UITextField.self)){
            //获取输入空控件
            let tmp = inputSource as! UITextField
            
            //判断是否实现了代理，是否实现了shouldChangeCharactersIn代理
            if(tmp.delegate != nil && (tmp.delegate?.responds(to: #selector(UITextFieldDelegate.textField(_:shouldChangeCharactersIn:replacementString:))) ?? false)){
                
                //当前输入框了的选择范围，默认时输入末尾
                var range = NSRange.init(location: tmp.text?.count ?? 0, length: 0)
                
                //有可能不是输入末尾，且选择了几个字符
                if let rag = tmp.selectedTextRange {
                    //光标偏移量，即选中开始位置
                    let currentOffset = tmp.offset(from: tmp.beginningOfDocument, to: rag.start)
                    //选中结束位置
                    let endOffset =  tmp.offset(from: tmp.beginningOfDocument, to: rag.end)
                    //选中字符长度
                    let length = endOffset - currentOffset
                    //选中范围
                    range = NSRange.init(location: currentOffset, length:length)
                }
                
                //代理是否允许输入字符
                let ret = tmp.delegate?.textField?(tmp, shouldChangeCharactersIn: range, replacementString: string) ?? false
                
                //允许输入字符时，输入字符
                if(ret){
                    tmp.insertText(string)
                }
            }else{
                //直接输入字符
                tmp.insertText(string)
            }
            
        }
    }
    
    /// 删除文字
    ///
    /// - Parameter button: 删除按钮
    @objc private func ClearBtnClick(){
        guard let inputSource = self.inputSource else {
            return
        }
        
        //UITextField和UITextView
        if(inputSource.isKind(of: UITextField.self)){
            let tmp = inputSource as! UITextField
            
            var currentOffset = (tmp.text?.count ?? 0)
            var length = 1
            //有可能不是输入末尾，且选择了几个字符
            if let rag = tmp.selectedTextRange {
                //光标偏移量，即选中开始位置
                currentOffset = tmp.offset(from: tmp.beginningOfDocument, to: rag.start)
                //选中结束位置
                let endOffset =  tmp.offset(from: tmp.beginningOfDocument, to: rag.end)
                //选中字符长度
                length = endOffset - currentOffset
            }
            
            //判断是否实现了代理，是否实现了shouldChangeCharactersIn代理
            if(!(currentOffset == 0 && length == 0 ) && (tmp.text?.count ?? 0) > 0 && tmp.delegate != nil && (tmp.delegate?.responds(to: #selector(UITextFieldDelegate.textField(_:shouldChangeCharactersIn:replacementString:))) ?? false)){
                
                if(length == 0 && currentOffset > 0){
                    currentOffset -= 1
                }
                
                //至少删除一个字符
                if(length == 0){
                    length = 1
                }
                
                //删除位置
                let range = NSRange.init(location:currentOffset, length: length)
                
                //代理是否允许输入字符
                let ret = tmp.delegate?.textField?(tmp, shouldChangeCharactersIn: range, replacementString: "") ?? false
                
                //允许输入字符时，直接删除
                if(ret){
                    tmp.deleteBackward()
                }
            }else{
                //直接删除
                tmp.deleteBackward()
            } 
        }
    }
}
