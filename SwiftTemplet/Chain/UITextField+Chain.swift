//
//	UITextField+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 18:18
//	Copyright © 2021 Bin Shang. All rights reserved.
//



@available(iOS 2.0, *)
public extension UITextField {

    // default is nil
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }

    // default is nil
    @available(iOS 6.0, *)
    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }

    // default is nil. use opaque black
    func textColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }

    // default is nil. use system font 12 pt
    func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }

    // default is NSLeftTextAlignment
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }

    // default is UITextBorderStyleNone. If set to UITextBorderStyleRoundedRect, custom background images are ignored.
    func borderStyle(_ borderStyle: UITextField.BorderStyle) -> Self {
        self.borderStyle = borderStyle
        return self
    }

    // applies attributes to the full range of text. Unset attributes act like default values.
    @available(iOS 7.0, *)
    func defaultTextAttributes(_ defaultTextAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.defaultTextAttributes = defaultTextAttributes
        return self
    }

    // default is nil. string is drawn 70% gray
    func placeholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }

    // default is nil
    @available(iOS 6.0, *)
    func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self {
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }

    // default is NO which moves cursor to location clicked. if YES, all text cleared
    func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> Self {
        self.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }

    // default is NO. if YES, text will shrink to minFontSize along baseline
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }

    // default is 0.0. actual min may be pinned to something readable. used if adjustsFontSizeToFitWidth is YES
    func minimumFontSize(_ minimumFontSize: CGFloat) -> Self {
        self.minimumFontSize = minimumFontSize
        return self
    }

    // default is nil. weak reference
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }

    // default is nil. draw in border rect. image should be stretchable
    func background(_ background: UIImage?) -> Self {
        self.background = background
        return self
    }

    // default is nil. ignored if background not set. image should be stretchable
    func disabledBackground(_ disabledBackground: UIImage?) -> Self {
        self.disabledBackground = disabledBackground
        return self
    }

    // default is NO. allows editing text attributes with style operations and pasting rich text
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

    // sets when the clear button shows up. default is UITextFieldViewModeNever
    func clearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> Self {
        self.clearButtonMode = clearButtonMode
        return self
    }

    // e.g. magnifying glass
    func leftView(_ leftView: UIView?) -> Self {
        self.leftView = leftView
        return self
    }

    // sets when the left view shows up. default is UITextFieldViewModeNever
    func leftViewMode(_ leftViewMode: UITextField.ViewMode) -> Self {
        self.leftViewMode = leftViewMode
        return self
    }

    // e.g. bookmarks button
    func rightView(_ rightView: UIView?) -> Self {
        self.rightView = rightView
        return self
    }

    // sets when the right view shows up. default is UITextFieldViewModeNever
    func rightViewMode(_ rightViewMode: UITextField.ViewMode) -> Self {
        self.rightViewMode = rightViewMode
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
}
