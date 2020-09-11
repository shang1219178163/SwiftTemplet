//
//  ChatInputController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/10.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ChatInputController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView.create(.zero, style: .plain, rowHeight: 60)
        view.register(cellType: UITableViewCell.self)
        view.dataSource = self
        view.delegate = self
        return view
    }()

    
    lazy var inputAsoryView: NNInputAsoryView = {
        let view = NNInputAsoryView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 55))
        view.delegate = self
        return view
    }()
        
    lazy var keyboardInputView: NNChatKeyboardView = {
        let view = NNChatKeyboardView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 216))
        view.backgroundColor = .systemGreen
        return view
    }()
    
    var textViewMinHeight: CGFloat = 55
    var textViewMaxHeight: CGFloat = 100

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        view.addSubview(inputAsoryView)
        setupContant(55)
    }
    //MARK: -func
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
    
    func setupContant(_ height: CGFloat)  {
        let textHeight = max(55, height)
//        DDLog(textHeight)
        inputAsoryView.snp.updateConstraints { (make) in
            make.left.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(textHeight);
        }
        
        tableView.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.right.equalToSuperview().offset(0);
            make.bottom.equalTo(inputAsoryView.snp.top).offset(0);
        }
        
    }

}


extension ChatInputController: UITableViewDataSource, UITableViewDelegate{
    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)

        cell.textLabel?.text = "\(indexPath.section)_\(indexPath.row)"
        // Configure the cell...

        return cell
    }
}

extension ChatInputController: NNInputAsoryViewDelegate{
    func inputAsoryview(_ view: NNInputAsoryView, sender: UIButton) {
//        self.view.endEditing(true)
        view.textView.inputView = keyboardInputView
        view.textView.reloadInputViews()
        
        view.textView.tintColor = .clear
    }
    
    func inputAsoryview(_ view: NNInputAsoryView, textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) {
        let size = textView.sizeThatFits(CGSize(width: textView.bounds.width, height: CGFloat.greatestFiniteMagnitude))
//        DDLog(size)
        textView.isScrollEnabled = size.height > textViewMinHeight
        if size.height <= textViewMaxHeight {
            self.setupContant(size.height + 16)
        }
    }

}
