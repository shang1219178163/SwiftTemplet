//#imageLiteral(resourceName: "221625652050_.pic.jpg")
//  MenuActionChooseOneController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/7/7.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@available(iOS 14.0, *)
class MenuActionChooseOneController: UIViewController {

    var menuData: [(String, [(String, UIImage?)])] {
        return [
            ("Menu", [
                (title: "选择", image: UIImage.checkmark_circle),
                (title: "新建文件夹", image: UIImage.folder_badge_plus),
                (title: "扫描文档", image: UIImage.doc_text_viewfinder),
                (title: "连接服务器", image: UIImage.rectangle_connected_to_line_below),
                ]
            ),
            ("Menu1", [
                (title: "图标", image: UIImage.square_grid_2x2),
                (title: "列表", image: UIImage.list_bullet),
                ]
            ),
            
            ("Menu2", [
                (title: "名称", image: UIImage.chevron_up),
                (title: "日期", image: UIImage.chevron_down),
                (title: "大小", image: UIImage.chevron_left),
                (title: "种类", image: UIImage.chevron_right),
                (title: "标签", image: nil),
                ]
            ),
        ]
    }
    
    lazy var menuBtn: UIButton = {
        let sender = UIButton(type: .custom)
        sender.setTitle("menu", for: .normal);
        sender.showsMenuAsPrimaryAction = true
        sender.menu = UIMenu.map(data: menuData, handler: { action in
            switch action.title {
            case "图标", "列表":
                action.handleStateChange(sender, section: 1, isSingleChoose: true) {
                    DDLog(sender.checkRow(by: 1))
            //        DDLog(sender.checkActions(by: 1))
                    let tmp = sender.checkActions(by: 1)
                    DDLog(tmp?.map({ $0.title }))
                }

            case "名称", "日期", "大小", "种类", "标签":
                action.handleStateChange(sender, section: 2, isSingleChoose: false) {
                    DDLog(sender.checkRow(by: 2))
            //        DDLog(sender.checkActions(by: 2))
                    let tmp = sender.checkActions(by: 2)
                    DDLog(tmp?.map({ $0.title }))
                }
                
            default:
                DDLog(action.title)
            }
        })
        return sender
    }()
    
    
    var isListMode: Bool{
        guard let row = menuBtn.checkRow(by: 1) else { return true }
        return row == 1
//        guard let menu1 = self.menuBtn.menu?.children[1] as? UIMenu,
//              let value = menu1.children[0].value(forKey: kActionState) as? Int
//              else { return true }
//        return value == 1
    }
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "MenuActionChooseOne"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: menuBtn)
    }
    
    // MARK: -funtions

}
