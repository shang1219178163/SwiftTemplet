//
//  XiangceChooseDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/9/28.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class XiangceChooseDemoController: UIViewController {
    
    var textView: UITextView!
    var btn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        textView = UITextView(frame: CGRect(x: 0, y: 88, width: kScreenWidth, height: 300))
        view.addSubview(textView)
        
        btn = UIButton(frame: CGRect(x: (kScreenWidth - 100) * 0.5, y: 400, width: 100, height: 50))
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.orange
        btn.layer.cornerRadius = 6
        btn.layer.masksToBounds = true
        btn.setTitle("选择相册", for: .normal)
        btn.titleLabel?.textAlignment = NSTextAlignment.center
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func showImage(noti: Notification) {
        if let images = noti.object as? [UIImage] {
            let attributeString = NSMutableAttributedString()
            for image in images {
                let attachment = NSTextAttachment()
                attachment.image = image
                attributeString.append(NSAttributedString(attachment: attachment))
            }
            textView.attributedText = attributeString
        }
        
    }
    
    @objc func chooseImage() {
        let albumList = AlbumListViewController()
        let nav = UINavigationController(rootViewController: albumList)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
        albumList.commpleted = {[weak self] images in
            if let images = images {
                let attributeString = NSMutableAttributedString()
                for image in images {
                    let attachment = NSTextAttachment()
                    attachment.image = image
                    attributeString.append(NSAttributedString(attachment: attachment))
                }
                self?.textView.attributedText = attributeString
            }
        }
        
    }
   
}

public extension UIImage {
    
    
//    static let check = UIImage(named: "check")!
//
//    static let checked = UIImage(named: "checked")!
    static let check = UIImage(named: "icon_selected_NO_gray")!
    
//    static let checked = UIImage(named: "icon_selected_YES_circle")!
//    static let checked = UIImage(named: "icon_selected_yes_blue")!
    static let checked = UIImage(named: "icon_selected_yes_green")!
//    static let checked = UIImage(named: "icon_selected_YES_circle_big")!

}
