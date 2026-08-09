//
//  NNButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/18.
//  Copyright © 2020 BN. All rights reserved.
//
//  自定义图文方位按钮 + 角标。在 layoutSubviews 中写 imageView / titleLabel / badgeBtn 的 frame。
//  - 尺寸由内容自适应（intrinsicContentSize / sizeThatFits）
//  - 使用 `padding` 作为内容内边距（角标仍相对 bounds 四角）
//  - 忽略 contentEdgeInsets / imageEdgeInsets / titleEdgeInsets / content*Alignment
//  - 状态边框请用 SwiftExpand：`setBorderColor` / `setBorderWidth` / `setCornerRadius`
//

import UIKit

/// 自定义图像方向按钮（frame 布局，内容自适应尺寸）
@objcMembers class NNButton: UIButton {

    /// 主图相对文字的方位（上 / 左 / 下 / 右）；`.none` / `.center` 时图文居中叠放规则见 `layoutImageAndTitle`
    var direction: UIView.Direction = .left {
        didSet {
            guard oldValue != direction else { return }
            setNeedsLayout()
            invalidateIntrinsicContentSize()
        }
    }

    /// 角标 `badgeBtn` 的角落位置；`.none` 时隐藏角标
    var badgeLocation: UIView.Location = .rightTop {
        didSet {
            guard oldValue != badgeLocation else { return }
            setNeedsLayout()
        }
    }

    /// 角标相对角落的外向偏移（`horizontal` / `vertical` 均为非负时表示沿该角向外）
    var badgeOffset: UIOffset = .zero {
        didSet {
            guard oldValue != badgeOffset else { return }
            setNeedsLayout()
        }
    }

    /// 扩大响应区域（四边向外扩展的距离）
    var eventInset: CGFloat = 0

    /// 角标尺寸
    var badgeSize: CGSize = CGSize(width: 24, height: 24) {
        didSet {
            guard oldValue != badgeSize else { return }
            setNeedsLayout()
        }
    }

    /// 主图（`imageView`）尺寸；宽或高 ≤ 0 时该边取图片固有尺寸
    var imageSize: CGSize = .zero {
        didSet {
            guard oldValue != imageSize else { return }
            setNeedsLayout()
            invalidateIntrinsicContentSize()
        }
    }

    /// 文字区域高度（> 0 时作为标题占用高度；≤ 0 时按文字实测）
    var labelHeight: CGFloat = 25 {
        didSet {
            guard oldValue != labelHeight else { return }
            setNeedsLayout()
            invalidateIntrinsicContentSize()
        }
    }

    /// 主图与文字间距
    var spacing: CGFloat = 4 {
        didSet {
            guard oldValue != spacing else { return }
            setNeedsLayout()
            invalidateIntrinsicContentSize()
        }
    }

    /// 内容区内边距（图文排布在 `bounds.inset(by: padding)` 内；角标仍相对按钮四角）
    var padding: UIEdgeInsets = .zero {
        didSet {
            guard oldValue != padding else { return }
            setNeedsLayout()
            invalidateIntrinsicContentSize()
        }
    }

