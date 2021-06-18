//
//	PKParkDetailController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/24 09:26
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 详情
@objcMembers class PKParkDetailController: UIViewController {

    var model = NSObject()

    var recordID: String = ""

    var dataModel = NSObject()

    lazy var viewModel = NSObject()

    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["标题", "UITableViewCellTitle", "50.0", "", "recharge", ],
            ["支付标签", "UITableViewCellSudokuButton", " 40.0", "", "recharge", ],
            ["车场地址", "UITableViewCell", "45.0", "", "park_name",],
            ],
            [["车位信息", "UITableViewCellSudokuView", "70.0", "请输入收款人", "park_name_copy", ],
            ["Excel", "UITableViewCellExcel", "140", "", "recharge", ],
            ],
            [["车位商城", "UITableViewCellValue1", "45.0", "", "park_name",],
             ],
            [["支付方式", "UITableViewCell", "45.0", "", "park_name",],
            ["九宫格2", "UITableViewCellSudokuButtonAfford", " 70.0", "", "recharge", ],
            ],
        ]
        return array
    }()

    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("进件须知", for: .normal)

        view.sizeToFit()
        view.addActionHandler({ (sender) in
//            let controller = IOPInPartAgreementController()
//            controller.type = "1"
//            self.navigationController?.pushViewController(controller, animated: true)

        }, for: .touchUpInside)
        return view
    }()
    
    lazy var btn: NNVeritalButtonView = {
        let sender = NNVeritalButtonView(frame: CGRect(x: 0, y: 0, width: 66, height: 66))
        sender.backgroundColor = .systemBlue
        sender.layer.cornerRadius = 33
        sender.layer.masksToBounds = true
        return sender
    }()

    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 40)
        view.dataSource = self
        view.delegate = self

        return view
    }()

    
    lazy var bottomView: PKParkDetailBottomView = {
        let view = PKParkDetailBottomView(frame: .zero)
        view.delegate = self
        return view
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("下一步", topPadding: 30);
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        return view
    }()

    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)

//        let controller = IOPInpartInvoiceReceiptController()
//        controller.dataModel = dataModel
//        self.navigationController?.pushViewController(controller, animated: true)
    }


    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        title = "详情"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

//        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
        view.addSubview(bottomView)
        tableView.addSubview(btn)

        handleRequestDetail()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bottomView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.height.equalTo(55)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalTo(bottomView.snp.top).offset(0)
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-33)
            make.left.equalToSuperview().offset(self.view.bounds.width-26-66)
            make.width.height.equalTo(66)
        }
                
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        handleRequestDetail()
    }

    func handleRequestDetail() {
//        if recordID == "" {
////            DDLog(self.model.creat_time, self.model.update_time)
//            dataModel = model
//            if ["1", "2"].contains(dataModel.status) == false {
//                noticeLabel.snp.remakeConstraints { (make) in
//                    make.height.equalTo(0);
//                }
//                tableView.snp.remakeConstraints { (make) in
//                    make.height.equalTo(self.view.bounds.height);
//                }
//            }
//            tableView.reloadData()
//            requestDetail(model.topic_id)
//        } else {
//            requestDetail(recordID)
//        }
    }

    func requestDetail(_ ID: String?) {
//        viewModel.detailAPI.order_id = ID ?? ""
//        viewModel.requestDetail { (model) in
////            DDLog(model.title)
//            self.dataModel = model.labels
//            self.dataModel.status = self.model.status
//            self.dataModel.reject_reason = self.model.reject_reason ?? ""
//            self.dataModel.creat_time = self.model.creat_time
//            self.dataModel.update_time = self.model.update_time
//            self.tableView.reloadData()
//        }
    }
    
}


