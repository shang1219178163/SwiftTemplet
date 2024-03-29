//
//	ShowActivityController.swift
//	MacTemplet
//
//	Created by shang on 2020/11/11 09:42
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
        
///
@objcMembers class ShowActivityController: UIViewController{
        
    var dataList = NSMutableArray()

    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Next", for: .normal)
        view.addActionHandler({ (sender) in
//            let controller = UIViewController()
//            self.navigationController?.pushViewController(controller, animated: true)
            
            self.showActivityVC(sender)
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    
    lazy var customActivity: NNActivity = {
        let activity = NNActivity()
        activity.title = "CustomActivity"
        activity.type = "NNActivity"
        activity.image = UIApplication.appIcon
        activity.shareContexts = ["欢迎关注我", UIApplication.appIcon, URL(string: "https://github.com/wslcmk")!]

        return activity
    }()
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = ""
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        

    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        view.addSubview(tableView)
    }
    
    func showActivityVC(_ sender: UIButton) {
        if #available(iOS 11, *) {
            let activityItems: [UIActivity.ActivityType] = [.airDrop, .message, .mail, .markupAsPDF, .print, .copyToPasteboard, ]
            let activityVC = UIActivityViewController(activityItems: customActivity.shareContexts!, applicationActivities: [customActivity])
    //        if let popover = activityVC.popoverPresentationController {
    //            popover.sourceView = sender
    //            popover.permittedArrowDirections = .up
    //        }
            activityVC.completionWithItemsHandler = { activity, success, items, error in
                print(activity.debugDescription)
            }
            activityVC.present()
        }
    }

}
        
extension ShowActivityController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = UIColor.textColor3;

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.text = "--"
        cell.detailTextLabel?.textColor = UIColor.textColor6;
        cell.accessoryType = .disclosureIndicator;
        
        return cell
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
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}

