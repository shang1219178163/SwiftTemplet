//
//	UILabel+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 16:56
//	Copyright © 2021 Bin Shang. All rights reserved.
//


public extension UILabel {

    // default is nil
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }

    // default is nil (system font 17 plain)
    func font(_ font: UIFont!) -> Self {
        self.font = font
        return self
    }

    // default is labelColor
    func textColor(_ textColor: UIColor!) -> Self {
        self.textColor = textColor
        return self
    }

    // default is nil (no shadow)
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }

    // default is CGSizeMake(0, -1) -- a top shadow
    func shadowOffset(_ shadowOffset: CGSize) -> Self {
        self.shadowOffset = shadowOffset
        return self
    }

    // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }

    // default is nil
    func highlightedTextColor(_ highlightedTextColor: UIColor?) -> Self {
        self.highlightedTextColor = highlightedTextColor
        return self
    }

    // default is NO
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }

    // default is NO
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }

    // default is YES. changes how the label is drawn
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }


    func numberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }

    // default is NO
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }

    // default is UIBaselineAdjustmentAlignBaselines
    func baselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self {
        self.baselineAdjustment = baselineAdjustment
        return self
    }

    // default is 0.0
    @available(iOS 6.0, *)
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }

    // default is NO
    @available(iOS 9.0, *)
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self {
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }


    func lineBreakStrategy(_ lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) -> Self {
        self.lineBreakStrategy = lineBreakStrategy
        return self
    }

    @available(iOS 6.0, *)
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self {
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }



}
