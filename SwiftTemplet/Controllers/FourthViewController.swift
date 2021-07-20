
//
//  FourthViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import UICircularProgressRing

class FourthViewController: UIViewController {
    
    let labelOne: UILabel = {
       $0.textAlignment = .center
       $0.textColor = .black
       $0.text = "Hello, World!"
        return $0
      }(UILabel())
    
//    {
//       $0.textAlignment = .center
//       $0.textColor = .black
//       $0.text = "Hello, World!"
//      }(UILabel())
    
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("展示", for: .normal)

//        view.setBackgroundImage(UIImage(color: .theme), for: .normal)
//        view.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        view.sizeToFit()
        view.addActionHandler({ (sender) in
            self.showPopoverAction(sender)
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var itemView: NNItemsView = {
        let view = NNItemsView(frame: .zero)
        
        var list: [String] = []
        for i in 0...4 {
            list.append("\(i)")
        }
        view.items = list
        view.showStyle = .topRightToLeft
        
        view.block({ (itemsView, sender) in
            guard let btn = sender as? UIButton else { return }
            print(btn.titleLabel?.text)
            self.showPopoverAction(btn)

        })
        return view;
    }()
    
    lazy var processingView: NNProcessingView = {
        let view = NNProcessingView(frame: .zero)
        
        var list: [String] = []
        for i in 0...2 {
            list.append("\(i)")
        }
        view.items = ["昨天", "今天", "明天"]
        view.contentInset = UIEdgeInsetsMake(0, 50, 0, 50)
        view.padding = 60
        view.index = 1
        return view;
    }()
    
    lazy var goodsToolView: IOPGoodsToolView = {
        let view = IOPGoodsToolView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 5;
        view.titles = ["扩容", "减配", "续费"]
        view.delegate = self
        
        return view;
    }()
    
    lazy var orderPayView: IOPOrderPayView = {
        let view = IOPOrderPayView(frame: .zero)

        return view;
    }()
    
    func createGroupView() {
        var list = [String].init(count: 12) { _ in "按钮_" }

        let rect = CGRect(x: 20, y: 20, width: kScreenWidth - 20.0*2, height: kScreenWidth - 20.0*2);
        let groupView = UIButton.createGroupView(rect, list: list, numberOfRow: 4, padding: 5) { (control) in
            DDLog(control.tag);
            self.showPopoverAction(control )
        }

        view.addSubview(groupView);
    }
        
    lazy var clockView: NNClockView = {
        let view = NNClockView(frame: CGRect(x: 20, y: 20, width: kScreenWidth - 40, height: kScreenWidth - 40));
        view.itemList = ["111","222","333","444","555","666","777","888",];
        view.backgroundColor = .random;
        view.image = UIImage(named: "beach");
        
        view.aniDuration = 12;
        view.animRotation(isClockwise: true, duration: view.aniDuration, repeatCount: MAXFLOAT, key: nil);
        view.layoutIfNeeded();//激活子视图动画
        
        view.layer.cornerRadius = view.frame.width/2.0;
        view.layer.masksToBounds = true;
        
        view.addGestureTap { (tap) in
            DDLog(tap.view);
            
        }
        return view
    }()
    
    lazy var progressView: NNAnnularProgress = {
        let progressView = NNAnnularProgress(frame: CGRect(x:50,y:kScreenWidth/2+40,width:100,height:100));
        progressView.backgroundColor = .cyan;
        return progressView;
    }()
    
    lazy var progressRing: UICircularProgressRing = {
        let progressRing = UICircularProgressRing(frame: .zero);
        progressRing.maxValue = 100
        progressRing.style = .ontop
        progressRing.outerRingColor = .background
        progressRing.outerRingWidth = 5
        progressRing.innerRingColor = .systemBlue
        progressRing.innerRingWidth = 5

        progressRing.fontColor = progressRing.innerRingColor
        return progressRing;
    }()
    
    lazy var datePicker: NNDatePicker = {
        let view = NNDatePicker();
        view.block({ (sender, idx) in
            if idx == 1 {
                DDLog(view,sender.datePicker.date,idx);
                
            }
        })
        return view;
    }()
    
    lazy var button: UIButton = {
        let sender = UIButton(type: .custom)
        sender.setTitle("button", for: .normal)
        sender.setTitleColor(.black, for: .normal)
        sender.setTitleColor(.red, for: .disabled)

        let backgroudImage = UIImage(color: .hexValue(0xF3F3F3))
        let selectedBackgroudImage = UIImage(named: "btn_selected_multiple")!
        sender.setBackgroundImage(backgroudImage, for: .normal)
        sender.setBackgroundImage(selectedBackgroudImage, for: .selected)


        sender.layer.borderWidth = 1
        sender.layer.borderColor = UIColor.systemBlue.cgColor
    
        sender.addActionHandler { (sender) in
            DDLog(sender.currentTitle)
            NotificationCenter.default.post(name: Notification.Name.appTokenExpired, object: nil, userInfo: ["1": "aaa"])

        }

        return sender;
    }()
    
    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRectMake(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .white
        view.items = ["昨天", "今天", "明天"]
        view.indicatorWidth = 40
        view.addActionHandler({ (sender) in
            DDLog(sender)
            self.fliterView.show()

        }, for: .valueChanged)
        return view;
    }()
    
    lazy var fliterView: IOPCouponFliterDropView = {
        let view = IOPCouponFliterDropView(frame: self.view.bounds)
        view.parController = self;
//        view.delegate = self;
        
        let model0 = NNSectionDataModel()
        model0.title = "券类别"
        model0.items = ["全部", "自定义", "预定义"]
        model0.cellHeight = 50
        
        let model1 = NNSectionDataModel()
        model1.title = "券类型"
        model1.items = ["全部", "时长", "金额", "次数", "时间段", "折扣"]
        model1.cellHeight = 100

        view.list = [model0, model1]
        return view;
    }()
    
    lazy var pickView: NNPopListView = {
        let view = NNPopListView(frame: .zero)
        view.title = "请选择"
//        view.tips = "新年快乐!"
        view.itemList = [["11111", "123"],
                        ["22222", "234"],
                        ["33333", "456"],
                    ]
        view.block({ (view, indexP) in
            DDLog(indexP.string)
            let cellItem = view.itemList![indexP.row]
            
        })
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero)
        
//        view.addLongPressMenuItems()
//        UIMenuController.shared.menuItems = menuItems
        view.text = "这是一调测试信息"

        view.backgroundColor = UIColor.background
        return view
    }()
    
    let menuItems: [UIMenuItem] = [
        UIMenuItem(title: "One", action: Selector(("oneMethod:"))),
        UIMenuItem(title: "Two", action: Selector(("twoMethod:"))),
        UIMenuItem(title: "Three", action: Selector(("threeMethod:")))
    ]
        
    var progress: CGFloat = 0.0;
    
    lazy var group: NNGroupButton = {
        let sender = NNGroupButton()
        sender.items = [UIButton].init(count: 6, generator: { (i) -> UIButton in
            let sender = NNButton(type: .custom)
            sender.setTitle("item_\(i)", for: .normal)
            sender.setTitleColor(.gray, for: .normal)
            sender.setTitleColor(.systemBlue, for: .selected)

            sender.setBorderColor(.line, for: .normal)
            sender.setBorderColor(.systemBlue, for: .selected)
            
            sender.layer.cornerRadius = 5;
            sender.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            
//            sender.iconSize = CGSize(width: 30, height: 18)
//            sender.iconBtn.setTitle("\(i)", for: .normal)
//            sender.iconBtn.setTitleColor(.red, for: .normal)

//            sender.getViewLayer()
            return sender
        })
        sender.isMutiChoose = true
        sender.itemsIndexs = [1,3,5]
        sender.block = { view, sender in
            DDLog(view.itemsIndexs)
//            DDLog(view.itemsIndexs)
        }
        return sender
    }()
    
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper(frame: CGRect(x: 130, y: 100, width: 0, height: 0))
        //设置步进对象的对象大小为自适应
        stepper.sizeToFit();
        //设置步进对象的默认值为0
        stepper.value=0;
        //设置最小最大值
        stepper.minimumValue=0;
        stepper.maximumValue=10
        //设置每次递增递减的值
        stepper.stepValue=1;
        //添加状态监听事件
        //按住的时候连续变化
        stepper.isContinuous = true

        //是否循环 当增长到最大值的时候再从新开始
        stepper.wraps = true
        
        stepper.addActionHandler { (control) in
            guard let sender = control as? UIStepper else { return }
            DDLog(sender.value);
        }
        return stepper
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        edgesForExtendedLayout = []
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        navigationItem.titleView = segmentCtl
                
        view.addSubview(group)

        view.addSubview(itemView)
        view.addSubview(processingView)
        view.addSubview(button)
        view.addSubview(stepper)

        view.addSubview(goodsToolView)
        view.addSubview(orderPayView)

        view.addSubview(fliterView)
        
        view.addSubview(label)

        view.addSubview(progressRing)
//        processingView.isHidden = true

        let amount = "¥\(227.00)"
        let string = "支付金额: \(amount)"
        
//        let nsrange = (string as NSString).range(of: "¥227.00")
//        orderPayView.label.attributedText = NSAttributedString.attString(string, nsRange: nsrange, font: 18, textColor: UIColor.red)
        orderPayView.label.attributedText = NSAttributedString.attString(string, textTaps: ["¥227.00"], font: UIFont.systemFont(ofSize: 14), tapFont: UIFont.systemFont(ofSize: 18), color: UIColor.textColor3, tapColor: UIColor.red, alignment: .left)
        
//        view.addSubview(clockView)
        
//        progressView.frame = CGRect(x: 20, y: clockView.frame.maxY + 20, width: 100, height: 100)
//        view.addSubview(progressView)
        
//        view.getViewLayer();

        //元组
//        let score = (java: 12.01, Swift: 34, c:"abcde", oc: 98)
//        DDLog(score.java, score.Swift);
        
//        button.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNottification(_:)), name: NSNotification.Name.appTokenExpired, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height: CGFloat = 90

        group.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(height);
        }
        
