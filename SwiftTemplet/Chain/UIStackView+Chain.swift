//
//	UIStackView+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/26 17:54
//	Copyright © 2021 Bin Shang. All rights reserved.
//



@available(iOS 6.0, *)
public extension UIStackView {

    func axisChain(_ axis: NSLayoutConstraint.Axis) -> Self {
        self.axis = axis
        return self
    }

    func distributionChain(_ distribution: UIStackView.Distribution) -> Self {
        self.distribution = distribution
        return self
    }

    func alignmentChain(_ alignment: UIStackView.Alignment) -> Self {
        self.alignment = alignment
        return self
    }

    func spacingChain(_ spacing: CGFloat) -> Self {
        self.spacing = spacing
        return self
    }

    func isBaselineRelativeArrangementChain(_ isBaselineRelativeArrangement: Bool) -> Self {
        self.isBaselineRelativeArrangement = isBaselineRelativeArrangement
        return self
    }

    func isLayoutMarginsRelativeArrangementChain(_ isLayoutMarginsRelativeArrangement: Bool) -> Self {
        self.isLayoutMarginsRelativeArrangement = isLayoutMarginsRelativeArrangement
        return self
    }

    
    func removeArrangedSubviewChain(_ view: UIView) -> Self {
        self.removeArrangedSubview(view)
        return self
    }
    
    func insertArrangedSubviewChain(_ view: UIView, at stackIndex: Int) -> Self {
        self.insertArrangedSubview(view, at: stackIndex)
        return self
    }
    
    @available(iOS 11.0, *)
    func setCustomSpacingChain(_ spacing: CGFloat, after arrangedSubview: UIView) -> Self {
        self.setCustomSpacing(spacing, after: arrangedSubview)
        return self
    }
    
}
