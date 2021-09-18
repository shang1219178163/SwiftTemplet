//
//  TheadDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/9/2.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class TheadDemoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        performUsingSemaphore()
    }

    func performUsingSemaphore() {
        let dq1 = DispatchQueue.global(qos: .userInitiated)
        let dq2 = DispatchQueue.global(qos: .userInitiated)

        let semaphore = DispatchSemaphore(value: 1)

        dq1.async {
            semaphore.wait()
            for i in 1...3 {
                print("\(#function) DispatchQueue 1: \(i)")
            }
            semaphore.signal()
        }

        dq2.async {
            semaphore.wait()
            for i in 1...3 {
                print("\(#function) DispatchQueue 2: \(i)")
            }
            semaphore.signal()
        }
    }
    
    func testDispatchGroup() {
        let myGroup = DispatchGroup()
        for i in 0 ..< 5 {
            myGroup.enter()

//            Alamofire.request("https://httpbin.org/get", parameters: ["foo": "bar"]).responseJSON { response in
//                print("Finished request \(i)")
//                myGroup.leave()
//            }
        }

        myGroup.notify(queue: .main) {
            print("Finished all requests.")
        }
    }
    
    
    // MARK: -lazy
    public lazy var indicatorView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear

        return view
    }()
    
    public lazy var imgViewLeft: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear

        return view
    }()
    
    
    public lazy var imgViewRight: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.isUserInteractionEnabled = true
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        view.image = UIImage(named: "img_arrowRight_gray")
        
        return view
    }()
    
    
    public lazy var labelLeft: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    
    public lazy var labelLeftSub: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0)
        
        return view
    }()
    

    public lazy var labelRight: UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.numberOfLines = 0
        view.lineBreakMode = .byCharWrapping
        
        return view
    }()
    
    
    public lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.minimumScaleFactor = 1.0
        view.isExclusiveTouch = true
        view.setTitleColor(.black, for: .normal)
        
        return view
    }()
    
    
    public lazy var textfield: UITextField = {
        let view = UITextField(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.textAlignment = .left
        view.contentVerticalAlignment = .center
        view.autocapitalizationType = .none
        view.autocorrectionType = .no
        view.clearButtonMode = .whileEditing
        view.backgroundColor = .white
        
        return view
    }()
    
    
    var isOpen: Bool = false

    var isCanOpen: Bool = false

}