        itemView.snp.makeConstraints { (make) in
            make.top.equalTo(group.snp.bottom).offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(height);
        }
        
        orderPayView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(50);
        }
        
        goodsToolView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalTo(orderPayView.snp.top).offset(-10);
            make.height.equalTo(40);
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(itemView.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(40);
        }
        
        progressRing.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(140);
        }
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(progressRing.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(40);
        }
        
        
        stepper.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(40);
        }
        
//        DDLog(view.bounds, view.subviews)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        let names = ["Paula", "Elena", "Zoe"];
        var lastNameEndingInA: String?
        for name in names.reversed() where name.hasSuffix("a") {
            lastNameEndingInA = name
            break
        }
//        lastNameEndingInA;// Optional("Elena")”
//        NNProgressHUD.showText("111");
//        NNProgressHUD.showLoading(kNetWorkRequesting);
//        NNProgressHUD.showSuccess("success");
//        NNProgressHUD.showErrorText("fail");
        
        OrderPayContext.testExpample(300)
        
//        let someVar = 3
//        string varName = nameof(someVar)
        // 'varName' now holds the string value "someVar"
        
        ///     let question = "Which is larger, 3 * 3 * 3 or 10 + 10 + 10?"
        ///     let hasMathSymbols = question.unicodeScalars.contains(where: {
        ///         $0.properties.isMath
        ///     })
        ///     // hasMathSymbols == true
