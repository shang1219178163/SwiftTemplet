//
//	PKParkBriefController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/24 09:26
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 详情
@objcMembers class PKParkBriefController: UIViewController {

    var model = NSObject()

    var recordID: String = ""

    var dataModel = NSObject()

    lazy var viewModel = NSObject()

    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["标题", "UITableViewCellTitle", "35.0", "", "recharge", ],
            ["支付标签", "UITableViewCellParkInfo", " 30.0", "", "recharge", ],
            ["车位信息", "UITableViewCellSudokuView", "70.0", "请输入收款人", "park_name_copy", ],
//            ["路线规划", "UITableViewCellSegmentLine", "45.0", "", "park_name", "查路线,去这里", ],
            ["路线规划", "UITableViewCellSudokuButton", "45.0", "", "park_name", "查路线,去这里", ],
            ],
        ]
        return array
    }()

    lazy var rightBtn: UIButton = {
        let button = UIButton.create(.zero, title: "进件须知", textColor: .theme, backgroundColor: .clear)
        button.sizeToFit()
        button.addActionHandler({ (sender) in
            let controller = BlankSpaceViewController()
            self.navigationController?.pushViewController(controller, animated: true)

        }, for: .touchUpInside)
        return button
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
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        title = "详情"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

//        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
        tableView.addSubview(btn)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
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

}


extension PKParkBriefController: UITableViewDataSource, UITableViewDelegate{
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
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "上传"

//            let result: String = dataModel.valueText(forKeyPath: value4, defalut: "-")
//            cell.separatorInset = indexPath.row == 0 ? .zero : UIEdgeInsetsMake(0, 0, 0, kScreenWidth);
//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellTitle":
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
//            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.btn.isHidden = true

            cell.labelLeft.text = "西安环普地下停车场"
            cell.btnSize = CGSize(width: 50, height: 17)
            cell.btn.setBackgroundImage(UIImage(named: "icon_space_shop"), for: .normal)
//            cell.getViewLayer()
            return cell
                        
        case "UITableViewCellParkInfo":
            let cell = UITableViewCellParkInfo.dequeueReusableCell(tableView);
            cell.inset = UIEdgeInsetsMake(5, 10, 5, 10)
//            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.getViewLayer();
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

//            cell.getViewLayer();
            return cell;
                  
        case "UITableViewCellSudokuButton":
            let cell = UITableViewCellSudokuButton.dequeueReusableCell(tableView);
//            cell.accessoryType = .disclosureIndicator
            cell.numOfRow = 2
            cell.row = 1
            cell.itemType = UIButton.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
            cell.items.forEach {

                guard let sender = $0 as? UIButton else { return }
                $0.setTitleColor(.textColor3, for: .normal)

                switch sender.tag {
                case 0:
                    let image = UIImage(named: "icon_map_route")?.withRenderingMode(.alwaysOriginal)
                    sender.setImage(image, for: .normal)
                    sender.setTitle(" 查路线", for: .normal)
                case 1:
                    let image = UIImage(named: "icon_map_diver")?.withRenderingMode(.alwaysOriginal)
                    sender.setImage(image, for: .normal)
                    sender.setTitle(" 去这里", for: .normal)

                default:
                    break
                }

                sender.addActionHandler({ control in
                    
                    DDLog(sender.tag)
                }, for: .touchUpInside)
            }
            
            cell.showDividers = true
//            cell.dividerColor = .red
//            cell.dividerWidth = 2
//            cell.dividerSpacing = 10
            
//            cell.getViewLayer();
            return cell;
            
        case "UITableViewCellSegmentLine":
            let cell = UITableViewCellSegmentLine.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            cell.labelLeft.isHidden = true
                        
            cell.separatorInset = .zero

            cell.segmentCtl.showStyle = .seprateLine
            cell.segmentCtl.layer.borderColor = UIColor.clear.cgColor
            
            cell.segmentCtl.setImage(UIImage(named: "icon_find_route")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 0)
            cell.segmentCtl.setImage(UIImage(named: "icon_go_here")?.withRenderingMode(.alwaysOriginal), forSegmentAt: 1)

            let titles = itemList.last!.components(separatedBy: ",")
//            segmentCtl.items = titles
            cell.segmentCtl.addActionHandler({ (sender) in
                DDLog(sender.selectedSegmentIndex)
                
            }, for: .valueChanged)
             
//            cell.getViewLayer()
            return cell
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

extension PKParkBriefController: PKParkDetailBottomViewDelegate{

    func parkdetailbottomview(_ view: PKParkDetailBottomView, sender: UIButton) {
        DDLog(sender.currentTitle ?? "")
    }
}

