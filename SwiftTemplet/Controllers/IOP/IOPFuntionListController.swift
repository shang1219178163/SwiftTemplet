//
//	IOPFuntionListController.swift
//	MacTemplet
//
//	Created by shang on 2020/11/19 10:33
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import RxSwift
import RxCocoa

/// 列表
@objcMembers class IOPFuntionListController: UIViewController{
    
    var disposeBag = DisposeBag()

    
    lazy var tuples: [[(String, String)]] = {
        return [[
            ("IOPShopExamineDetailController", "审核详情"),
            ("IOPShopWaitExamineForAddController", "待审核(新增审核)"),
            ("IOPShopWaitExamineForAddCarCardController", "待审核(新增审核)"),
            
            ("IOPShopWaitExamineForCarOwnerController", "待审核(编辑车主)"),
            ("IOPShopWaitExamineForCarController", "待审核(新增审核)车辆认证资料"),
            ("IOPShopWaitExamineForParkingCardController", "待审核(购买车位卡)"),

            ("NNExcelAlertViewController", "NNExcelAlertView" ),
            ("IOPPayInpartBaseInfoController", "支付进件基础信息"),
            ("IOPPayInpartCompanyEntityInfoController", "CompanyEntityInfo" ),
            ("IOPPayInpartCompanyMaterialInfoController", "CompanyMaterialInfo"),
            ("IOPPayInpartCompanySettlementBankInfoController", "CompanySettlementBank"),
            ("IOPPayInpartCompanyOperatorInfoController", "CompanyOperatorInfo"),
            ("IOPPayInpartCompanyOtherInfoController", "CompanyOtherInfo"),
            ("IOPPayInpartResultController", "支付进件结果"),
            ],
        ]
    }()
    
    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("保存", for: .normal)

//        view.isHidden = true;
        view.sizeToFit()
//        view.addActionHandler({ (sender) in
//            DDLog(sender)
//
//        }, for: .touchUpInside)
        
//        view.rx.safeDrive { (sender) in
//            DDLog(sender.currentTitle)
//        }.disposed(by: dispose)
        
        view.rxDrive { (sender) in
            DDLog(sender.currentTitle)
        }.disposed(by: disposeBag)
        
//        view.rx.safeDrive().asDriver().drive {
//            DDLog(button.currentTitle)
//        } onCompleted: {
//
//        } onDisposed: {
//
//        }
        
        return view
    }()
    
    
    lazy var searchBar: UISearchBar = {
//        let view = UISearchBar.create(CGRectMake(0, 0, kScreenWidth - 70, 50))
//        view.layer.cornerRadius = 3;
//        view.layer.masksToBounds = true;
//
//        view.showsCancelButton = false;
//        view.backgroundColor = .white
//        view.textField?.placeholder = "请输入商品名称搜索";
////        view.textField?.tintColor = .white;
//        view.textField?.font = UIFont.systemFont(ofSize: 13)
//        view.textField?.borderStyle = .roundedRect;
//        view.textField?.backgroundColor = UIColor.background
//        view.textField?.layer.cornerRadius = 5;
//        view.textField?.layer.masksToBounds = true;
        
        let view = UISearchBar(frame: CGRectMake(0, 0, kScreenWidth - 70, 50))
        view.textField?.placeholder = "请输入名称搜索";
//        view.backgroundColor = .white

        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        label.text = "Gan"
        return label
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("按钮标题", for: .normal)
        btn.setTitle("按钮高亮", for: .highlighted)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.sizeToFit()
        return btn
    }()
        
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "KOP功能"
        edgesForExtendedLayout = []
        setupUI()
        
        searchBar.rxDrive { (query) in
            DDLog(query)
        }.disposed(by: disposeBag)
        
        searchBar.rx.safeDrive { (query) in
            DDLog(query)
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        pushVC(PKRegionParkListController.self, animated: false, block: nil)
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.setBackgroudColor(.clear, for: .default)
        navigationController?.navigationBar.setTextColor(.systemGreen)
    }
        

    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = UIColor.white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        view.addSubview(tableView)
        tableView.tableHeaderView = searchBar
        
