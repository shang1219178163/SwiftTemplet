//
//	PKParkBriefView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/04 19:24
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand


@objc protocol PKParkBriefViewDelegate{
    @objc func parkBriefView(_ view: PKParkBriefView, index: Int)
    @objc func parkBriefView(_ view: PKParkBriefView, didSelectRowAt indexPath: IndexPath)
}
        
///
@objcMembers class PKParkBriefView: UIView {

    weak var delegate: PKParkBriefViewDelegate?
    var dataModel = NSObject()

//    var dataModel = PKParkDetailModel(){
//        willSet{
//            DDLog(newValue.name, newValue.spaceEmpty, newValue.spaceTotal)
//            btn.items[0].setTitle(newValue.spaceEmpty, for: .normal)
//            btn.items[1].setTitle("空车位", for: .normal)
//        }
//    }

    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["标题", "UITableViewCellTitle", "45.0", "", "", ],
            ["支付标签", "UITableViewCellParkInfo", " 30.0", "", "", ],
            ["车位信息", "UITableViewCellSudokuView", "70.0", "请输入收款人", "park_name_copy", ],
//            ["路线规划", "UITableViewCellSegmentLine", "45.0", "", "park_name", "查路线,去这里", ],
            ["路线规划", "UITableViewCellSudokuButton", "45.0", "", "", "查路线,去这里", ],
            ],
        ]
        return array
    }()
    
    var btnSize = CGSize(width: 66, height: 66)

    lazy var btn: NNVeritalButtonView = {
        let sender = NNVeritalButtonView(frame: CGRect(x: 0, y: 0, width: self.btnSize.width, height: self.btnSize.height))
        sender.backgroundColor = .systemBlue
        sender.layer.cornerRadius = 33
        sender.layer.masksToBounds = true
        sender.inset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        sender.items.forEach { (item) in
            if item.tag == 0 {
                item.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            } else {
                item.titleLabel?.font = UIFont.systemFont(ofSize: 12)
                item.setTitleColor(UIColor.hexValue(0xffffff, a: 0.8), for: .normal)
            }
        }
        
        return sender
    }()

    lazy var tableView: UITableView = {
        let view: UITableView = UITableView.create(self.bounds, style: .plain, rowHeight: 40)
        view.dataSource = self
        view.delegate = self
        view.isScrollEnabled = false
        return view
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-self.btnSize.height*0.5)
            make.right.equalToSuperview().offset(-26)
            make.size.equalTo(self.btnSize)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
        
//        let cornerRadius: CGFloat = 10
//
//        let maskPath = UIBezierPath()
//        maskPath.move(to: CGPointMake(0, cornerRadius))
//        maskPath.addArc(withCenter: CGPointMake(cornerRadius, cornerRadius),
//                        radius: cornerRadius,
//                        startAngle: CGRadianFromDegrees(180),
//                        endAngle: CGRadianFromDegrees(270),
//                        clockwise: true)
//
//        let pointBtnLeft = CGPointMake(bounds.width - 26 - btnSize.width, 0)
//        maskPath.addLine(to: pointBtnLeft)
//        maskPath.addArc(withCenter: CGPointMake(pointBtnLeft.x + btnSize.width*0.5, 0),
//                        radius: 33,
//                        startAngle: CGRadianFromDegrees(180),
//                        endAngle: CGRadianFromDegrees(0),
//                        clockwise: true)
//
//        maskPath.addLine(to: CGPointMake(bounds.width - cornerRadius, 0))
//        maskPath.addArc(withCenter: CGPointMake(bounds.width - cornerRadius, cornerRadius),
//                        radius: cornerRadius,
//                        startAngle: CGRadianFromDegrees(270),
//                        endAngle: CGRadianFromDegrees(0),
//                        clockwise: true)
//
//        maskPath.addLine(to: CGPointMake(bounds.width, bounds.height))
//        maskPath.addLine(to: CGPointMake(0, bounds.height))
//        maskPath.addLine(to: CGPointMake(0, bounds.height - cornerRadius))
//        maskPath.close()
//
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = bounds
//        maskLayer.path = maskPath.cgPath
//        maskLayer.borderColor = UIColor.red.cgColor
//        maskLayer.borderWidth = 1
//        layer.mask = maskLayer;
        
        //阴影
        layer.shadowColor = UIColor.hexValue(0x000000, a: 0.12).cgColor
        layer.shadowRadius = 3.5
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    // MARK: - funtions
    
}

