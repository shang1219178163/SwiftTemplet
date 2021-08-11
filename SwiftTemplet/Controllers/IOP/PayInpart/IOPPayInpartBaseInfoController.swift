//
//  IOPPayInpartBaseInfoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

@objc enum OrganizationType: Int {
    case company, individual, gov, other
    
}

/// 线上支付进件页面1
@objcMembers class IOPPayInpartBaseInfoController: UIViewController{
    
    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Next", for: .normal)

        view.addActionHandler({ (sender) in
//            let controller = UIViewController()
//            self.navigationController?.pushViewController(controller, animated: true)
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var processingView: NNProcessingView = {
        var view = NNProcessingView(frame: CGRectMake(0, 0, self.view.bounds.width, 70))
        
        var list: [String] = []
        view.items = ["基础信息", "企业信息", "完成"]
        view.contentInset = UIEdgeInsetsMake(0, 20, 0, 20)
        view.padding = 90
        view.index = 0
        
//        view.getViewLayer()
        return view;
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("下一步", topPadding: 0, height: 50);
        view.label.isHidden = true
        view.labelTop.isHidden = true

        view.btn.addActionHandler { (control) in
            DDLog(control)
            self.navigationController?.pushVC(IOPPayInpartCompanyEntityInfoController.self, animated: true, block: { (vc) in
                vc.dataModel = self.dataModel
                vc.orgType = OrganizationType(rawValue: self.organizationTypesView.indexP.row)!
                
            })
        }
        return view
    }()
    
    var kUltimateBeneficiaryExplain = """
    最终受益人说明：
    1、直接或者间接拥有超过25%公司股权或者表决权的自然人。
    2、通过人事、财务等其他方式对公司进行控制的自然人。
    3、公司的高级管理人员，包括公司的经理、副经理、财务负责人、上市公司董事会秘书和公司章程规定的其他人员。
    """
    
    var kPayExplain = """
    说明：
    1、线上支付进件，会协助车场开通剩余线上支付方式。
    2、如车场已经自行开通了以上3种线上支付方式，则无需进行线上支付进件
    """
    
    lazy var list: [[[String]]] = {
        return [
            [["主体类型", "UITableViewCellTitle", "40", "", "", ],
                 ["类型选择", "UITableViewCellOrganization", "390","", "recharge",],
            ],
            [["营业执照", "UITableViewCellTitle", "40", "", "", ],
             ["经营者/法人是否为最终受益人", "UITableViewCellSegment", "60.0", "", "recharge", "是,否",],
             ["说明", "UITableViewCellPlain", "120", "", "", kUltimateBeneficiaryExplain],
            ],
            [["当前车场已开通线上支付", "UITableViewCellTitle", "40", "", "", ],
             ["类型选择", "UITableViewCellSudokuButton", "50","", "recharge", "微信,支付宝,银商"],
             ["说明", "UITableViewCellPlain", "120", "", "", kPayExplain],
            ],
        ]
    }()

    var dataModel = NSObject()
    
    var organizationTypes =
        [["企业", "UITableViewCellChioceItem", "80", "营业执照上的主体类型一般为有限公司、有限责任公司", ],
         ["个体户", "UITableViewCellChioceItem", "80", "营业执照上的主体类型一般为个体户、个体工商户、个体经营", ],
         ["党政、机关及事业单位", "UITableViewCellChioceItem", "100",  "包括国内各级、各类政府机构、事业单位等（如：公安、党团、司法、交通、旅游、工商税务、市政、医疗、教育、学校等机构)", ],
         ["其他组织", "UITableViewCellChioceItem", "100",  "不属于企业、政府/事业单位的组织机构（如社会团体、民办非企业、基金会），要求机构已办理组织机构代码证", ],
        ]
    
    lazy var organizationTypesView: IOPOrganizationTypeView = {
        let view = IOPOrganizationTypeView(frame: .zero)
        view.list = self.organizationTypes;

        let height = view.list.map({ (values: [String]) in
            return values[2].cgFloatValue
        }).reduce(0, +)
        
        let inset: UIEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        view.frame = CGRect(x: inset.left, y: inset.top, width: kScreenWidth - (inset.left + inset.right), height: height)
        
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.hexValue(0xdddddd).cgColor
//        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        view.block = { sender, idx in
            DDLog(idx)
        }
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = "主体类型"
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(footerView);
        footerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(60);
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalTo(footerView.snp.top).offset(0);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        

    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = UIColor.white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        view.addSubview(tableView);
        tableView.tableHeaderView = processingView;
//        tableView.tableFooterView = footerView;
    }


}

extension IOPPayInpartBaseInfoController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        return itemList[2].cgFloatValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        let value0 = itemList[0]
        let value2 = itemList[2]

        switch itemList[1] {
        case "UITableViewCellTitle":
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            
            cell.btn.isHidden = true
            cell.labelLeft.text = value0
            cell.btn.addActionHandler({ (sender) in
//                UIAlertController.showAlert(value0, message: value3, alignment: .left)
                
            }, for: .touchUpInside)

//            cell.getViewLayer()
            return cell
            
    
        case "UITableViewCellOrganization":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "IOPOrganizationTypeView")
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.text = "--"
            cell.textLabel?.textColor = .textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
            cell.detailTextLabel?.text = "--"
            cell.detailTextLabel?.textColor = .textColor6;
    //        cell.accessoryType = .disclosureIndicator;
            cell.detailTextLabel?.numberOfLines = 0

//            var typeView: IOPOrganizationTypeView?
//            if let tmp = cell.contentView.viewWithTag(100) as? IOPOrganizationTypeView {
//                typeView = tmp
//            } else {
//                cell.contentView.addSubview(self.organizationTypesView)
//            }
//            typeView?.getViewLayer()
            
            if cell.contentView.viewWithTag(100) == nil {
                cell.contentView.addSubview(self.organizationTypesView)
            }
//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellSegment":
            let cell = UITableViewCellSegment.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")
            
            cell.labelLeft.text = value0
            let titles = itemList.last!.components(separatedBy: ",")
            cell.segmentCtl.items = titles
            cell.segmentCtl.addActionHandler({ (sender) in
                DDLog(sender.selectedSegmentIndex)

            }, for: .valueChanged)
     
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellSudokuButton":
            let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView);
//            cell.accessoryType = .disclosureIndicator
            cell.inset = UIEdgeInsetsMake(15, 15, 15, 15)
            cell.interitemSpacing = 70
            let items = itemList.last!.components(separatedBy: ",")
            
            cell.numOfRow = 3
            cell.row = 1
            cell.itemType = NNButton.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
            cell.items.forEach {

                guard let sender = $0 as? NNButton else { return }
                sender.direction = .left
                sender.setImage(UIImage(named: "icon_selected_no_rect"), for: .normal)
                sender.setImage(UIImage(named: "icon_selected_yes_rect"), for: .selected)

                sender.setTitle(items[sender.tag], for: .normal)

                sender.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                    sender.isSelected.toggle()

                }, for: .touchUpInside)
            }
                        
            cell.getViewLayer();
            return cell;
            
        case "UITableViewCellPlain":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellPlain")
            cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
            cell.textLabel?.text = "--"
            cell.textLabel?.textColor = .textColor6;
            cell.textLabel?.numberOfLines = 0
            
            let attr: AttrString = """
            \(itemList.last!, .font(UIFont.systemFont(ofSize: 13)), .color(.textColor6))
            """
            cell.textLabel?.attributedText = attr.attributedString
//            cell.textLabel?.text = itemList.last!
//            cell.getViewLayer()
            return cell;
            
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == tableView.numberOfSections - 1 {
            return 10.01;
        }
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
