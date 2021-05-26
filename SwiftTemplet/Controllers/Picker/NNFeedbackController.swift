//
//	NNFeedbackController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/19 08:38
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

///上传视图封装
class NNFeedbackController: UIViewController {

    lazy var tableView: UITableView = {
        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
            let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
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

        let vc = NNUploadImagesController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setBackgroundColor(.theme, for: .normal)
        view.setBackgroundColor(.gray, for: .disabled)

        view.setTitle("确定", for: .normal)
        view.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var uploadImagesView: NNUploadImagesView = {
        let view = NNUploadImagesView()
        view.frame = CGRectMake(0, 0, self.view.bounds.width, 110)
        view.currrentVC = self
        view.images = [view.imageDefault]
        view.maxCount = 4
        view.rowHeight = view.frame.height
        view.delegate = self

        view.tag = 1000
        return view
    }()
    
    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["问题或建议:", "UITableViewCellTextView", "170.0", "", "",],
             ["图片数组", "UITableViewCellPhotoPicker", "110.0", "", "",],
             ["联系方式:", "UITableViewCellTextField", "50.0", "", "",],
            ],
        ]
        return array
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

}

extension NNFeedbackController: UITableViewDataSource, UITableViewDelegate{
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
            return UITableView.automaticDimension;
        }
        if itemList[1] == "UITableViewCellPhotoPicker" {
            return uploadImagesView.totalHeight
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
            cell.hasAsterisk = value0.contains("*")
            
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
                DDLog(textField.text as Any)
            }
            cell.getViewLayer()
            return cell
                
        case "UITableViewCellTextView":
            let cell = UITableViewCellTextView.dequeueReusableCell(tableView)
            cell.type = 1;
            cell.labelLeft.text = "备注信息"
            cell.textView.placeHolderLabel.text = "最多140字"
            cell.block { ( view:UITableViewCellTextView, text:String) in
                DDLog(text)
            }
            
            cell.labelLeft.text = value0

            cell.getViewLayer()
            return cell
            
        case "UITableViewCellPhotoPicker":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: value1);
            
            if let view = cell.contentView.viewWithTag(1000) as? NNUploadImagesView {
                DDLog(view.self)
            } else {
                cell.contentView.addSubview(uploadImagesView)
            }
        
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


extension NNFeedbackController: NNUploadImagesViewDelegate {
    func didFinishPicker(_ images: [UIImage], isSelectOriginalPhoto: Bool) {
        DDLog(images.count)
    }
}
