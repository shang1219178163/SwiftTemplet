//
//  QRCodeViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/26.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class QRCodeViewController: UIViewController {

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        view.addSubview(imageView)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20);
            make.left.equalToSuperview().offset(20);
            make.width.equalTo(200);
            make.height.equalTo(200);
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let size = CGSize(width: 200, height: 200)
        let image = UIImage.generateQRCodeImage("Copyright © 2020 BN. All rights reserved.", size: size, logo: UIImage(named: "img_portrait_N"))
//        let image = UIImage.generateQRCode("Copyright © 2020 BN. All rights reserved.", width: 200, height: 200)
        imageView.image = image
    }
}
