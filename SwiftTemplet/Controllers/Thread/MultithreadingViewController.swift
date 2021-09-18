//
//  MultithreadingViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/9/6.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import Photos

class MultithreadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        
    }
    
    ///PHAsset转 URL
    func handleAssets(_ assets: [PHAsset]) {
        let group = DispatchGroup()
        
        var tuples = [(Data, URL)]()
        assets.forEach { asset in
            group.enter()

            asset.getURL { url in
                guard let URL = url else {
                    DDLog("文件路径为空")
                    return }
                
                if let data = try? Data(contentsOf: URL) {
                    DDLog("____\(data.fileSize), \(URL)")
                    tuples.append((data, URL))
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            DDLog("notify")
        }
    }
//    public
    // MARK: -lazy
//    public lazy var imgView: UIImageView = {
//        let view = UIImageView(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
//        view.backgroundColor = .clear
//
//        return view
//    }()
//
//    public lazy var imgViewRight: UIImageView = {
//        let view = UIImageView(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
//        view.image = UIImage(named: "img_arrowRight_gray");
////        view.backgroundColor = UIColor.random
//
//        return view
//    }()
//
//    public lazy var labelRight: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.numberOfLines = 1;
//        view.adjustsFontSizeToFitWidth = true
//        view.textAlignment = .center;
////        view.backgroundColor = UIColor.random
//
//        return view
//    }()
//
//    public lazy var label: UILabel = {
//        let view = UILabel(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15)
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.textAlignment = .center;
////        view.backgroundColor = UIColor.random
//
//        return view
//    }()
//
//    public lazy var labelSub: UILabel = {
//        let view = UILabel(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 13)
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.textAlignment = .center;
////         view.backgroundColor = UIColor.random
//        return view
//    }()
//
//    public lazy var btn: UIButton = {
//        let view = UIButton(type: .custom);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.titleLabel?.font = UIFont.systemFont(ofSize: 15);
//        view.titleLabel?.adjustsFontSizeToFitWidth = true;
//        view.titleLabel?.minimumScaleFactor = 1.0;
//        view.isExclusiveTouch = true;
//        view.setTitleColor(.textColor3, for: .normal)
//        view.setTitleColor(.theme, for: .selected)
//
//        return view
//    }()
//
//    public lazy var imgView: UIImageView = {
//        let view = UIImageView(frame: CGRect.zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true
//        view.contentMode = .scaleAspectFit
//        view.backgroundColor = .clear
//
//        return view
//    }()
//
//    public lazy var lab: UILabel = {
//       let view = UILabel(frame: .zero)
//       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//       view.font = UIFont.systemFont(ofSize: 15)
//       view.numberOfLines = 0
//       view.lineBreakMode = .byCharWrapping
//       view.textAlignment = .center
////       view.backgroundColor = UIColor.random
//
//       return view
//    }()
//
//    public lazy var labDetail: UILabel = {
//        let view = UILabel(frame: .zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.numberOfLines = 1
//        view.adjustsFontSizeToFitWidth = true
//        view.textAlignment = .center
//
//        return view
//    }()
//
//    public lazy var btn: UIButton = {
//        let view = UIButton(type: .custom)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        view.titleLabel?.adjustsFontSizeToFitWidth = true
//        view.titleLabel?.minimumScaleFactor = 1.0
//        view.isExclusiveTouch = true
//        view.setTitleColor(.textColor3, for: .normal)
//        view.setTitleColor(.theme, for: .selected)
//       return view
//   }()
//
//    // MARK: -lazy
//    public lazy var imgViewLeft: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true
//        view.contentMode = .scaleAspectFit
//        view.backgroundColor = .clear
//
//        return view
//    }()
//
//    public lazy var imgViewRight: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true
//        view.contentMode = .scaleAspectFit
//        view.backgroundColor = .clear
//        view.image = UIImage(named: "img_arrowRight_gray")
//
//        return view
//    }()
//
//    public lazy var labelLeft: UILabel = {
//        let view = UILabel(frame: CGRect.zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left
//        view.numberOfLines = 0
//        view.lineBreakMode = .byCharWrapping
//
//        return view
//    }()
//
//    public lazy var labelLeftSub: UILabel = {
//        let view = UILabel(frame: CGRect.zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left
//        view.numberOfLines = 0
//        view.lineBreakMode = .byCharWrapping
//        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0)
//
//        return view
//    }()
//
//    public lazy var labelRight: UILabel = {
//        let view = UILabel(frame: CGRect.zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left
//        view.numberOfLines = 0
//        view.lineBreakMode = .byCharWrapping
//
//        return view
//    }()
//
//    public lazy var labelRightSub: UILabel = {
//        let view = UILabel(frame: CGRect.zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15)
//        view.textAlignment = .right
//        view.numberOfLines = 0
//        view.lineBreakMode = .byCharWrapping
//        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0)
//        view.isUserInteractionEnabled = true
//        return view
//    }()
//
//    public lazy var btn: UIButton = {
//        let view = UIButton(type: .custom)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.titleLabel?.adjustsFontSizeToFitWidth = true
//        view.titleLabel?.minimumScaleFactor = 1.0
//        view.isExclusiveTouch = true
//        view.adjustsImageWhenHighlighted = false
//        view.setTitleColor(.black, for: .normal)
//
//        return view
//    }()
//
//    public lazy var textfield: UITextField = {
//         let view = UITextField(frame: .zero)
//         view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//         view.textAlignment = .left
//         view.contentVerticalAlignment = .center
//         view.autocapitalizationType = .none
//         view.autocorrectionType = .no
//         view.clearButtonMode = .whileEditing
//         view.backgroundColor = .white
//
//         return view
//    }()
//
//    public lazy var textView: UITextView = {
//        let view = UITextView(frame: .zero)
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15)
//        view.textAlignment = .left
//        view.autocapitalizationType = .none
//        view.autocorrectionType = .no
//        view.backgroundColor = .white
//
//        view.layer.borderColor = UIColor.lightGray.cgColor
//        view.layer.borderWidth = 0.5
//        return view
//    }()
//
//    ///UITableViewHeaderFooterView
//    // MARK: -lazy
//    public lazy var indicatorView: UIImageView = {
//        let view = UIImageView(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
//        view.backgroundColor = .clear
//
//        return view
//    }()
//
//    public lazy var imgViewLeft: UIImageView = {
//        let view = UIImageView(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
//        view.backgroundColor = .clear
//
//        return view
//    }()
//
//    public lazy var imgViewRight: UIImageView = {
//        let view = UIImageView(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
//        view.backgroundColor = .clear
//        view.image = UIImage(named: "img_arrowRight_gray");
//
//        return view
//    }()
//
//    public lazy var labelLeft: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//
//        return view
//    }()
//
//    public lazy var labelLeftSub: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
//
//        return view
//    }()
//
//    public lazy var labelRight: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//
//        return view
//    }()
//
//    public lazy var labelLeftSub: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15);
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
//        view.isUserInteractionEnabled = true;
//
//        return view
//    }()
//
//    public lazy var btn: UIButton = {
//        let view = UIButton(type: .custom);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.titleLabel?.adjustsFontSizeToFitWidth = true;
//        view.titleLabel?.minimumScaleFactor = 1.0;
//        view.isExclusiveTouch = true;
//        view.setTitleColor(.black, for: .normal)
//
//        return view
//    }()
//
//    public lazy var textfield: UITextField = {
//        let view = UITextField(frame: .zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.textAlignment = .left;
//        view.contentVerticalAlignment = .center;
//        view.autocapitalizationType = .none;
//        view.autocorrectionType = .no;
//        view.clearButtonMode = .whileEditing;
//        view.backgroundColor = .white;
//
//        return view
//    }()
//
//    var isOpen: Bool = false
//
//    var isCanOpen: Bool = false
//
//
//    // MARK: -lazy
//    public lazy var imgViewLeft: UIImageView = {
//        let view = UIImageView(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
//        return view;
//    }()
//
//    public lazy var imgViewRight: UIImageView = {
//        let view = UIImageView(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.isUserInteractionEnabled = true;
//        view.contentMode = .scaleAspectFit;
//        view.image = UIImage(named: "img_arrowRight_gray");
//
//        return view
//    }()
//
//    public lazy var labelLeft: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15);
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.isUserInteractionEnabled = true;
//        return view;
//    }()
//
//    public lazy var labelLeftSub: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15);
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
//        view.isUserInteractionEnabled = true;
//
//        return view
//    }()
//
//    public lazy var labelRight: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15);
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.isUserInteractionEnabled = true;
//        return view;
//    }()
//
//    public lazy var labelRightSub: UILabel = {
//        let view = UILabel(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15);
//        view.textAlignment = .left;
//        view.numberOfLines = 0;
//        view.lineBreakMode = .byCharWrapping;
//        view.font = UIFont.systemFont(ofSize: UIFont.labelFontSize - 2.0);
//        view.isUserInteractionEnabled = true;
//
//        return view;
//    }()
//
//    public lazy var btn: UIButton = {
//        let view = UIButton(type: .custom);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.titleLabel?.font = UIFont.systemFont(ofSize: 15);
//        view.titleLabel?.adjustsFontSizeToFitWidth = true;
//        view.titleLabel?.minimumScaleFactor = 1.0;
////         view.setTitleColor(UIColor.white, for: .normal)
////         view.backgroundColor = UIColor.theme
//        view.isExclusiveTouch = true;
//
//        return view;
//    }()
//
//    public lazy var textfield: UITextField = {
//        let view = UITextField(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15);
//        view.textAlignment = .left;
//        view.contentVerticalAlignment = .center;
//        view.autocapitalizationType = .none;
//        view.autocorrectionType = .no;
//        view.clearButtonMode = .whileEditing;
//        view.backgroundColor = .white;
//        view.returnKeyType = .done
//
//        return view
//    }()
//
//    public lazy var textView: UITextView = {
//        let view = UITextView(frame: CGRect.zero);
//        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.font = UIFont.systemFont(ofSize: 15);
//        view.textAlignment = .left;
//        view.autocapitalizationType = .none;
//        view.autocorrectionType = .no;
//        view.backgroundColor = .white;
//
//        return view
//    }()
//
//
//    public lazy var gradientLayer: CAGradientLayer = {
//        let colors = [UIColor.theme.withAlphaComponent(0.5).cgColor, UIColor.theme.withAlphaComponent(0.9).cgColor]
//        let layer = CAGradientLayer(colors: colors, start: CGPointMake(0, 0), end: CGPointMake(1.0, 0))
//        return layer
//    }()
//
//
//
//    UICollectionReusableView
    // MARK: -lazy
    public lazy var imgView: UIImageView = {
       let view = UIImageView(frame: CGRect.zero);
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       view.isUserInteractionEnabled = true;
       view.contentMode = .scaleAspectFit;
       view.backgroundColor = .clear

       return view
   }()

    public lazy var imgViewRight: UIImageView = {
       let view = UIImageView(frame: CGRect.zero);
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

       view.isUserInteractionEnabled = true;
       view.contentMode = .scaleAspectFit;
       view.image = UIImage(named: "img_arrowRight_gray");
//             view.backgroundColor = UIColor.random

       return view
   }()

    public lazy var labelRight: UILabel = {
        let view = UILabel(frame: CGRect.zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.numberOfLines = 1;
        view.adjustsFontSizeToFitWidth = true
        view.textAlignment = .center;

       return view
   }()

    public lazy var label: UILabel = {
       let view = UILabel(frame: .zero);
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       view.font = UIFont.systemFont(ofSize: 15)
       view.numberOfLines = 0;
       view.lineBreakMode = .byCharWrapping;
       view.textAlignment = .center;

       return view
   }()

    public lazy var labSub: UILabel = {
       let view = UILabel(frame: .zero);
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       view.font = UIFont.systemFont(ofSize: 13)
       view.numberOfLines = 0;
       view.lineBreakMode = .byCharWrapping;
       view.textAlignment = .center;
//         view.backgroundColor = UIColor.random

       return view
    }()

    public lazy var btn: UIButton = {
       let view = UIButton(type: .custom);
       view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       view.titleLabel?.font = UIFont.systemFont(ofSize: 15);
       view.titleLabel?.adjustsFontSizeToFitWidth = true;
       view.titleLabel?.minimumScaleFactor = 1.0;
       view.isExclusiveTouch = true;
       view.setTitleColor(.textColor3, for: .normal)
       view.setTitleColor(.theme, for: .selected)

       return view
   }()
}
