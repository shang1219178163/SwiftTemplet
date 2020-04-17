//
//  UILabelMultipleTapController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class UILabelMultipleTapController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
//        label.lineBreakMode = .byCharWrapping
        label.backgroundColor = UIColor.red
        return label
    }()

    let textTaps = ["Terms & Conditions", "Privacy Policy"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(label)
        
        
        label.frame = CGRect(x: 20, y: 20, width: view.frame.width - 40, height: 50)
        label.text = "By signing up you agree to our \(textTaps[0]) and \(textTaps[1])"
        let text = (label.text)!
        let mAttString = NSMutableAttributedString(string: text)
        
        
        
        let range = (text as NSString).range(of: textTaps[0])
        mAttString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        
        let range1 = (text as NSString).range(of: textTaps[1])
        mAttString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        label.attributedText = mAttString
        
        
        _ = label.addGestureTap { (reco) in
            guard let sender = reco as? UITapGestureRecognizer else { return }
            sender.didTapAttributedTextIn(label: self.label, tapTexts: self.textTaps) { (text, idx) in
                DDLog(text, idx)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        
        sender.didTapAttributedTextIn(label: label, tapTexts: textTaps) { (text, idx) in
            DDLog(text, idx)
        }

        return
        let result = sender.didTapAttributedTextIn(label: label, tapText: textTaps[0])
        let result1 = sender.didTapAttributedTextIn(label: label, tapText: textTaps[1])
        
        if result == true {
            print(textTaps[0])

        } else if result1 == true {
            print(textTaps[1])
        } else {
            print("Tapped none")
        }
    }

}

