//
//  NNFloatingPanelBaseController.swift
//  ParkingWang
//
//  Created by Bin Shang on 2020/7/27.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import FloatingPanel


protocol NNFloatingPanelDelegate{
    func nFloatingPanelWillBeginDragging(_ vc: FloatingPanelController)
    func nFloatingPanelDidEndDragging(_ vc: FloatingPanelController)
    
    func nFloatingPanelLayout(_ vc: FloatingPanelController) -> NNPanelLandscapeBaseLayout
}


class NNFloatingPanelBaseController: UIViewController {
    var fpc: FloatingPanelController!
    
//    var contentViewController: UIViewController?{
//        willSet{
//            fpc.set(contentViewController: contentViewController)
//            if let scrollow = contentViewController?.view.subView(UIScrollView.self) as? UIScrollView {
//                fpc.track(scrollView: scrollow)
//            }
//        }
//    }
        
    var canDragging = true
    
    var delegate: NNFloatingPanelDelegate?

    // MARK: -lifecycle
//    convenience init(contentViewController: UIViewController) {
//        self.init()
//        self.contentViewController = contentViewController
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fpc = FloatingPanelController()
        fpc.delegate = self

        // Initialize FloatingPanelController and add the view
        fpc.surfaceView.backgroundColor = .clear
        if #available(iOS 11, *) {
            fpc.surfaceView.layer.cornerRadius = 9.0
        } else {
            fpc.surfaceView.layer.cornerRadius = 0.0
        }
//        fpc.surfaceView.shadowHidden = false
//        fpc.surfaceView.grabberHandle.isHidden = false

//        // Set a content view controller
//        fpc.set(contentViewController: contentViewController)
//        if let scrollow = contentViewController?.view.subView(UIScrollView.self) as? UIScrollView {
//            fpc.track(scrollView: scrollow)
//        }
    }

}

extension NNFloatingPanelBaseController: FloatingPanelControllerDelegate{

    // MARK: FloatingPanelControllerDelegate
    
    func floatingPanel(_ fpc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
        if let layout = delegate?.nFloatingPanelLayout(fpc) as NNPanelLandscapeBaseLayout? {
            return layout
        }
        
        switch newCollection.verticalSizeClass {
        case .compact:
            fpc.surfaceView.layer.borderWidth = 1.0 / traitCollection.displayScale
            fpc.surfaceView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor;
            return NNPanelLandscapeBaseLayout()
        default:
            fpc.surfaceView.layer.borderWidth = 0.0
            fpc.surfaceView.layer.borderColor = nil
            return NNPanelLandscapeBaseLayout()
        }
    }

    func floatingPanelDidMove(_ vc: FloatingPanelController) {
        let y = vc.surfaceView.frame.origin.y
//        let tipY = vc.originYOfSurface(for: .tip)
//        if y > tipY - 44.0 {
//            let progress = max(0.0, min((tipY  - y) / 44.0, 1.0))
////            fpc.scrollView?.alpha = progress
//        }
//        debugPrint("NearbyPosition : ",vc.nearbyPosition)
    }

    
    func floatingPanelShouldBeginDragging(_ vc: FloatingPanelController) -> Bool {
//        if vc.position == .half || vc.position == .tip {
//            return false
//        }
        return canDragging
    }
    
    func floatingPanelWillBeginDragging(_ vc: FloatingPanelController) {
        delegate?.nFloatingPanelWillBeginDragging(vc)
        if vc.state == .full {

        }
        
        if vc.state == .half {
//            canDragging = false
        }
    }
    
    func floatingPanelWillEndDragging(_ fpc: FloatingPanelController, withVelocity velocity: CGPoint, targetState: UnsafeMutablePointer<FloatingPanelState>) {
        delegate?.nFloatingPanelDidEndDragging(fpc)
        if targetState.pointee != .full {
            
        }

        UIView.animate(
            withDuration: 0.25,
            delay: 0.0,
            options: .allowUserInteraction,
            animations: {
                if targetState.pointee == .tip {
    //              self.fpc.scrollView?.alpha = 0.0
                } else {
                    self.fpc.backdropView.alpha = 1.0
                }
        }, completion: nil)
    }

}

class NNPanelLandscapeBaseLayout: FloatingPanelLayout {
    
    var position: FloatingPanel.FloatingPanelPosition = .bottom;
    
    var initialState: FloatingPanel.FloatingPanelState = .half;
    
    var anchors: [FloatingPanel.FloatingPanelState: FloatingPanel.FloatingPanelLayoutAnchoring] = [:]
    
    
    var fullPosition: CGFloat = 16
    var tipPosition: CGFloat = 169
    var halfPosition: CGFloat = 216
    
    var initPosition: FloatingPanelState = .half
    var suportPositions: Set<FloatingPanelState> = [.full, .half, .tip]
    var backdropAlpha: CGFloat = 0

    var leftSpacing: CGFloat = 0
    var rightSpacing: CGFloat = 0
    

    convenience init(tipPosition: CGFloat = 69, halfPosition: CGFloat = 216, fullPosition: CGFloat = 16) {
        self.init()
        self.fullPosition = fullPosition
        self.halfPosition = halfPosition
        self.tipPosition = tipPosition
    }
    // MARK: -
    public var initialPosition: FloatingPanelState {
        return initPosition
    }
    
    public var supportedPositions: Set<FloatingPanelState> {
        return suportPositions
    }

    public func insetFor(position: FloatingPanelState) -> CGFloat? {
        switch position {
        case .full:
            return fullPosition
        case .half:
            return halfPosition
        case .tip:
            return tipPosition
        default:
            return nil
        }
    }

    public func prepareLayout(surfaceView: UIView, in view: UIView) -> [NSLayoutConstraint] {
        let screenWidth = UIScreen.main.bounds.width;
        if #available(iOS 11.0, *) {
            return [
                surfaceView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: leftSpacing),
                surfaceView.widthAnchor.constraint(equalToConstant: screenWidth - leftSpacing - rightSpacing),
            ]
        } else {
            return [
                surfaceView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: rightSpacing),
                surfaceView.widthAnchor.constraint(equalToConstant: screenWidth - leftSpacing - rightSpacing),
            ]
        }
    }
    
    public func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        return backdropAlpha
    }
}
