//
//	UIPageControl+Chain.h
//	MacTemplet
//
//	Created by Bin Shang on 2021/04/26 17:52
//	Copyright © 2021 Bin Shang. All rights reserved.
//



@available(iOS 6.0, *)
public extension UIPageControl {

    func numberOfPagesChain(_ numberOfPages: Int) -> Self {
        self.numberOfPages = numberOfPages
        return self
    }

    func currentPageChain(_ currentPage: Int) -> Self {
        self.currentPage = currentPage
        return self
    }

    func hidesForSinglePageChain(_ hidesForSinglePage: Bool) -> Self {
        self.hidesForSinglePage = hidesForSinglePage
        return self
    }

    @available(iOS 6.0, *)
    func pageIndicatorTintColorChain(_ pageIndicatorTintColor: UIColor?) -> Self {
        self.pageIndicatorTintColor = pageIndicatorTintColor
        return self
    }

    @available(iOS 6.0, *)
    func currentPageIndicatorTintColorChain(_ currentPageIndicatorTintColor: UIColor?) -> Self {
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        return self
    }

    @available(iOS 14.0, *)
    func backgroundStyleChain(_ backgroundStyle: UIPageControl.BackgroundStyle) -> Self {
        self.backgroundStyle = backgroundStyle
        return self
    }

    @available(iOS 14.0, *)
    func allowsContinuousInteractionChain(_ allowsContinuousInteraction: Bool) -> Self {
        self.allowsContinuousInteraction = allowsContinuousInteraction
        return self
    }

    @available(iOS 14.0, *)
    func preferredIndicatorImageChain(_ preferredIndicatorImage: UIImage?) -> Self {
        self.preferredIndicatorImage = preferredIndicatorImage
        return self
    }

}