//        testFunc()
    }
    
    func testFunc() {
        label.rxTap { (tap) in
            DDLog(tap.view)
        }.disposed(by: disposeBag)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: label)
        
        navigationItem.titleView = btn
//        btn.rx.tap.subscribe { () in
//            self.btn.isSelected.toggle()
////            DDLog(btn.isSelected)
//
//            self.label.text = "\(self.btn.isSelected)"
//        } onError: { (error) in
//
//        } onCompleted: {
//
//        } onDisposed: {
//
//        }.disposed(by: disposeBag)
        
        btn.rxDrive { (sendder) in
            sendder.isSelected.toggle()
//            DDLog(btn.isSelected)
            
            self.label.text = "\(sendder.isSelected)"
        }.disposed(by: disposeBag)

        
        label.rx.observeWeakly(String.self, "text")
            .subscribe(onNext: { (value) in
                DDLog(value)
            })
            .disposed(by: disposeBag)
                
//        Timer.rxSchedule(1000) { (value) in
//            DDLog(value)
//        }.disposed(by: dispose)
        
        setupRequest()
//        setupTimer()
        setupNotification()
        setupGestureRecognizer()
//        setupScrollerView()
//        setupTextFiled()
//        setupButton()
        setupKVO()
    }

    //MARK: - RxSwift应用-网络请求
    func setupRequest() {
        guard let url = URL(string: "https://www.baidu.com") else { return }
        URLSession.shared.rx.response(request: URLRequest(url: url))
            .subscribe(onNext: { (response, data) in
                print(response.statusCode)
        }).disposed(by: disposeBag)
    }
    
    func setupTimer() {
        let timer = Observable<Int>.interval(.milliseconds(1000), scheduler: MainScheduler.instance)
        timer.subscribe(onNext: { (num) in
            print(num)
        })
        .disposed(by: disposeBag)
    }
    
    func setupNotification(){
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
            .subscribe(onNext: { (noti) in
                print(noti)
            })
        .disposed(by: disposeBag)
        
    }
    
    func setupGestureRecognizer(){
        let tap = UITapGestureRecognizer()
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        tap.rx.event.subscribe(onNext: { (tap) in
            print(tap.view)
        })
        .disposed(by: disposeBag)
    }
    
    func setupScrollerView() {
        tableView.rx.contentOffset
            .subscribe(onNext: { [weak self](offset) in
                DDLog(offset)
            })
        .disposed(by: disposeBag)
    }
    
    func setupTextFiled() {
        searchBar.rx.text.orEmpty
            .subscribe(onNext: { (text) in
               print(text)
            })
            .disposed(by: disposeBag)
    }
    
    func setupButton() {
        self.btn.rx.tap
            .subscribe(onNext: { () in
                print("点击来了")
            })
            .disposed(by: disposeBag)
    }
    
    func setupKVO() {
        self.label.rx.observeWeakly(String.self, "text")
            .subscribe(onNext: { (value) in
                print(value as Any)
            })
            .disposed(by: disposeBag)
    }



}

extension IOPFuntionListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return tuples.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tuples[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.theme;

        cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let tuple = tuples[indexPath.section][indexPath.row]
        cell.textLabel!.text = tuple.1
//        cell.textLabel!.text = NSLocalizedString(tuple.1, comment: "")
        cell.textLabel!.text = Bundle.localizedString(forKey: tuple.1)

        cell.detailTextLabel?.text = tuple.0

        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let tuple = tuples[indexPath.section][indexPath.row]
//        DDLog(itemList);
        
        let vc = UICtrFromString(tuple.0)
        vc.title = tuple.1
        navigationController?.pushViewController(vc, animated: true);
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