//        public var properties: Unicode.Scalar.Properties { get }
    
        
        let result = "www.ScoreTracker.com/postScore"
        guard var url = URL(string: result) else { return }
        url.appendQueryParameters(["userName": "Maverick", "highScore": "123456"])
        DDLog(url.absoluteString) //www.ScoreTracker.com/postScore?userName=Maverick&highScore=123456
        
        
        let params = ["userName": "Maverick", "highScore": "123456"]
        let queryObject = QueryObject(params: params)
        let urlString = queryObject.getUrl
        DDLog(urlString) //www.ScoreTracker.com/postScore?userName=Maverick&highScore=123456

        
        let queryObject1 = QueryObjectNew(userName:"Maverick", highScore:123456)
        let urlString1 = queryObject1.getUrl
        
        DDLog(\QueryObjectNew.userName)
        DDLog(String(describing: \QueryObjectNew.userName.description))
        
        let type = type(of: \QueryObjectNew.userName)
        DDLog(type.rootType, type.valueType)
        
        
        let mirror = Mirror(reflecting: queryObject1)
        for child in mirror.children {
            DDLog(child.label!, child.value)
        }
        
        
        let string = """
            {
                "ALL TEXT": [
              {
                "text": "hello"
               },
               {
                "text": "hi"
               },
                {
                "text": "how r u"
                }
            ]
          }
"""
        
        guard let data = string.data(using: .utf8),
        let json = try? JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any>,
        let allText = json["ALL TEXT"] as? [Dictionary<String, Any>]
            else {
            DDLog("解析失败")
            return }
        DDLog(allText) // [["text": hello], ["text": hi], ["text": how r u]]
        
        let items: [String] = allText.compactMap { $0["text"] as? String }
        
        var textsList = [String]()
        textsList.append(contentsOf: items)
        DDLog(items) //["hello", "hi", "how r u"]
        DDLog(textsList) //["hello", "hi", "how r u"]
        
        let set = Set(["1", "2", "3"])
        let array = Array(set)
        DDLog(set)//Set<String>)
        DDLog(array)//[String]

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let num: CGFloat = CGFloat(arc4random() % (100 - 5) + 5)
        progressRing.startProgress(to: num, duration: 1) {
            DDLog("动画结束")
        }
        
        let array = (1...10).map { "\($0)" }
        DDLog(array)
        DDLog(type(of: (1...10)))

        let arrayNew = Array.init(count: 10) { "\($0)" }
        DDLog(arrayNew)
    }

    @objc func showPopoverAction(_ sender: UIButton) {
        let contentVC = SimpleListController()
        contentVC.block = { vc, indexP in
            DDLog(indexP.string)

            vc.navigationController?.pushVC(UIViewController.self, animated: true, block: { (sender) in
                sender.view.backgroundColor = .systemGreen
            })
        }

        let popoverContentVC = UINavigationController(rootViewController: contentVC)
        popoverContentVC.preferredContentSize = CGSize(width: kScreenWidth - 20, height: 400)
        popoverContentVC.modalPresentationStyle = .popover
        
        guard let popoverPresentationVC = popoverContentVC.popoverPresentationController else { return }
        popoverPresentationVC.permittedArrowDirections = .any
        popoverPresentationVC.sourceView = sender
        popoverPresentationVC.sourceRect = sender.frame
        popoverPresentationVC.delegate = self
        present(contentVC, animated: true, completion: nil)
        
//        presentPopover(contentVC, sender: sender, arrowDirection: UIPopoverArrowDirection.init(rawValue: 0), completion: nil)
    }
    
    
    @objc func handleNottification(_ n: Notification) {
        DDLog(n.name.rawValue, n.userInfo)
    }
    
            
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        progress += 0.1
        if progress >= 1.0 {
            progress = 0
        }
        progressView.setProgress(progress: progress, time:0.6, animate: true)
    }
}

