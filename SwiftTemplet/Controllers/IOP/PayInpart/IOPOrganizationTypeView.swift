//
//	IOPOrganizationTypeView.swift
//	MacTemplet
//
//	Created by shang on 2020/12/16 14:16
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol IOPOrganizationTypeViewDelegate{
    @objc func IOPOrganizationTypeView(_ view: IOPOrganizationTypeView)
    
}
        
///
@objcMembers class IOPOrganizationTypeView: UIView {

    weak var delegate: IOPOrganizationTypeViewDelegate?

    var block: ((IOPOrganizationTypeView, Int) -> Void)?
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    var list = [[String]]()
    
    var indexP = IndexPath(row: 0, section: 0)
    
    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView.create(self.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        view.isScrollEnabled = false
        return view
    }()
        
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        
//        list = [["企业", "UITableViewCellChioceItem", "80", "营业执照上的主体类型一般为有限公司、有限责任公司", ],
//        ["个体户", "UITableViewCellChioceItem", "80", "营业执照上的主体类型一般为个体户、个体工商户、个体经营", ],
//        ["党政、机关及事业单位", "UITableViewCellChioceItem", "100",  "包括国内各级、各类政府机构、事业单位等（如：公安、党团、司法、交通、旅游、工商税务、市政、医疗、教育、学校等机构)", ],
//        ["其他组织", "UITableViewCellChioceItem", "100",  "不属于企业、政府/事业单位的组织机构（如社会团体、民办非企业、基金会），要求机构已办理组织机构代码证", ],
//        ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
//        tableView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(inset.top);
//            make.left.equalToSuperview().offset(inset.left);
//            make.right.equalToSuperview().offset(-inset.right);
//            make.bottom.equalToSuperview().offset(-inset.bottom);
//        }
        
    }
    
    // MARK: - funtions

        
}

extension IOPOrganizationTypeView: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.row]
        return itemList[2].cgFloatValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        let value2 = itemList[2]

        let cell = UITableViewCellChioceItem.dequeueReusableCell(tableView)
        cell.backgroundColor = UIColor.hexValue(0xFAFAFA)
        cell.isHidden = value2.cgFloatValue <= 0.0

//        cell.btnOffset = CGPoint(x: 0, y: value2.cgFloatValue*0.15)
        cell.btn.isSelected = (indexPath == indexP)

//        cell.textLabel?.text = itemList[2]
//        cell.detailTextLabel?.text = itemList[3]
        
        let attr: AttrString = """
        \(itemList[0], .font(UIFont.systemFont(ofSize: 15, weight: .medium)))
        \(itemList[3], .color(.textColor6), .font(UIFont.systemFont(ofSize: 13)), .paraStyle(.left, lineSpacing: 0, paragraphSpacingBefore: 5, lineBreakMode: .byWordWrapping))
        """
        cell.label.attributedText = attr.attributedString
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.indexP != indexPath  {
            let newCell = tableView.cellForRow(at: indexPath)
//            newCell?.accessoryType = .checkmark
            newCell?.btn.isSelected = true
            newCell?.textLabel?.textColor = .theme

            let oldCell = tableView.cellForRow(at: indexP)
//            oldCell?.accessoryType = .none
            oldCell?.btn.isSelected = false
            oldCell?.textLabel?.textColor = .textColor6;
            self.indexP = indexPath
        }
        
        block?(self, indexP.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
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
