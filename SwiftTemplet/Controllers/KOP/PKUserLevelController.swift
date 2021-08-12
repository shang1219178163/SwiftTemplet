//
//  PKUserLevelController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class PKUserLevelController: UIViewController {
    
    lazy var userLevelView: NNUserLevelInfoView = {
        let view = NNUserLevelInfoView(frame: .zero)
        view.backgroundColor = UIColor.hexValue(0x191B20)
        return view
    }()
    
    lazy var flowLayout: NNCollectionViewCardFlowLayout = {
        let layout = NNCollectionViewCardFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let itemW = kScreenWidth*0.9
        layout.itemSize = CGSize(width: itemW, height: 200)

        return layout;
    }()
    
    lazy var ctView: UICollectionView = {
        let view = UICollectionView.create(self.view.bounds, layout: self.flowLayout)
        view.backgroundColor = .white
        view.backgroundColor = UIColor.hexValue(0x191B20)
        view.isPagingEnabled = false
        // 注册cell
        view.dictClass = [UICollectionView.elementKindSectionHeader: ["UICTReusableViewOne", "UICTViewCellSubtitle"],
                          UICollectionView.elementKindSectionFooter: ["UICTReusableViewZero", "UICTViewCellValue"],
                            UICollectionView.elementKindSectionItem: ["UICTViewCellLevel","UICTViewCellOne"],
        ]
        
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    var dataList = ["0", "1", "2", "3", "4", "5", ]
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .grouped, rowHeight: 60)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .white
        view.separatorStyle = .none;
        view.isScrollEnabled = false
        return view
    }()
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["UITableViewCell", "30", "如何提升等级", ],
             ["UITableViewCell", "45", "经验值决定等级高低，通过完成任务，可以积累一定数量的经验值，经验值达到指定数额，即可实现升级。", ],
             ["UITableViewCellButton", "50", "去看看升级任务 >", ],
             ["UITableViewCell", "30", "称号和等级有什么区别？", ],
             ["UITableViewCell", "45", "等级是积累经验后达到的级别，称号是达到指定等级后获得的荣誉称谓，不同级别的称号会享受不同的权益。", ],
             ],
        ]
        return array
    }()

    // MARK: -lazy
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        userLevelView.updateLevelDesc()
        view.addSubview(userLevelView)
        
        view.addSubview(ctView)
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .done, action: { item in
            self.ctView.scrollToItem(at: IndexPath(item: 3, section: 0), at: .centeredHorizontally, animated: false)
        })
        view.getViewLayer()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        userLevelView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(95);
        }
        
        ctView.snp.makeConstraints { (make) in
            make.top.equalTo(userLevelView.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(220);
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(ctView.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.ctView.scrollToItem(at: IndexPath(item: 3, section: 0), at: .centeredHorizontally, animated: false)
    }
    

}

extension PKUserLevelController: UICollectionViewDataSource, UICollectionViewDelegate{
    //MARK: --UICollectionView
   func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
   }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataList.count
   }

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellLevel.self, indexPath: indexPath)
        cell.lineBottom.isHidden = false
        cell.lineRight.isHidden = false
    
//        cell.imgView.backgroundColor = .random
        cell.lab.text = String(format:"%ditem",indexPath.row)
        cell.imgView.image = UIImage(named: "bg_level_card_\(indexPath.row)")
        cell.inset = .zero
//        cell.inset = UIEdgeInsetsMake(0, 10, 30, 10)
    
        if indexPath.row < 3 {
            cell.progressView.progress.progress = 1
        } else if indexPath.row > 3 {
            cell.progressView.progress.progress = 0
        } else {
            cell.progressView.progress.progress = 0.5
        }
    
//        cell.getViewLayer()
       return cell
   }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension PKUserLevelController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.section][indexPath.row]
        return itemList[1].cgFloatValue
//        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0, 3:
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellTitle")
            cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel!.textColor = UIColor.black;
            cell.textLabel!.numberOfLines = 0
            cell.textLabel!.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            
    //        cell.accessoryType = .disclosureIndicator;
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);
            cell.imageView?.image = UIImage(named: "icon_bulb_black")
            cell.imageView?.contentMode = .scaleAspectFit

            let itemList = list[indexPath.section][indexPath.row]
            cell.textLabel!.text = itemList[2]
            
//            cell.getViewLayer()
            return cell

        case 1, 4:
            let cell = UITableViewCell.dequeueReusableCell(tableView)
            cell.textLabel!.font = UIFont.systemFont(ofSize: 12)
            cell.textLabel!.textColor = UIColor.textColor9;
            cell.textLabel!.numberOfLines = 0
            
    //        cell.accessoryType = .disclosureIndicator;
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

            
            let itemList = list[indexPath.section][indexPath.row]
            cell.textLabel!.text = itemList[2]
            return cell

        case 2:
            let cell = UITableViewCellButton.dequeueReusableCell(tableView);
            cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, kScreenWidth)
            cell.inset = UIEdgeInsetsMake(0, 0, 25, 0)
            cell.btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            cell.btn.setTitleColor(.theme, for: .normal)
            cell.btn.setBackgroundImage(UIImage(color: .white), for: .normal)
            
            let itemList = list[indexPath.section][indexPath.row]
            cell.btn.setTitle(itemList[2], for: .normal)
            cell.btn.addActionHandler { (control) in
                DDLog(control)
                self.navigationController?.pushVC(PKUserTaskListController.self, animated: true, block: { (vc) in
                    
                })
            }

//            cell.getViewLayer()

            return cell

        default:
            break
        }
        return UITableViewCell.dequeueReusableCell(tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30;
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
}
