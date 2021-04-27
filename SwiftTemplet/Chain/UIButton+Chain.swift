//
//	UIButton+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 16:58
//	Copyright © 2021 Bin Shang. All rights reserved.
//



public extension UIButton {

    // default is UIEdgeInsetsZero. On tvOS 10 or later, default is nonzero except for custom buttons.
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentEdgeInsets
        return self
    }

    // default is UIEdgeInsetsZero
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }

    // default is NO. if YES, shadow reverses to shift between engrave and emboss appearance
    func reversesTitleShadowWhenHighlighted(_ reversesTitleShadowWhenHighlighted: Bool) -> Self {
        self.reversesTitleShadowWhenHighlighted = reversesTitleShadowWhenHighlighted
        return self
    }

    // default is UIEdgeInsetsZero
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }

    // default is YES. if YES, image is drawn darker when highlighted(pressed)
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted: Bool) -> Self {
        self.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        return self
    }

    // default is YES. if YES, image is drawn lighter when disabled
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled: Bool) -> Self {
        self.adjustsImageWhenDisabled = adjustsImageWhenDisabled
        return self
    }

    // default is NO. if YES, show a simple feedback (currently a glow) while highlighted
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted: Bool) -> Self {
        self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
        return self
    }

    // The tintColor is inherited through the superview hierarchy. See UIView for more information.
    @available(iOS 5.0, *)
    func tintColor(_ tintColor: UIColor!) -> Self {
        self.tintColor = tintColor
        return self
    }

    // default is UIButtonRoleNormal. 
    @available(iOS 14.0, *)
    func role(_ role: UIButton.Role) -> Self {
        self.role = role
        return self
    }

    @available(iOS 13.4, *)
    func isPointerInteractionEnabled(_ isPointerInteractionEnabled: Bool) -> Self {
        self.isPointerInteractionEnabled = isPointerInteractionEnabled
        return self
    }
    
    @available(iOS 14.0, *)
    func menu(_ menu: UIMenu?) -> Self {
        self.menu = menu
        return self
    }
        
    func setTitleChain(_ title: String?, for state: UIControl.State) -> Self {
        setTitle(title, for: state)
        return self
    }

    func setTitleColorChain(_ color: UIColor?, for state: UIControl.State) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    func setTitleShadowColorChain(_ color: UIColor?, for state: UIControl.State) -> Self {
        setTitleShadowColor(color, for: state)
        return self
    }
    
    func setImageChain(_ image: UIImage?, for state: UIControl.State) -> Self {
        setImage(image, for: state)
        return self
    }

    func setBackgroundImageChain(_ image: UIImage?, for state: UIControl.State) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    @available(iOS 13.0, *)
    func setPreferredSymbolConfigurationChain(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State) -> Self {
        setPreferredSymbolConfiguration(configuration, forImageIn: state)
        return self
    }

    @available(iOS 6.0, *)
    func setAttributedTitleChain(_ title: NSAttributedString?, for state: UIControl.State) -> Self {
        setAttributedTitle(title, for: state)
        return self
    }

}
