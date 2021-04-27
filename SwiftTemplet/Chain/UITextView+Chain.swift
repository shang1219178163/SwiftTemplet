//
//	UITextView+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 16:59
//	Copyright © 2021 Bin Shang. All rights reserved.
//



public extension UITextView {


    func text(_ text: String!) -> Self {
        self.text = text
        return self
    }

    func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }

    func textColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }

    // default is NSLeftTextAlignment
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }


    func selectedRange(_ selectedRange: NSRange) -> Self {
        self.selectedRange = selectedRange
        return self
    }

    func isEditable(_ isEditable: Bool) -> Self {
        self.isEditable = isEditable
        return self
    }

    // toggle selectability, which controls the ability of the user to select content and interact with URLs & attachments. On tvOS this also makes the text view focusable.
    @available(iOS 7.0, *)
    func isSelectable(_ isSelectable: Bool) -> Self {
        self.isSelectable = isSelectable
        return self
    }

    @available(iOS 3.0, *)
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> Self {
        self.dataDetectorTypes = dataDetectorTypes
        return self
    }

    // defaults to NO
    @available(iOS 6.0, *)
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self {
        self.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }

    // automatically resets when the selection changes
    @available(iOS 6.0, *)
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.typingAttributes = typingAttributes
        return self
    }
    

    func inputView(_ inputView: UIView?) -> Self {
        self.inputView = inputView
        return self
    }


    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.inputAccessoryView = inputAccessoryView
        return self
    }

    // defaults to NO. if YES, the selection UI is hidden, and inserting text will replace the contents of the field. changing the selection will automatically set this to NO.
    @available(iOS 6.0, *)
    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        self.clearsOnInsertion = clearsOnInsertion
        return self
    }

    @available(iOS 7.0, *)
    func textContainerInset(_ textContainerInset: UIEdgeInsets) -> Self {
        self.textContainerInset = textContainerInset
        return self
    }

    @available(iOS 7.0, *)
    func linkTextAttributes(_ linkTextAttributes: [NSAttributedString.Key: Any]) -> Self {
        self.linkTextAttributes = linkTextAttributes
        return self
    }

    @available(iOS 13.0, *)
    func usesStandardTextScaling(_ usesStandardTextScaling: Bool) -> Self {
        self.usesStandardTextScaling = usesStandardTextScaling
        return self
    }

}
