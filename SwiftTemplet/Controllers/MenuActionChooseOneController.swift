//
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
                (title: "New Collection", image: UIImage(systemName: "plus")),
                (title: "Edit Collection", image: UIImage(systemName: "pencil")),
                ]
            ),
            ("Menu1", [
                (title: "List View", image: UIImage(systemName: "line.horizontal.3")),
                (title: "Icons View", image: UIImage(systemName: "square.grid.4x3.fill")),
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
            case "New Collection":
                DDLog(action.title)

            case "Edit Collection":
                DDLog(action.title)

            case "List View", "Icons View":
                guard let menu1 = sender.menu?.children[1] as? UIMenu else { return }
                menu1.children.forEach {
                    $0.setValue($0 == action ? 1 : 0, forKey: kActionState)
                }
                DDLog(self.isListMode)
                DDLog(sender.checkRow(by: 1), sender.checkRow(by: 0))

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
    func getMenuState(_ sender: UIButton) -> UIMenu {
        return UIMenu(title: "Menu", children: [
            UIMenu(title: "Menu", options: .displayInline, children: [
                UIAction(title: "New Collection", image: UIImage(systemName: "plus")) { (action) in
                    //Handle Code
                    DDLog(action.title)
                },
                UIAction(title: "Edit Collection", image: UIImage(systemName: "pencil")) { (action) in
                    // Handle code
                    DDLog(action.title)

                }
            ]),
            UIMenu(title: "Menu1", options: .displayInline, children:
                [(title: "List View", image: UIImage(systemName: "line.horizontal.3")),
                 (title: "Icons View", image: UIImage(systemName: "square.grid.4x3.fill")),]
                    .map({ (title: String, image: UIImage?) in
                        return UIAction(title: title, image: image, handler: { (action) in
                            guard let menu1 = sender.menu?.children[1] as? UIMenu else { return }
                            menu1.children.forEach {
                                $0.setValue($0 == action ? 1 : 0, forKey: kActionState)
                            }
                            DDLog(self.isListMode)
                        })
                    })
            ),
        ])
    }

}
