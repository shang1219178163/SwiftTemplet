//
//	PKRegionParkListController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/27 15:44
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
        
/// 列表
@objcMembers class PKRegionParkListController: UIViewController{
    
    /// 数据请求返回
    var dataModel = NSObject()
    
//    lazy var viewModel: PKCurrentRegionParkListViewModel = {
//        let viewModel = PKCurrentRegionParkListViewModel()
//        viewModel.delegate = self
//        return viewModel
//    }()

    var dataList = NSMutableArray()

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view: UITableView = UITableView.create(self.view.bounds, style: .plain, rowHeight: 95)
        view.dataSource = self
        view.delegate = self

//        view.mj_header = MJRefreshNormalHeader(refreshingBlock: {
//            self.viewModel.requestRefresh()
//        });
//
//        view.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
//            self.viewModel.requestRefresh()
//        });
        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let sender = UIButton(type: .custom)
        sender.setBackgroundImage(UIImage(named: "icon_quit"), for: .normal)
        sender.addActionHandler({ (control) in
            print(control)
            
        }, for: .touchUpInside)
        return sender
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        
    }
    
    lazy var groupView: NNButtonGroupView = {
        var view = NNButtonGroupView(frame: .zero)
        view.padding = 15;
        view.numberOfRow = 5;
        view.isMutiChoose = false;
        view.cornerRadius = 15
        view.fontSize = 12

        view.titleColor = .textColor3
        view.backgroudImage = UIImage(color: .white)

        view.selectedTitleColor = .systemBlue
//        view.selectedBackgroudImage = UIImage(named: "btn_selected_multiple")!
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any, itemsView.selectedList.count, itemsView.selectedIdxList.count)

            }
        })
        return view;
    }()
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        groupView.items = ["全部", "路侧", "地上", "地下", "停车楼", ]

        view.addSubview(groupView)
        view.addSubview(rightBtn)
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        groupView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-60);
            make.height.equalTo(30);
        }
        
        rightBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(groupView)
            make.right.equalToSuperview().offset(-15);
            make.width.height.equalTo(15);
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(groupView.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions

    func requestForSearch(_ searchbar: UISearchBar) {

        
    }


}

extension PKRegionParkListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell.dequeueReusableCell(tableView)
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
//        cell.textLabel?.textColor = .textColor3
////        cell.isHidden = value2.cgFloatValue <= 0.0
//
//        cell.textLabel?.text = "value0"
        
//        let sender: NNButton = {
//            let btn: NNButton = {
//                let sender = NNButton(type: .custom)
//                sender.frame = CGRect(x: 0, y: 0, width: 27, height: 35)
//                sender.labelHeight = 15
//
//                sender.direction = .top
//                sender.setTitleColor(.textColor3, for: .normal)
//                return sender
//            }()
//            cell.accessoryView = btn
//            return btn
//        }()
        
        let cell = UITableViewCellSudokuLabel.dequeueReusableCell(tableView);
//            cell.accessoryType = .disclosureIndicator
        cell.numOfRow = 1
        cell.row = 3
        cell.items.forEach { $0.textColor = .systemBlue }
        
        let sender = cell.assoryBtn(NNButton.self)
        sender.frame = CGRect(x: 0, y: 0, width: 27, height: 35)
        sender.labelHeight = 15
        sender.direction = .top
        sender.setTitleColor(.textColor3, for: .normal)
        
        sender.setImage(UIImage(named: "icon_map_route_black"), for: .normal)
        sender.setTitle("195m", for: .normal)

        sender.getViewLayer()
        
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return cell; }
//        cell.textLabel?.text = model.name
//        cell.detailTextLabel?.text = model.statusDes
//        cell.detailTextLabel?.textColor = model.statusDes == "已接入" ? UIColor.theme : UIColor.textColor9;

        cell.getViewLayer()
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.01;
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


//extension UITableViewCell{
//
//    func assoryBtn<T: UIButton>(_ type: T.Type) -> T {
//        let sender: T = {
//            let btn: T = {
//                let sender = T(type: .custom)
//                sender.frame = CGRect(x: 0, y: 0, width: 80, height: 30)
//                return sender
//            }()
//            accessoryView = btn
//            return btn
//        }()
//        return sender
//    }
//}