extension PKParkBriefView: UITableViewDataSource, UITableViewDelegate{
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
            cell.inset = UIEdgeInsets(top: 10, left: 15, bottom: 5, right: 15)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 17, weight: .medium)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.btn.isHidden = true
//            cell.labelLeft.text = dataModel.name ?? "--"
//            cell.btnSize = CGSize(width: 50, height: 17)
//            cell.btn.setBackgroundImage(UIImage(named: "icon_space_shop"), for: .normal)
//            cell.btn.isHidden = !dataModel.parking_mall

//            cell.getViewLayer()
            return cell
                        
        case "UITableViewCellParkInfo":
            let cell = UITableViewCellParkInfo.dequeueReusableCell(tableView);
            cell.inset = UIEdgeInsetsMake(5, 15, 5, 10)
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.btnOne.isHidden = ![dataModel.etc, dataModel.alipay, dataModel.wechat].contains(true)
//            cell.btnTwo.isHidden = !dataModel.cash
//            cell.labelInfo.text  = "距您" + DistanceInfoFromTwoPoint(dataModel.coordinate, IOPStorageManager.userCoordinate)
//
//            cell.getViewLayer();
            return cell;
            
        case "UITableViewCellSudokuView":
            let cell = UITableViewCellSudokuView.dequeueReusableCell(tableView);
            cell.numOfRow = 3
            cell.row = 1
            cell.itemType = NNVeritalButtonView.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
//            cell.items.forEach {
//
//                guard let sender = $0 as? NNVeritalButtonView else { return }
//                sender.direction = .top
//                sender.setImage(UIImage(named: "btn_selected_YES"), for: .normal)
//                sender.backgroundColor = .white
//                sender.items[0].setTitleColor(.textColor3, for: .normal)
//                sender.items[1].setTitleColor(.textColor9, for: .normal)
//                sender.items[0].titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//                sender.items[1].titleLabel?.font = UIFont.systemFont(ofSize: 11)
//
//                switch sender.tag {
//                case 0:
//                    sender.items[1].setTitle("免费时长", for: .normal)
//                    if let charging_rules = dataModel.charging_rules,
//                        let free_time = charging_rules.free_time {
////                        sender.items[0].setTitle("\(free_time)分钟", for: .normal)
//
//                        let attStr = NSAttributedString.attString("\(free_time)分钟", textTaps: [free_time], font: 12, tapFont: 20, color: .textColor3, tapColor: .textColor3, alignment: .center, rangeOptions: [])
//                        sender.items[0].setAttributedTitle(attStr, for: .normal)
//                    } else {
//                        sender.items[0].setTitle("\("--")", for: .normal)
//                    }
//
//                case 1:
//                    sender.items[1].setTitle("起始价格", for: .normal)
//                    if let charging_rules = dataModel.charging_rules,
//                        let starting_price = charging_rules.starting_price {
//                        let result = String(format: "%.2f", Float(starting_price.intValue)/100)
////                        sender.items[0].setTitle("\(result)元", for: .normal)
//
//                        let attStr = NSAttributedString.attString("\(result)元", textTaps: [result], font: 12, tapFont: 20, color: .textColor3, tapColor: .textColor3, alignment: .center, rangeOptions: [])
//                        sender.items[0].setAttributedTitle(attStr, for: .normal)
//                    } else {
//                        sender.items[0].setTitle("\("-")元", for: .normal)
//                    }
//
//                case 2:
//                    sender.items[1].setTitle("全天封顶", for: .normal)
//                    if let charging_rules = dataModel.charging_rules,
//                        let caps = charging_rules.caps {
//                        let result = String(format: "%.2f", Float(caps.intValue)/100)
////                        sender.items[0].setTitle("\(result)元", for: .normal)
//
//                        let attStr = NSAttributedString.attString("\(result)元", textTaps: [result], font: 12, tapFont: 20, color: .textColor3, tapColor: .textColor3, alignment: .center, rangeOptions: [])
//                        sender.items[0].setAttributedTitle(attStr, for: .normal)
//                    } else {
//                        sender.items[0].setTitle("\("-")元", for: .normal)
//                    }
//
//                default:
//                    break
//                }
//            }

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

                let sender: UIButton = $0
                sender.setTitleColor(.textColor3, for: .normal)

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
                    guard let sender = control as? UIButton else { return }
                    DDLog(sender.tag)
                    self.delegate?.parkBriefView(self, index: sender.tag)
                }, for: .touchUpInside)
            }
            cell.showDividers = true

//            cell.getViewLayer()
            return cell
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.parkBriefView(self, didSelectRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.01
        }
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
