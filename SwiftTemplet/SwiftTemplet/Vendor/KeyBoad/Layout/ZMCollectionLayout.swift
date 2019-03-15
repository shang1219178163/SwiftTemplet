//
//  ZMCollectionLayout.swift
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

private let SectionFirstItemIndex = 10
private let thirdFirstItemIndex = 19

class ZMCollectionLayout: UICollectionViewFlowLayout {

    var attributesArray = [UICollectionViewLayoutAttributes]()
    override init() {
        super.init()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        sectionInset = UIEdgeInsetsMake(10, 3, 0, 3)
        scrollDirection = .vertical
        itemSize = CGSize.init(width: BTN_WIDTH, height: BTN_HEIGHT)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 6
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let array = super.layoutAttributesForElements(in: rect)
        guard array?.count != 0 else {
            return array
        }

        var sectionItemSecondX = CGFloat(0)
        
        for i in 0...array!.count - 1 {
            let att = array![i]
            if i >= SectionFirstItemIndex && i < thirdFirstItemIndex {
                if i == SectionFirstItemIndex {
                    var frame = att.frame
                    frame.origin.x = CGFloat(22)
                    att.frame = frame
                } else {
                    let prevLayoutAttributes = array![i - 1]
                    let originX = prevLayoutAttributes.frame.origin.x + prevLayoutAttributes.frame.size.width
                    var frame = att.frame
                    frame.origin.x = originX + CGFloat(6)
                    if i == SectionFirstItemIndex + 1 {
                        sectionItemSecondX = originX + CGFloat(6)
                    }
                    att.frame = frame
                }
                
            } else if i >= thirdFirstItemIndex {
                if i == thirdFirstItemIndex {
                    var frame = att.frame
                    frame.origin.x = sectionItemSecondX
                    att.frame = frame
                } else {
                    let prevLayoutAttributes = array![i - 1]
                    let originX = prevLayoutAttributes.frame.origin.x + prevLayoutAttributes.frame.size.width
                    var frame = att.frame
                    frame.origin.x = originX + CGFloat(6)
                    att.frame = frame
                }
                
            }
            attributesArray.append(att)
        }
        
        return attributesArray
    }
    
    
}