extension PKParkDetailController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionList = list[indexPath.section]
        let itemList = sectionList[indexPath.row]
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
        case "UITableViewCell":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCell", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = UIColor.textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = UIColor.theme
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "上传"
                        
            let result: String = dataModel.valueText(forKeyPath: value4, defalut: "-")
            cell.separatorInset = indexPath.row == 0 ? .zero : UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellValue1":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = UIColor.textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = UIColor.theme
            cell.accessoryType = .disclosureIndicator;

            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "立即开通"
                        
            let result: String = dataModel.valueText(forKeyPath: value4, defalut: "-")

            cell.separatorInset = indexPath.row == 0 ? .zero : UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellTitle":
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            
//            cell.btn.isHidden = true

            cell.labelLeft.text = "西安环普地下停车场"
            cell.btnSize = CGSize(width: 50, height: 17)
            cell.btn.setBackgroundImage(UIImage(named: "icon_space_shop"), for: .normal)
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellExcel":
            let cell = UITableViewCellExcel.dequeueReusableCell(tableView)
            cell.isHidden = value2.cgFloatValue <= 0.0
            
            cell.excelView.visibleNumOfRow = 3
            cell.excelView.titleLabel.text = "    全天"
            cell.excelView.titleLabel.backgroundColor = UIColor.hexValue(0xF5F5F5)
            cell.excelView.headerBackgroudColor = .white
            
//            cell.excelView.titleList = ["时段", "单位价格", "封顶价格",]
            cell.excelView.dataList = [["08:00 - 20:00", "2元/小时", "封顶20元",],
                                       ["08:00 - 20:00", "2元/小时", "封顶20元",],
                                        ]
            cell.excelView.reloadData()

            cell.getViewLayer()
            return cell
            
        case "UITableViewCellSudokuButton":
            let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView);
//            cell.accessoryType = .disclosureIndicator
            cell.numOfRow = 4
            cell.row = 1
            cell.itemType = NNButton.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
            cell.items.forEach {
                
                guard let sender = $0 as? NNButton else { return }
//                sender.direction = .top
//                sender.setImage(UIImage(named: "icon_selected_yes_blue"), for: .normal)

                sender.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                }, for: .touchUpInside)
            }
            
            DDLog(cell.items.first!)

            cell.getViewLayer();
            return cell;
        case "UITableViewCellSudokuView":
            let cell = UITableViewCellSudokuView.dequeueReusableCell(tableView);
//            cell.accessoryType = .disclosureIndicator
            cell.numOfRow = 4
            cell.row = 1
            cell.itemType = NNVeritalButtonView.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
            cell.items.forEach {
                
                guard let sender = $0 as? NNVeritalButtonView else { return }
//                sender.direction = .top
//                sender.setImage(UIImage(named: "icon_selected_yes_blue"), for: .normal)
                sender.backgroundColor = .white
                sender.items[0].setTitleColor(.textColor9, for: .normal)
                sender.items[1].setTitleColor(.textColor3, for: .normal)

                switch sender.tag {
                case 0:
                    sender.items[0].setTitle("总车位数", for: .normal)

                case 1:
                    sender.items[0].setTitle("免费时长", for: .normal)

                case 2:
                    sender.items[0].setTitle("起始价格", for: .normal)

                case 3:
                    sender.items[0].setTitle("全天封顶", for: .normal)

                default:
                    break
                }
            }

            cell.getViewLayer();
            return cell;            
            
        case "UITableViewCellSudokuButtonAfford":
            let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView, identifier: value1);
//            cell.accessoryType = .disclosureIndicator
            cell.numOfRow = 6
            cell.row = 1
            cell.itemType = NNButton.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
            cell.items.forEach {
                
                guard let sender = $0 as? NNButton else { return }
                sender.direction = .top
                sender.setImage(UIImage(named: "icon_selected_yes_blue"), for: .normal)

                sender.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                }, for: .touchUpInside)
            }
//            items.filter { $0.tag >= count }.forEach({ $0.isHidden = true })
            DDLog(cell.items.first!)

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
        if section == 0 {
            return 0.01
        }
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

extension PKParkDetailController: PKParkDetailBottomViewDelegate{

    func parkdetailbottomview(_ view: PKParkDetailBottomView, sender: UIButton) {
        DDLog(sender.currentTitle ?? "")
    }
}
