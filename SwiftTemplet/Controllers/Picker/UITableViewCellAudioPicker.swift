////
////	UITableViewCellVideoPicker.swift
////	MacTemplet
////
////	Created by Shang on 2021/08/17 17:08
////	Copyright © 2021 shang. All rights reserved.
////
//
//import UIKit
//import SwiftExpand
//
//
//class UITableViewCellPicker: UITableViewCell {
//
//
//    lazy var uploadImageView: NNUploadImagesView = {
//        let view = NNUploadImagesView()
//        view.frame = CGRectMake(0, 0, self.bounds.width, 110)
//        view.currrentVC = self
//        view.images = [view.imageDefault]
//        view.maxCount = 9
//        view.rowHeight = view.frame.height
//        view.delegate = self
//        view.tag = 1000
//
//        view.tapImageBlock = {
//            DDLog($0)
//        }
//        return view
//    }()
//
//
//    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
//    /// 是否有星标
//    var hasAsterisk = false;
//    // MARK: -life cycle
//    deinit {
//        labelLeft.removeObserver(self, forKeyPath: "text")
//    }
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier);
//
//        contentView.addSubview(labelLeft);
//        contentView.addSubview(uploadImageView);
//
//        labelLeft.numberOfLines = 1
//        labelLeft.addObserver(self, forKeyPath: "text", options: .new, context: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder);
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    override func layoutSubviews() {
//        super.layoutSubviews();
//
//        setupConstraint()
//    }
//
//    func setupConstraint() {
//        if bounds.height <= 10 {
//            return
//        }
//
//        let endX = accessoryType == .none ? inset.right : kPadding
//
//        let labelLeftSize = labelLeft.sizeThatFits(.zero)
//        switch type {
//        case 1:
//            labelLeft.snp.remakeConstraints { (make) in
//                make.top.equalToSuperview().offset(inset.top)
//                make.left.equalToSuperview().offset(inset.left)
//                make.width.equalTo(labelLeftSize.width)
//                make.height.equalTo(20)
//            }
//
//            labelLeftSub.snp.makeConstraints { (make) in
//                make.top.equalTo(labelLeft)
//                make.right.equalToSuperview().offset(-endX)
//                make.size.equalTo(labelLeft)
//            }
//
//            textView.snp.makeConstraints { (make) in
//                make.top.equalTo(labelLeft.snp.bottom).offset(kPadding);
//                make.left.equalTo(labelLeft)
//                make.right.equalTo(labelLeftSub)
//                make.bottom.equalToSuperview().offset(-inset.bottom);
//            }
//
//        default:
//            labelLeft.snp.remakeConstraints { (make) in
//                make.top.equalToSuperview().offset(inset.top)
//                make.left.equalToSuperview().offset(inset.left)
//                make.width.equalTo(labelLeftSize.width)
//                make.height.equalTo(20)
//            }
//
//            labelLeftSub.snp.remakeConstraints { (make) in
//                make.left.equalTo(labelLeft)
//                make.right.equalTo(labelLeft)
//                make.bottom.equalToSuperview().offset(-inset.bottom);
//                make.height.equalTo(labelLeft)
//            }
//
//            textView.snp.remakeConstraints { (make) in
//                make.top.equalTo(labelLeft);
//                make.left.equalTo(labelLeft.snp.right).offset(kPadding)
//                make.right.equalToSuperview().offset(-inset.right)
//                make.bottom.equalToSuperview().offset(-inset.bottom);
//            }
//        }
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
//
//    //MARK: -observe
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if keyPath == "text" {
//            //标题星号处理
//            if hasAsterisk == true {
//                labelLeft.attributedText = labelLeft.text?.matt.appendPrefix(font: labelLeft.font)
//            }
//        }
//        else {
//            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
//        }
//    }
//
//    //MARK: -funtions
//    func block(_ action: @escaping ((UITableViewCellTextView, String) -> Void)) {
//        self.viewBlock = action;
//    }
//}
