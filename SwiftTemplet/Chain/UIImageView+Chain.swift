//
//	UIImageView+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/22 16:59
//	Copyright © 2021 Bin Shang. All rights reserved.
//



public extension UIImageView {

    // default is nil
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }

    // default is nil
    @available(iOS 3.0, *)
    func highlightedImage(_ highlightedImage: UIImage?) -> Self {
        self.highlightedImage = highlightedImage
        return self
    }

    @available(iOS 13.0, *)
    func preferredSymbolConfiguration(_ preferredSymbolConfiguration: UIImage.SymbolConfiguration?) -> Self {
        self.preferredSymbolConfiguration = preferredSymbolConfiguration
        return self
    }

    // default is NO
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }

    // default is NO
    @available(iOS 3.0, *)
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }

    // The array must contain UIImages. Setting hides the single image. default is nil
    func animationImages(_ animationImages: [UIImage]?) -> Self {
        self.animationImages = animationImages
        return self
    }

    // The array must contain UIImages. Setting hides the single image. default is nil
    @available(iOS 3.0, *)
    func highlightedAnimationImages(_ highlightedAnimationImages: [UIImage]?) -> Self {
        self.highlightedAnimationImages = highlightedAnimationImages
        return self
    }

    // for one cycle of images. default is number of images * 1/30th of a second (i.e. 30 fps)
    func animationDuration(_ animationDuration: TimeInterval) -> Self {
        self.animationDuration = animationDuration
        return self
    }

    // 0 means infinite (default is 0)
    func animationRepeatCount(_ animationRepeatCount: Int) -> Self {
        self.animationRepeatCount = animationRepeatCount
        return self
    }

    @available(iOS 7.0, *)
    func tintColor(_ tintColor: UIColor!) -> Self {
        self.tintColor = tintColor
        return self
    }

}
