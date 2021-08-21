//
//  PKSettingsController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PKFeedBackController: UIViewController {

    lazy var tableView: UITableView = {
        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
            let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
            view.dataSource = self
            view.delegate = self
            return view
        }
        return tableView
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("退出当前账号", topPadding: 30);
        view.btn.setBackgroundColor(.systemRed, for: .normal)
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
//        view.label.text = """
//        · 请确认空车位无误后再修改.
//        · 修改空车位会影响车场饱和度数据统计.
//        · 部分车场空车位为0后车场将不能进车.
//        """
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)

    }
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setBackgroundColor(.theme, for: .normal)
        view.setBackgroundColor(.gray, for: .disabled)

        view.setTitle("确定", for: .normal)
        view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["问题或建议:", "UITableViewCellTextView", "170.0", "", "",],
             ["图片数组", "UITableViewCellSudokuButton", "110.0", "", "",],
             ["联系方式:", "UITableViewCellTextField", "50.0", "", "",],
            ],
        ]
        return array
    }()
    
    let imageDefault = UIImage(named: "img_photo_placeholder")
    
    var images = [UIImage(named: "img_photo_placeholder")]
    
    lazy var pickerVC: NNImageAndVideoPickerController = {
        let controller = NNImageAndVideoPickerController()
        controller.maxCount = 9
        controller.didFinishPickerBlock = { images, assets, isOriginImage in
            self.images.removeAll()
            self.images.insert(contentsOf: images, at: 0)
            self.images.append(self.imageDefault)
            DDLog(self.images)
            self.tableView.reloadData()
        }
        return controller
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white

        title = "反馈与建议"
        view.backgroundColor = .background
        
//        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
        view.addSubview(btn)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.bottom.equalToSuperview().offset(-10);
            make.height.equalTo(45);
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalTo(btn.snp.top).offset(0);
        }
    }

}

extension PKFeedBackController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionList = list[indexPath.section]
        let itemList = sectionList[indexPath.row]
        if itemList[2] == "" {
            return  UITableView.automaticDimension;
        }
        let height = itemList[2].cgFloatValue
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        let value0 = itemList[0]
        let value1 = itemList[1]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]

        switch value1 {
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")
            
            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left
            
            cell.labelLeft.text = value0
//            cell.textfield.asoryView(true, text: itemList.last!)
            cell.textfield.addRightViewLabel { (sender) in
                sender.font = UIFont.systemFont(ofSize: 14)
                sender.text = itemList.last!
            }
//            cell.textfield.rightView = nil;
//            cell.textfield.textAlignment = .right
            
            cell.block { (textField) in
                DDLog(textField.text)
            }
            cell.getViewLayer()
            return cell
                
        case "UITableViewCellTextView":
            let cell = UITableViewCellTextView.dequeueReusableCell(tableView)
            cell.labelLeft.text = "备注信息"
            cell.textView.placeHolderLabel.text = "最多140字"
            cell.block { ( view:UITableViewCellTextView, text:String) in
                DDLog(text)
            }
            
            cell.labelLeft.text = value0

            cell.getViewLayer()
            return cell
            
        case "UITableViewCellSudokuButton":
            let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView);
//            cell.accessoryType = .disclosureIndicator
            cell.inset = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 15)
            cell.numOfRow = 4
            cell.row = 1
            cell.row = images.count % cell.numOfRow == 0 ? images.count/cell.numOfRow : images.count/cell.numOfRow + 1
            cell.setNeedsLayout()

            cell.itemType = NNButton.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
            cell.items.forEach {
                DDLog($0.tag, images.count)

                guard let sender = $0 as? NNButton else { return }
                sender.direction = .top
                sender.iconLocation = .rightTop
                sender.iconSize = CGSize(width: 20, height: 20)
                sender.iconOffset = UIOffset(horizontal: 8, vertical: -8)
                sender.eventInsetDX = 8
                sender.eventInsetDY = 8
                sender.iconBtn.setBackgroundColor(.red, for: .normal)

                if self.images.count > sender.tag {
                    let image = self.images[sender.tag]
                    sender.setBackgroundImage(image, for: .normal)
                    sender.iconBtn.isHidden = (image == self.imageDefault)
                    
                    sender.setTitle(nil, for: .normal)
                }

//                sender.setBackgroundImage(UIImage(named: "icon_selected_yes_blue"), for: .normal)
//                sender.setImage(UIImage(named: "icon_selected_yes_blue"), for: .normal)
                sender.setNeedsLayout()

                sender.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                    
                    if let image = sender.backgroundImage(for: .normal), image == self.imageDefault {
                        self.pickerVC.show()
                    }
                }, for: .touchUpInside)
                
                sender.iconBtn.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                    if self.images.count > control.tag {
                        self.images.remove(at: control.tag)
                        self.tableView.reloadData()
                    }
                }, for: .touchUpInside)
            }
            
            cell.items.forEach({ $0.isHidden = false })
            if images.count == 1 {
                cell.items.filter { $0.tag >= images.count }.forEach({ $0.isHidden = true })
            } else if images.count >= self.pickerVC.maxCount {

            } else {
                cell.items.filter { $0.tag > images.count - 1 }.forEach({ $0.isHidden = true })
            }
        
//            let items = cell.items.filter { $0.tag >= images.count }
//            DDLog(cell.items.count, items, images.count)
            cell.getViewLayer();
            return cell;
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
