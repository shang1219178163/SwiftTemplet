//
//  MenuActionController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/7/6.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand


@available(iOS 14.0, *)
class MenuActionController: UIViewController {
    
    
    var fileMenuData: [(String, [(String, UIImage?)])] {
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

//    lazy var btn: UIButton = {
//        let view = UIButton(type: .custom)
//        view.setTitle("done", for: .normal);
//        view.setTitleColor(UIColor.red, for: .normal)
////        view.adjustsImageWhenHighlighted = false
//        setupMenu(view) { action in
//            view.setTitle("\(action.title)", for: .normal);
//        }
//
////        view.setupDeferreMenu()
//        return view
//    }()

    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .grouped, rowHeight: 60)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.dataSource = self
        view.delegate = self

        return view
    }()
    

    var currentFavorite: String?
    
    lazy var list: [(String, UIColor)] = {
        return [("title", .lightBlue),
                ("title1", .lightRed),
                ("title2", .lightGreen),
                ("title3", .lightOrange),
        ]
    }()
    
    var isSingleChoose: Bool = false
    
    // MARK: -lifecycle
    deinit {
        print("farewell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // let's make some buttons the new iOS 14 way
        edgesForExtendedLayout = []
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItems =
            [("check", #selector(handActionBtn(_:))),
              ("Show", #selector(handActionBtn(_:))),
              ("延迟", #selector(handActionBtn(_:)))].map({

                let sender = UIButton(type: .custom)
                sender.setTitle($0.0, for: .normal)
                sender.addTarget(self, action: $0.1, for: .touchUpInside)

                switch $0.0 {
                case "check":
                    sender.showsMenuAsPrimaryAction = true
                    sender.menu = UIMenu()
                    sender.addAction(UIAction(title: "") { action in
                        guard let b = action.sender as? UIButton else { return }
                        func boyAction(for name: String) -> UIAction {
                            let image: UIImage? = name == self.currentFavorite ? UIImage(systemName: "checkmark") : nil
                            return UIAction(title: name, image: image) { [weak self] action in
                                self?.currentFavorite = action.title
                                b.setTitle("\(name)", for: .normal)
                                b.sizeToFit()
                                DDLog(name)
                            }
                        }
                        b.menu = UIMenu(title: "", children: [
                            boyAction(for: "Manny"),
                            boyAction(for: "Moe"),
                            boyAction(for: "Jack")
                        ])
                    },for: .menuActionTriggered)
                    
                case "Show":
                    sender.showsMenuAsPrimaryAction = true
                    sender.menu = UIMenu.map(data: fileMenuData, handler: { action in
                        switch action.title {
                        case "图标", "列表":
                            action.handleStateChange(sender, section: 1, isSingleChoose: true) {
                                DDLog(sender.checkRow(by: 1))
                        //        DDLog(sender.checkActions(by: 1))
                                let tmp = sender.checkActions(by: 1)
                                DDLog(tmp?.map({ $0.title }))
                            }
                            
//                            self.handleMenuAction(sender, action: action, section: 1, isSingleChoose: true) {
//                                DDLog(sender.checkRow(by: 1))
//                        //        DDLog(sender.checkActions(by: 1))
//                                let tmp = sender.checkActions(by: 1)
//                                DDLog(tmp?.map({ $0.title }))
//                            }

                        case "名称", "日期", "大小", "种类", "标签":
                            action.handleStateChange(sender, section: 2, isSingleChoose: false) {
                                DDLog(sender.checkRow(by: 2))
                        //        DDLog(sender.checkActions(by: 2))
                                let tmp = sender.checkActions(by: 2)
                                DDLog(tmp?.map({ $0.title }))
                            }

//                            self.handleMenuAction(sender, action: action, section: 2, isSingleChoose: false) {
//                                DDLog(sender.checkRow(by: 2))
//                        //        DDLog(sender.checkActions(by: 2))
//                                let tmp = sender.checkActions(by: 2)
//                                DDLog(tmp?.map({ $0.title }))
//                            }
                            
                        default:
                            DDLog(action.title)
                        }
                    })
                    
                case "延迟":
                    sender.showsMenuAsPrimaryAction = true
                    sender.setupDeferreMenu { action in
                        DDLog(action.title)
                    }
                    
                default:
                    DDLog(sender.currentTitle)
                    break
                }
            return UIBarButtonItem(customView: sender)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    @objc func handActionBtn(_ sender: UIButton) {
        DDLog(sender)
    }

//    @objc func handleMenuAction(_ sender: UIButton, action: UIAction, section: Int, isSingleChoose: Bool, handler: (()->Void)?) {
//        guard let menu = sender.menu?.children[section] as? UIMenu else { return }
//        if isSingleChoose == false {
//            if action.state == .off {
//                action.setValue(1, forKey: kActionState)
//            } else if action.state == .on {
//                action.setValue( 0, forKey: kActionState)
//            }
//        } else {
//            menu.children.forEach {
//                $0.setValue($0 == action ? 1 : 0, forKey: kActionState)
//            }
//        }
//        handler?()
////        DDLog(sender.checkRow(by: section))
//////        DDLog(sender.checkActions(by: section))
////        let tmp = sender.checkActions(by: section)
////        DDLog(tmp?.map({ $0.title }))
//    }
    

}


@available(iOS 14.0, *)
extension MenuActionController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = .theme;

        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = .gray;
        cell.accessoryType = .disclosureIndicator;
        
        let tuple = list[indexPath.row]
        cell.textLabel?.text = tuple.0

        cell.imageView?.image = UIImage(named: "img_update")
        
        
        if indexPath.row == 3 {
            cell.accessoryView = {
                let image = UIImage.chevron_right
                let sender = UIButton(type: .custom)
                sender.setImage(image, for: .normal)
                sender.sizeToFit()
                sender.imageView?.tintColor = .lightGray
                return sender
            }()
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        DDLog(itemList);
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView();
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
    
    // MARK: - UIContextMenuConfiguration
    
    func tableView( _ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        guard let cell = tableView.cellForRow(at: IndexPath(row: indexPath.row, section: 0))
          else {
            return nil
        }
        
        // 1
        let tuple = list[indexPath.row]

        return UIContextMenuConfiguration(identifier: "\(indexPath.row)" as NSCopying, previewProvider: nil) { _ in
          let mapAction = UIAction(title: "View map", image: UIImage(systemName: "map")) { action in
            DDLog(action.title)
          }
          
          let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
            DDLog(action.title)
            guard let image = cell.imageView?.image else { return }
            UIActivityViewController(activityItems: [image], applicationActivities: nil)
                .present()

          }
          return UIMenu(title: "", image: nil, children: [mapAction, shareAction])
        }
    }
    
    func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        guard let identifier = configuration.identifier as? String,
          let index = Int(identifier),
          let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
          else {
            return nil
        }
        return UITargetedPreview(view: cell.imageView ?? cell)
    }
    
    func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: UIContextMenuInteractionCommitAnimating) {
          guard let identifier = configuration.identifier as? String,
            let index = Int(identifier)
            else {
              return
          }
          let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
          animator.addCompletion {
            let greenVC = UIViewController()
            greenVC.view.backgroundColor = .systemGreen
            self.show(greenVC, sender: cell)
          }
    }
}


protocol SystemMenuAble{
    func setupDeferreMenu(_ handler: @escaping UIActionHandler)
}


extension SystemMenuAble where Self : UIButton{
        
    func setupDeferreMenu(_ handler: @escaping UIActionHandler) {
        if #available(iOS 14.0, *) {
            self.menu = UIMenu(title: "", children: [
                UIDeferredMenuElement({ completion in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        let items = (1...2).map { UIAction(title: "Dynamic Menu Item \($0)", handler: handler) }
                        let menus = [UIMenu(title: "", options: .displayInline, children: items)]
                        completion(menus)
                    }
                })
            ])
        }
    }
}


extension UIButton: SystemMenuAble{}


@available(iOS 13.0, *)
extension UIMenu{
    
    func logTree() {
        self.children.forEach {
            switch $0 {
            case let element as UIMenu:
                DDLog(element)
                element.logTree()
                
            case let element as UIAction:
                DDLog(element)
                
            default:
                break
            }
        }
    }
    
    
    func logTreeNew(_ block: ((Any) -> Void)?) {
        self.children.forEach {
            switch $0 {
            case let element as UIMenu:
                block?(element)
                element.logTreeNew(nil)

            case let element as UIAction:
                block?(element)

            default:
                break
            }
        }
    }
    
}
