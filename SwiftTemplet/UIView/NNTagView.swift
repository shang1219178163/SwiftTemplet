//
//  NNTagView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNTagView: UIView {

    // 标签数组
    var tags: [String]?
    {
        didSet{
            resetTagButton()
        }
    }
    // 选中标签文字颜色
    var textColorSelected: UIColor = .white
    {
        willSet{
            resetTagButton()
        }
    }
    // 默认标签文字颜色
    var textColorNormal: UIColor = .darkGray
    {
        willSet{
            resetTagButton()
        }
    }
    // 选中标签背景颜色
    var backgroundColorSelected: UIColor = .systemBlue
    {
        willSet{
            resetTagButton()
        }
    }
    // 默认标签背景颜色
    var backgroundColorNormal: UIColor = .white
    {
        willSet{
            resetTagButton()
        }
    }
    var fontSize: CGFloat = 13.0
    {
        willSet{
            resetTagButton()
        }
    }
    var hasDefaultIndex = false
    var index: Int = 0
    var canSelectedIndex = false

    // 按钮高度
    var btnH: CGFloat = 20
    // 按钮左右间隙
    var marginX: CGFloat = 8
    // 按钮上下间隙
    var marginY: CGFloat = 8
    // 文字左右间隙
    var fontMargin: CGFloat = 8
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        createTagButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
            
    // MARK: - Private
    // 重新创建标签
    func resetTagButton() {
        // 移除之前的标签
        for btn in subviews {
            btn.removeFromSuperview()
        }
        // 重新创建标签
        createTagButton()
    }
    
    // 创建标签按钮
    func createTagButton() {
        guard let tags = tags else { return }

        // 距离左边距
        var leftX: CGFloat = 0
        // 距离上边距
        var topY: CGFloat = 0

        for i in 0..<tags.count {
            let btn: UIButton = UIButton(type: .custom)
            btn.adjustsImageWhenHighlighted = false
            btn.frame = CGRect(i == 0 ? 0 : (marginX+leftX), topY, 100, btnH)
            btn.tag = 100+i
            // 默认选中第一个
            if i == index && hasDefaultIndex && canSelectedIndex {
                btn.isSelected = true
            }
            // 按钮文字
            btn.setTitle(tags[i], for: .normal)
            btn.titleLabel!.font = UIFont.systemFont(ofSize: fontSize)
            //------ 默认样式
            btn.setTitleColor(textColorNormal, for: .normal)
            btn.setBackgroundImage(imageWithColor(backgroundColorNormal), for: .normal)
            //-----  选中样式
            btn.setTitleColor(textColorSelected, for: .selected)
            btn.setBackgroundImage(imageWithColor(backgroundColorSelected), for: .selected)
            // 设置按钮的边距、间隙
            setTagButtonMargin(btn, fontMargin: fontMargin)
            // 处理换行
            if btn.frame.origin.x+btn.frame.size.width+marginX > frame.size.width {
                // 换行
                topY += btnH+marginY
                // 重置
                leftX = 0
                btn.frame = CGRect(0, topY, 100, btnH)
                // 设置按钮的边距、间隙
                setTagButtonMargin(btn, fontMargin: fontMargin)
            }
            // 圆角
            btn.layer.cornerRadius = btn.frame.size.height/2.0
            btn.layer.masksToBounds = true
            // 边框
            btn.layer.borderColor = textColorNormal.cgColor
            btn.layer.borderWidth = 0.5
            //----- 选中事件
            btn.addTarget(self, action: #selector(selectdButton(_:)), for: .touchUpInside)
            addSubview(btn)
            leftX = btn.frame.maxX
            if i == tags.count-1 {
                var tmp: CGRect = frame
                tmp.size.height = btn.frame.maxY
                frame = tmp
            }
        }
        //     检测按钮状态，最少选中一个
        checkButtonState()
    }
    
    func changSubViewFrame() {
        // 距离左边距
        var leftX: CGFloat = 0
        // 距离上边距
        var topY: CGFloat = 0
        
        DispatchQueue.main.async {
            for e in self.subviews.enumerated() {
                if e.element.isKind(of: UIButton.self) {
                    guard let btn = e.element as? UIButton, let i = e.offset as? Int else { return }
                    // 设置按钮的边距、间隙
                    self.setTagButtonMargin(btn, fontMargin: self.fontMargin)
                    // 处理换行
                    if btn.frame.origin.x+btn.frame.size.width+self.marginX > self.frame.size.width {
                        // 换行
                        topY += self.btnH+self.marginY
                        // 重置
                        leftX = 0
                        btn.frame = CGRect(0, topY, 100, self.btnH)
                        // 设置按钮的边距、间隙
                        self.setTagButtonMargin(btn, fontMargin: self.fontMargin)
                    }
                    // 圆角
                    btn.layer.cornerRadius = btn.frame.size.height/2.0
                    btn.layer.masksToBounds = true
                    // 边框
                    btn.layer.borderColor = self.textColorNormal.cgColor
                    btn.layer.borderWidth = 0.5
                    //----- 选中事件
                    btn.addTarget(self, action: #selector(self.selectdButton(_:)), for: .touchUpInside)
                    self.addSubview(btn)
                    leftX = btn.frame.maxX
                    if i == self.subviews.count-1 {
                        var tmp: CGRect = self.frame
                        tmp.size.height = btn.frame.maxY
                        self.frame = tmp
                    }
                }
            }
        }
    }
    
    // 设置按钮的边距、间隙
    func setTagButtonMargin(_ btn: UIButton, fontMargin: CGFloat) {
        // 按钮自适应
        btn.sizeToFit()
        // 重新计算按钮文字左右间隙
        var frame: CGRect = btn.frame
        frame.size.width += fontMargin*2
        frame.size.height = btn.frame.size.height*1.6
        btn.frame = frame
    }
    
    // 检测按钮状态，最少选中一个
    func checkButtonState() {
        guard let tags = tags else { return }

        var selectCount: Int32 = 0
        var isSelectedBtn: UIButton? = nil
        for i in 0..<tags.count {
            guard let btn = viewWithTag(100+i) as? UIButton else { return }
            if btn.isSelected {
                selectCount += 1
                isSelectedBtn = btn
            }
        }
        if selectCount == 1 {
            // 只有一个就把这一个给禁用手势
            isSelectedBtn!.isUserInteractionEnabled = false
        } else {
            // 解除禁用手势
            for i in 0..<tags.count {
                guard let btn = viewWithTag(100+i) as? UIButton else { return }
                if !btn.isUserInteractionEnabled {
                    btn.isUserInteractionEnabled = true
                }
            }
        
        }
    }
    
    // 根据颜色生成UIImage
    func imageWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(0.0, 0.0, 1.0, 1.0)
        // 开始画图的上下文
        UIGraphicsBeginImageContext(rect.size)
        // 设置背景颜色
        color.set()
        // 设置填充区域
        UIRectFill(CGRect(0, 0, rect.size.width, rect.size.height))
        // 返回UIImage
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        // 结束上下文
        UIGraphicsEndImageContext()
        return image
    }
    
    // MARK: - Event
    // 标签按钮点击事件
    @objc func selectdButton(_ btn: UIButton) {
        if !canSelectedIndex {
            return
        }
        btn.isSelected = !btn.isSelected
        // 检测按钮状态，最少选中一个
        checkButtonState()
    }
    
    func changTitles(_ titles: [String], color: UIColor) {
        DispatchQueue.main.async {
            for e in self.subviews.enumerated() {
                if e.element.isKind(of: UIButton.self) {
                    guard let sender = e.element as? UIButton else { return }
                    if titles.contains(sender.currentTitle ?? "无标题") {
                        sender.setTitleColor(color, for: .normal)
                        sender.layer.borderColor = color.cgColor
                    }
                }
            }
        }
    }
    
}

