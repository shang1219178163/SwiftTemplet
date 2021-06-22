//
//	NNPlaceHolderView.swift
//	Then
//
//	Created by shang on 2020/08/07 14:41
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit
import Then


@objc public enum NNPlaceHolderViewState: Int {
    case nomrol, loading, empty, fail
}
      
///
@objcMembers public class NNPlaceHolderView: UIView {

    var inset = UIEdgeInsets(top: 64, left: 30, bottom: 64, right: 30)
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        view.isUserInteractionEnabled = true
//        view.contentMode = .scaleAspectFit
        view.contentMode = .center
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }();
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle("Learn more", for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in
            DDLog(sender)

        }, for: .touchUpInside)
        return view;
    }();
    
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView().then({
            $0.spacing = 10
            $0.distribution = .fill
            $0.backgroundColor = UIColor.systemBlue
            $0.axis = .vertical
        })
        return stackView;
    }()
    
    private lazy var titleDic: [NNPlaceHolderViewState: String] = {
        return [NNPlaceHolderViewState.empty: "暂无数据",
                NNPlaceHolderViewState.loading: "加载中...",
                NNPlaceHolderViewState.fail: "请求失败",
                ]
    }()
    
    private lazy var imageDic: [NNPlaceHolderViewState: UIImage?] = {
        return [NNPlaceHolderViewState.empty: UIImage(named: "img_data_empty"),
                NNPlaceHolderViewState.loading: UIImage(named: "img_network_loading"),
                NNPlaceHolderViewState.fail: UIImage(named: "img_network_error"),
                ]
    }()
    
//    private lazy var imageDic: [NNPlaceHolderViewState: UIImage?] = {
//        return [NNPlaceHolderViewState.empty: UIImage(named: "img_data_empty")!,
//                NNPlaceHolderViewState.loading: UIImage(named: "img_network_loading")!,
//                NNPlaceHolderViewState.fail: UIImage(named: "img_network_error")!,
//                ]
//    }()
    
    var state: NNPlaceHolderViewState = .empty {
        willSet{
//            isHidden = !(newValue == .fail)
            label.text = titleDic[newValue]
            imgView.image = imageDic[newValue] ?? UIImage(color: .systemBlue)
        }
    }
    
    public func setTitle(_ title: String, for state: NNPlaceHolderViewState) {
        titleDic[state] = title
    }
    
    public func setImage(_ image: UIImage, for state: NNPlaceHolderViewState) {
        imageDic[state] = image
    }
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        btn.isHidden = true
        
        addSubview(stackView)
        let list = [imgView, label, btn,]
        list.forEach{
            stackView.addArrangedSubview($0)
        }

//        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
//        stackView.frame = bounds.inset(by: UIEdgeInsets(top: 100, left: 20, bottom: 100, right: 20))
        stackView.frame = CGRect(x: 20,
                                 y: bounds.maxY*0.15,
                                 width: bounds.width - 40,
                                 height: bounds.maxY*0.3)
    }
    
    // MARK: - funtions

    
}


@objc public extension UIScrollView{
    private struct AssociateKeys {
        static var placeHolderView   = "UIScrollView" + "placeHolderView"
    }
    ///占位视图
     var placeHolderView: NNPlaceHolderView {
        if let obj = objc_getAssociatedObject(self, &AssociateKeys.placeHolderView) as? NNPlaceHolderView {
            return obj
        }

        let holderView = NNPlaceHolderView(frame: self.bounds)
        addSubview(holderView)

        objc_setAssociatedObject(self, &AssociateKeys.placeHolderView, holderView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        return holderView
    }
    
}


@objc public extension UITableView{
    
    class func initializeMethodForPlaceHolderView() {
        if self == UITableView.self {
            let onceToken = "Hook_\(NSStringFromClass(classForCoder()))";
            //DispatchQueue函数保证代码只被执行一次，防止又被交换回去导致得不到想要的效果
            DispatchQueue.once(token: onceToken) {
                let oriSel = #selector(reloadData)
                let repSel = #selector(hook_reloadData)
                hookInstanceMethod(of: oriSel, with: repSel);
            }
        }
    }
    
    private func hook_reloadData() {
        guard let dataSource = dataSource else {
            hook_reloadData()
            return
        }
        
        guard let holderView = subView(NNPlaceHolderView.self) else {
            hook_reloadData()
            return
        }
        
        var isEmpty: Bool = true
        if dataSource.responds(to: #selector(dataSource.numberOfSections(in:))),
            let sections: Int = dataSource.numberOfSections?(in: self) {
            isEmpty = (sections <= 0)
        } else {
            isEmpty = dataSource.tableView(self, numberOfRowsInSection: 0) <= 0
        }
                
        holderView.isHidden = !isEmpty
        if isEmpty {
            holderView.state = .empty
        }
        hook_reloadData()
    }
    

}