extension FourthViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//        setAlphaOfBackgroundViews(1)
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
//        setAlphaOfBackgroundViews(0.7)
    }
}

extension FourthViewController: IOPGoodsToolViewDelegate{
    
    func goodsToolView(_ sender: UIButton) {
        self.pickView.show()
    }
}

///编辑菜单谁响应谁实现响应的方法
@objc public extension UILabel{

    @objc func oneMethod(_ sender: UIMenuController) {
        DDLog("Action One")
    }

    @objc func twoMethod(_ sender: UIMenuController) {
      DDLog("Action Two")
    }

    @objc func threeMethod(_ sender: UIMenuController) {
      DDLog("Action Three")
    }
}


//public func index<Elements: Collection, Element>(of element: Element, in collection: Elements ) -> Elements.Index? where Elements.Element == Element, Element: Equatable
//{
//
//}

//extension Range{
//    
//    static func + (lhs: Range<Bound>, rhs: Range<Bound>) -> CountableClosedRange<Int> {
//        assert(lhs.lowerBound <= rhs.lowerBound, lhs.upperBound >= rhs.upperBound)
////
////        let string = NSMutableAttributedString(attributedString: lhs)
////        string.append(rhs)
//        return NSAttributedString(attributedString: string)
//    }
//}


struct QueryObject{
    
    var params = [String: String]()

    var getUrl: String{
        let result = "www.ScoreTracker.com/postScore"
        guard var url = URL(string: result) else { return result }
        url.appendQueryParameters(params)
        return url.absoluteString
    }
    
    init(params: [String: String]) {
        self.params = params
    }

}


struct QueryObjectNew{

    let userName  : String
    let highScore : Int

    var getUrl:String{
        return ""
//        return "www.ScoreTracker.com/postScore?\(nameof(userName))=\(userName)&\(nameof(highScore))=\(highScore)"
    }
}


extension QueryObjectNew: CustomStringConvertible{}



@available(iOS 10.3, *)
class IconManager {
    let application = UIApplication.shared
    
    // same naming convention in the plist to reference to actual files
    enum AppIcon: String {
        case iconDark
        case iconDarkSimple
        case iconLight
        case iconLightSimple
    }
   
    @available(iOS 10.3, *)
    func changeAppIcon(to appIcon: AppIcon) {
        application.setAlternateIconName(appIcon.rawValue)
    }
}