    /// 角标按钮（可单独加 target，如删除）
    private(set) lazy var badgeBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.translatesAutoresizingMaskIntoConstraints = true
        view.autoresizingMask = []
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        view.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return view
    }()

    // MARK: - Lifecycle

    /// 指定 frame 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /// Storyboard / XIB 解码初始化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    /// 公共初始化：挂载角标、默认样式
    private func commonInit() {
        clipsToBounds = false
        ensureBadgeInHierarchy()

        let normalTextColor = UIColor.black.withAlphaComponent(0.3)
        let selectedTextColor = UIColor.systemBlue
        setTitleColor(normalTextColor, for: .normal)
        setTitleColor(selectedTextColor, for: .selected)

        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true

        imageView?.tintColor = UIColor.theme
        imageView?.contentMode = .scaleAspectFit

        setContentHuggingPriority(.required, for: .horizontal)
        setContentHuggingPriority(.required, for: .vertical)
        setContentCompressionResistancePriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .vertical)
    }

    /// 保证角标在视图层级中（兼容 `NNButton(type:)` 未走 `init(frame:)` 的情况）
    private func ensureBadgeInHierarchy() {
        if badgeBtn.superview !== self {
            addSubview(badgeBtn)
        }
    }

    // MARK: - Content

    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

    override func setAttributedTitle(_ title: NSAttributedString?, for state: UIControl.State) {
        super.setAttributedTitle(title, for: state)
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image, for: state)
        invalidateIntrinsicContentSize()
        setNeedsLayout()
    }

    // MARK: - Sizing

    /// 由图片、标题、`direction` / `spacing` / `imageSize` / `labelHeight` / `padding` 计算内容尺寸
    override var intrinsicContentSize: CGSize {
        fittedSize(for: CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric))
    }

    /// 在给定约束下测算内容尺寸
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        fittedSize(for: size)
    }

    // MARK: - Layout

    /// 按 `direction` 排布主图文，再按 `badgeLocation` 排布角标
    override func layoutSubviews() {
        super.layoutSubviews()

        ensureBadgeInHierarchy()
        guard bounds.width > 0, bounds.height > 0 else { return }

        if let imageView, let titleLabel {
            layoutImageAndTitle(imageView: imageView, titleLabel: titleLabel)
        }
        layoutBadge()
    }

    /// 扩大点击热区
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let eventBounds = bounds.insetBy(dx: -eventInset, dy: -eventInset)
        return eventBounds.contains(point)
    }

    // MARK: - Private · Metrics

    private var hasImageContent: Bool {
        currentImage != nil && !(imageView?.isHidden ?? false)
    }

    private var hasTitleContent: Bool {
        let hasText = !(currentTitle ?? "").isEmpty || (currentAttributedTitle?.length ?? 0) > 0
        return hasText && !(titleLabel?.isHidden ?? false)
    }

    /// 规范化后的内边距（负值按 0）
    private var safePadding: UIEdgeInsets {
        UIEdgeInsets(
            top: max(0, padding.top),
            left: max(0, padding.left),
            bottom: max(0, padding.bottom),
            right: max(0, padding.right)
        )
    }

    private var paddingWidth: CGFloat { safePadding.left + safePadding.right }
    private var paddingHeight: CGFloat { safePadding.top + safePadding.bottom }

    /// 图文内容区（扣除 `padding`）
    private var contentRect: CGRect {
        bounds.inset(by: safePadding)
    }

    /// 主图目标尺寸（`imageSize` 优先，否则图片固有尺寸），并钳制到 `maxSize`
    private func preferredImageSize(maxSize: CGSize) -> CGSize {
        guard let image = currentImage else { return .zero }
        let natural = image.size
        var width = imageSize.width > 0 ? imageSize.width : max(0, natural.width)
        var height = imageSize.height > 0 ? imageSize.height : max(0, natural.height)

        if imageSize.width > 0, imageSize.height <= 0, natural.width > 0 {
            height = width * (natural.height / natural.width)
        } else if imageSize.height > 0, imageSize.width <= 0, natural.height > 0 {
            width = height * (natural.width / natural.height)
        }

        if maxSize.width < CGFloat.greatestFiniteMagnitude / 2 {
            width = min(width, max(0, maxSize.width))
        }
        if maxSize.height < CGFloat.greatestFiniteMagnitude / 2 {
            height = min(height, max(0, maxSize.height))
        }
        return CGSize(width: width, height: height)
    }

    /// 标题目标尺寸；`labelHeight` > 0 时高度取 `labelHeight`
    private func preferredTitleSize(maxWidth: CGFloat) -> CGSize {
        let limit = maxWidth > 0 && maxWidth < CGFloat.greatestFiniteMagnitude / 2
            ? maxWidth
            : CGFloat.greatestFiniteMagnitude

        var measured: CGSize = .zero
        if let attributed = currentAttributedTitle, attributed.length > 0 {
            let rect = attributed.boundingRect(
                with: CGSize(width: limit, height: CGFloat.greatestFiniteMagnitude),
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                context: nil
            )
            measured = CGSize(width: ceil(rect.width), height: ceil(rect.height))
        } else if let title = currentTitle, !title.isEmpty {
            let font = titleLabel?.font ?? UIFont.systemFont(ofSize: UIFont.buttonFontSize)
            let rect = (title as NSString).boundingRect(
                with: CGSize(width: limit, height: CGFloat.greatestFiniteMagnitude),
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                attributes: [.font: font],
                context: nil
            )
            measured = CGSize(width: ceil(rect.width), height: ceil(rect.height))
        }

        guard measured.width > 0 || measured.height > 0 else { return .zero }
        let height = labelHeight > 0 ? labelHeight : measured.height
        return CGSize(width: measured.width, height: height)
    }

    /// 综合图文与方位，计算适配尺寸（含 `padding`）
    private func fittedSize(for proposed: CGSize) -> CGSize {
        let padW = paddingWidth
        let padH = paddingHeight
        let maxW = proposed.width > 0
            ? max(0, proposed.width - padW)
            : CGFloat.greatestFiniteMagnitude
        let maxH = proposed.height > 0
            ? max(0, proposed.height - padH)
            : CGFloat.greatestFiniteMagnitude
        let content = contentFittedSize(maxWidth: maxW, maxHeight: maxH)
        var size = CGSize(width: content.width + padW, height: content.height + padH)
        if proposed.width > 0 {
            size.width = min(size.width, proposed.width)
        }
        if proposed.height > 0 {
            size.height = min(size.height, proposed.height)
        }
        return size
    }

    /// 不含 padding 的图文内容尺寸
    private func contentFittedSize(maxWidth: CGFloat, maxHeight: CGFloat) -> CGSize {
        let maxW = maxWidth
        let maxH = maxHeight
        let maxSize = CGSize(width: maxW, height: maxH)
        let safeSpacing = max(0, spacing)

        let imageOnly = hasImageContent && !hasTitleContent
        let titleOnly = hasTitleContent && !hasImageContent
        if imageOnly {
            return preferredImageSize(maxSize: maxSize)
        }
        if titleOnly {
            return preferredTitleSize(maxWidth: maxW)
        }
        if !hasImageContent, !hasTitleContent {
            return .zero
        }

        switch direction {
        case .top, .bottom:
            let title = preferredTitleSize(maxWidth: maxW)
            let imageMaxH = maxH < CGFloat.greatestFiniteMagnitude / 2
                ? max(0, maxH - title.height - safeSpacing)
                : CGFloat.greatestFiniteMagnitude
            let image = preferredImageSize(maxSize: CGSize(width: maxW, height: imageMaxH))
            return CGSize(
                width: min(max(image.width, title.width), maxW),
                height: min(image.height + safeSpacing + title.height, maxH)
            )

        case .left, .right:
            let image = preferredImageSize(maxSize: maxSize)
            let titleMaxW = maxW < CGFloat.greatestFiniteMagnitude / 2
                ? max(0, maxW - image.width - safeSpacing)
                : CGFloat.greatestFiniteMagnitude
            let title = preferredTitleSize(maxWidth: titleMaxW)
            return CGSize(
                width: min(image.width + safeSpacing + title.width, maxW),
                height: min(max(image.height, title.height), maxH)
            )

        case .center, .none:
            let image = preferredImageSize(maxSize: maxSize)
            let title = preferredTitleSize(maxWidth: maxW)
            return CGSize(
                width: min(max(image.width, title.width), maxW),
                height: min(max(image.height, title.height), maxH)
            )

        @unknown default:
            let image = preferredImageSize(maxSize: maxSize)
            let titleMaxW = maxW < CGFloat.greatestFiniteMagnitude / 2
                ? max(0, maxW - image.width - safeSpacing)
                : CGFloat.greatestFiniteMagnitude
            let title = preferredTitleSize(maxWidth: titleMaxW)
            return CGSize(
                width: min(image.width + safeSpacing + title.width, maxW),
                height: min(max(image.height, title.height), maxH)
            )
        }
    }

    // MARK: - Private · Layout

    /// 排布主 `imageView` 与 `titleLabel`（在 `contentRect` 内）
    private func layoutImageAndTitle(imageView: UIImageView, titleLabel: UILabel) {
        let box = contentRect
        guard box.width > 0, box.height > 0 else {
            imageView.frame = .zero
            titleLabel.frame = .zero
            return
        }

        if hasImageContent, !hasTitleContent {
            let imgSize = preferredImageSize(maxSize: box.size)
            imageView.frame = CGRect(
                x: box.minX + (box.width - imgSize.width) * 0.5,
                y: box.minY + (box.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.frame = .zero
            return
        }
        if hasTitleContent, !hasImageContent {
            titleLabel.frame = box
            titleLabel.textAlignment = .center
            imageView.frame = .zero
            return
        }
        if !hasImageContent, !hasTitleContent {
            imageView.frame = .zero
            titleLabel.frame = .zero
            return
        }

        let safeSpacing = max(0, spacing)
        let imgSize = preferredImageSize(maxSize: box.size)

        switch direction {
        case .top:
            let title = preferredTitleSize(maxWidth: box.width)
            titleLabel.textAlignment = .center
            imageView.frame = CGRect(
                x: box.minX + (box.width - imgSize.width) * 0.5,
                y: box.minY,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.frame = CGRect(
                x: box.minX,
                y: imageView.frame.maxY + safeSpacing,
                width: box.width,
                height: title.height
            )

        case .bottom:
            let title = preferredTitleSize(maxWidth: box.width)
            titleLabel.textAlignment = .center
            titleLabel.frame = CGRect(x: box.minX, y: box.minY, width: box.width, height: title.height)
            imageView.frame = CGRect(
                x: box.minX + (box.width - imgSize.width) * 0.5,
                y: titleLabel.frame.maxY + safeSpacing,
                width: imgSize.width,
                height: imgSize.height
            )

        case .right:
            imageView.frame = CGRect(
                x: box.maxX - imgSize.width,
                y: box.minY + (box.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            let titleWidth = max(0, imageView.frame.minX - box.minX - safeSpacing)
            let title = preferredTitleSize(maxWidth: titleWidth)
            titleLabel.textAlignment = .right
            titleLabel.frame = CGRect(
                x: box.minX,
                y: box.minY + (box.height - title.height) * 0.5,
                width: titleWidth,
                height: title.height
            )

        case .left:
            imageView.frame = CGRect(
                x: box.minX,
                y: box.minY + (box.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            let titleX = imageView.frame.maxX + safeSpacing
            let titleWidth = max(0, box.maxX - titleX)
            let title = preferredTitleSize(maxWidth: titleWidth)
            titleLabel.textAlignment = .left
            titleLabel.frame = CGRect(
                x: titleX,
                y: box.minY + (box.height - title.height) * 0.5,
                width: titleWidth,
                height: title.height
            )

        case .center:
            titleLabel.textAlignment = .center
            imageView.frame = CGRect(
                x: box.minX + (box.width - imgSize.width) * 0.5,
                y: box.minY + (box.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.frame = box

        case .none:
            titleLabel.textAlignment = .center
            imageView.frame = CGRect(
                x: box.minX + (box.width - imgSize.width) * 0.5,
                y: box.minY + (box.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.frame = box

        @unknown default:
            imageView.frame = CGRect(
                x: box.minX,
                y: box.minY + (box.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            let titleX = imageView.frame.maxX + safeSpacing
            let titleWidth = max(0, box.maxX - titleX)
            let title = preferredTitleSize(maxWidth: titleWidth)
            titleLabel.textAlignment = .left
            titleLabel.frame = CGRect(
                x: titleX,
                y: box.minY + (box.height - title.height) * 0.5,
                width: titleWidth,
                height: title.height
            )
        }
    }

    /// 排布角标并更新显隐（每轮布局重算，避免隐藏后无法恢复）
    private func layoutBadge() {
        let hasBadgeContent =
            badgeBtn.currentImage != nil
            || !(badgeBtn.currentTitle ?? "").isEmpty
            || badgeBtn.backgroundImage(for: .normal) != nil

        let showBadge: Bool
        switch badgeLocation {
        case .leftTop, .leftBottom, .rightTop, .rightBottom:
            showBadge = hasBadgeContent
        case .none:
            showBadge = false
        @unknown default:
            showBadge = false
        }

        badgeBtn.isHidden = !showBadge
        guard showBadge else { return }

        let size = CGSize(width: max(0, badgeSize.width), height: max(0, badgeSize.height))
        let dx = badgeOffset.horizontal
        let dy = badgeOffset.vertical
        let frame: CGRect
        switch badgeLocation {
        case .leftTop:
            frame = CGRect(x: -dx, y: -dy, width: size.width, height: size.height)
        case .leftBottom:
            frame = CGRect(
                x: -dx,
                y: bounds.height - size.height + dy,
                width: size.width,
                height: size.height
            )
        case .rightTop:
            frame = CGRect(
                x: bounds.width - size.width + dx,
                y: -dy,
                width: size.width,
                height: size.height
            )
        case .rightBottom:
            frame = CGRect(
                x: bounds.width - size.width + dx,
                y: bounds.height - size.height + dy,
                width: size.width,
                height: size.height
            )
        case .none:
            return
        @unknown default:
            return
        }

        badgeBtn.frame = frame
        bringSubviewToFront(badgeBtn)
    }
}
