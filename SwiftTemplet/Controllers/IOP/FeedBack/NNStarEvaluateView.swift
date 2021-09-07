//
//	NNStarEvaluateView.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/19 16:06
//	Copyright © 2021 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNStarEvaluateViewDelegate{
    @objc func NNStarEvaluateView(_ view: NNStarEvaluateView)
    
}
        
///
@objcMembers class NNStarEvaluateView: UIView {

    weak var delegate: NNStarEvaluateViewDelegate?

    var block: ((NNStarEvaluateView, Int) -> Void)?
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    /// 星星的间隔,default is 5.0
    var spacing: CGFloat = 10.0
    /// 当前的星星数量,default is 0
    var currentStarCount: Int = 0{
        willSet{
            stackView.subviews.forEach { view in
                guard let sender = view as? UIImageView else {
                    return
                }
                sender.image = view.tag <= newValue ? imageSelected : imageNomrl
            }
            self.block?(self, newValue)
        }
    }
    /// 星星总数量
    var totalStarCount: Int = 5{
        willSet{
            stackView.removeArrangedSubviews()
            let list = (0 ..< newValue).map { index -> UIImageView in
                let imageView: UIImageView = UIImageView(image: index < currentStarCount ? imageSelected : imageNomrl)
                imageView.tag = index
                imageView.addGestureTap { reco in
                    guard let sender = reco.view as? UIImageView else { return }
                    self.currentStarCount = sender.tag
//                    DDLog(self.currentStarCount, self.stackView.arrangedSubviews.count)
                }
                return imageView
            }
            stackView.addArrangedSubviews(list)
        }
    }
    
    /// 最少星星
    var leastStarCount: Int = 0
    
    var imageNomrl: UIImage = UIImage(named: "icon_star_blank")!
    
    var imageSelected: UIImage = UIImage(named: "icon_star_yellow")!

    
    lazy var stackView: UIStackView = {
        let view = UIStackView(frame: self.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = spacing
        return view
    }()
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        /// 点击手势
        let tap = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        stackView.isUserInteractionEnabled = true
        stackView.addGestureRecognizer(tap)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
    }
    
    // MARK: - funtions
    /// 点击评分
    @objc func handlePan(_ pan:UIPanGestureRecognizer) {
        var offX: CGFloat = 0
        if pan.state == .began{
            offX = pan.location(in: self).x
            
        }else if pan.state == .changed{
            offX += pan.location(in: self).x
            
        } else {
            return
        }
        
        if offX <= 0 {
            offX = 0
        } else if offX >= bounds.maxX {
            offX = bounds.maxX
        }
        
        currentStarCount = Int(CGFloat(offX / bounds.width) * CGFloat(totalStarCount))
        if currentStarCount <= leastStarCount {
            currentStarCount = leastStarCount
        } else if currentStarCount >= totalStarCount {
            currentStarCount = totalStarCount
        }
    }
    
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }()

}
