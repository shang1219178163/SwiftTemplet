//
//  NNButton.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/18.
//  Copyright © 2020 BN. All rights reserved.
//
//  自定义图文方位按钮 + 角标。在 layoutSubviews 中写 imageView / titleLabel / iconBtn 的 frame。
//  - 忽略 contentEdgeInsets / imageEdgeInsets / titleEdgeInsets / content*Alignment
//  - 状态边框请用 SwiftExpand：`setBorderColor` / `setBorderWidth` / `setCornerRadius`
//

import UIKit

/// 自定义图像方向按钮（frame 布局）
@objcMembers class NNButton: UIButton {

    /// 主图相对文字的方位（上 / 左 / 下 / 右）；`.none` / `.center` 时图文居中叠放规则见 `layoutImageAndTitle`
    var direction: UIView.Direction = .left {
        didSet {
            guard oldValue != direction else { return }
            setNeedsLayout()
        }
    }

    /// 角标 `iconBtn` 的角落位置；`.none` 时隐藏角标
    var iconLocation: UIView.Location = .rightTop {
        didSet {
            guard oldValue != iconLocation else { return }
            setNeedsLayout()
        }
    }

    /// 角标相对角落的外向偏移（`horizontal` / `vertical` 均为非负时表示沿该角向外）
    var iconOffset: UIOffset = .zero {
        didSet {
            guard oldValue != iconOffset else { return }
            setNeedsLayout()
        }
    }

    /// 扩大响应区域（四边向外扩展的距离）
    var eventInset: CGFloat = 0

    /// 角标尺寸
    var iconSize: CGSize = CGSize(width: 24, height: 24) {
        didSet {
            guard oldValue != iconSize else { return }
            setNeedsLayout()
        }
    }

    /// 主图（`imageView`）尺寸；宽或高 ≤ 0 时该边按布局区域自适应
    var imageSize: CGSize = .zero {
        didSet {
            guard oldValue != imageSize else { return }
            setNeedsLayout()
        }
    }

    /// 文字区域高度（top / bottom / 横排时标题条高度）
    var labelHeight: CGFloat = 25 {
        didSet {
            guard oldValue != labelHeight else { return }
            setNeedsLayout()
        }
    }

    /// 主图与文字间距
    var spacing: CGFloat = 4 {
        didSet {
            guard oldValue != spacing else { return }
            setNeedsLayout()
        }
    }

    /// 角标按钮（可单独加 target，如删除）
    private(set) lazy var iconBtn: UIButton = {
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
        addSubview(iconBtn)

        let normalTextColor = UIColor.black.withAlphaComponent(0.3)
        let selectedTextColor = UIColor.systemBlue
        setTitleColor(normalTextColor, for: .normal)
        setTitleColor(selectedTextColor, for: .selected)

        titleLabel?.textAlignment = .center
        titleLabel?.adjustsFontSizeToFitWidth = true

        imageView?.tintColor = UIColor.theme
        imageView?.contentMode = .scaleAspectFit
    }

    // MARK: - Layout

    /// 按 `direction` 排布主图文，再按 `iconLocation` 排布角标
    override func layoutSubviews() {
        super.layoutSubviews()

        guard bounds.height > 10, bounds.width > 1 else { return }
        guard let imageView, let titleLabel else { return }

        layoutImageAndTitle(imageView: imageView, titleLabel: titleLabel)
        layoutBadge()
    }

    /// 扩大点击热区
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let eventBounds = bounds.insetBy(dx: -eventInset, dy: -eventInset)
        return eventBounds.contains(point)
    }

    // MARK: - Private

    /// 排布主 `imageView` 与 `titleLabel`
    private func layoutImageAndTitle(imageView: UIImageView, titleLabel: UILabel) {
        let hasImage = currentImage != nil && !imageView.isHidden
        let hasTitle = !(currentTitle ?? "").isEmpty && !titleLabel.isHidden

        if hasImage, !hasTitle {
            imageView.frame = bounds
            titleLabel.frame = .zero
            return
        }
        if hasTitle, !hasImage {
            titleLabel.frame = bounds
            imageView.frame = .zero
            return
        }
        if !hasImage, !hasTitle {
            imageView.frame = .zero
            titleLabel.frame = .zero
            return
        }

        let safeLabelHeight = min(max(0, labelHeight), bounds.height)
        let safeSpacing = max(0, spacing)

        switch direction {
        case .top:
            let maxImageHeight = max(0, bounds.height - safeLabelHeight - safeSpacing)
            let imgSize = resolvedImageSize(
                defaultSize: CGSize(width: bounds.width, height: maxImageHeight),
                maxSize: CGSize(width: bounds.width, height: maxImageHeight)
            )
            titleLabel.textAlignment = .center
            imageView.frame = CGRect(
                x: (bounds.width - imgSize.width) * 0.5,
                y: 0,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.frame = CGRect(
                x: 0,
                y: imageView.frame.maxY + safeSpacing,
                width: bounds.width,
                height: max(0, safeLabelHeight)
            )

        case .bottom:
            let maxImageHeight = max(0, bounds.height - safeLabelHeight - safeSpacing)
            let imgSize = resolvedImageSize(
                defaultSize: CGSize(width: bounds.width, height: maxImageHeight),
                maxSize: CGSize(width: bounds.width, height: maxImageHeight)
            )
            titleLabel.textAlignment = .center
            titleLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: max(0, safeLabelHeight))
            imageView.frame = CGRect(
                x: (bounds.width - imgSize.width) * 0.5,
                y: titleLabel.frame.maxY + safeSpacing,
                width: imgSize.width,
                height: imgSize.height
            )

        case .right:
            // 图在右：标题宽度 = 总宽 - 图宽 - spacing（只扣一次，避免居中后视觉上 spacing 无效）
            let defaultSide = min(bounds.height, bounds.width)
            let imgSize = resolvedImageSize(
                defaultSize: CGSize(width: defaultSide, height: defaultSide),
                maxSize: bounds.size
            )
            imageView.frame = CGRect(
                x: bounds.width - imgSize.width,
                y: (bounds.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.textAlignment = .right
            titleLabel.frame = CGRect(
                x: 0,
                y: (bounds.height - safeLabelHeight) * 0.5,
                width: max(0, imageView.frame.minX - safeSpacing),
                height: safeLabelHeight
            )

        case .left:
            // 图在左：标题从 image.maxX + spacing 起铺满剩余宽度
            let defaultSide = min(bounds.height, bounds.width)
            let imgSize = resolvedImageSize(
                defaultSize: CGSize(width: defaultSide, height: defaultSide),
                maxSize: bounds.size
            )
            imageView.frame = CGRect(
                x: 0,
                y: (bounds.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            let titleX = imageView.frame.maxX + safeSpacing
            titleLabel.textAlignment = .left
            titleLabel.frame = CGRect(
                x: titleX,
                y: (bounds.height - safeLabelHeight) * 0.5,
                width: max(0, bounds.width - titleX),
                height: safeLabelHeight
            )

        case .center:
            // 图文都居中叠放（适合仅装饰场景）
            let defaultSide = min(bounds.height, bounds.width) * 0.5
            let imgSize = resolvedImageSize(
                defaultSize: CGSize(width: defaultSide, height: defaultSide),
                maxSize: bounds.size
            )
            titleLabel.textAlignment = .center
            imageView.frame = CGRect(
                x: (bounds.width - imgSize.width) * 0.5,
                y: (bounds.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.frame = bounds

        case .none:
            let defaultSide = min(bounds.height, bounds.width)
            let imgSize = resolvedImageSize(
                defaultSize: CGSize(width: defaultSide, height: defaultSide),
                maxSize: bounds.size
            )
            titleLabel.textAlignment = .center
            imageView.frame = CGRect(
                x: (bounds.width - imgSize.width) * 0.5,
                y: (bounds.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            titleLabel.frame = bounds

        @unknown default:
            let defaultSide = min(bounds.height, bounds.width)
            let imgSize = resolvedImageSize(
                defaultSize: CGSize(width: defaultSide, height: defaultSide),
                maxSize: bounds.size
            )
            imageView.frame = CGRect(
                x: 0,
                y: (bounds.height - imgSize.height) * 0.5,
                width: imgSize.width,
                height: imgSize.height
            )
            let titleX = imageView.frame.maxX + safeSpacing
            titleLabel.textAlignment = .left
            titleLabel.frame = CGRect(
                x: titleX,
                y: (bounds.height - safeLabelHeight) * 0.5,
                width: max(0, bounds.width - titleX),
                height: safeLabelHeight
            )
        }
    }

    /// 解析主图尺寸：`imageSize` 宽/高 > 0 时采用并钳制到 `maxSize`，否则用 `defaultSize`
    private func resolvedImageSize(defaultSize: CGSize, maxSize: CGSize) -> CGSize {
        let width: CGFloat
        if imageSize.width > 0 {
            width = min(imageSize.width, max(0, maxSize.width))
        } else {
            width = max(0, defaultSize.width)
        }

        let height: CGFloat
        if imageSize.height > 0 {
            height = min(imageSize.height, max(0, maxSize.height))
        } else {
            height = max(0, defaultSize.height)
        }

        return CGSize(width: width, height: height)
    }

    /// 排布角标并更新显隐（每轮布局重算，避免隐藏后无法恢复）
    private func layoutBadge() {
        let hasBadgeContent =
            iconBtn.currentImage != nil
            || !(iconBtn.currentTitle ?? "").isEmpty
            || iconBtn.backgroundImage(for: .normal) != nil

        let showBadge: Bool
        switch iconLocation {
        case .leftTop, .leftBottom, .rightTop, .rightBottom:
            showBadge = hasBadgeContent
        case .none:
            showBadge = false
        @unknown default:
            showBadge = false
        }

        iconBtn.isHidden = !showBadge
        guard showBadge else { return }

        let size = CGSize(width: max(0, iconSize.width), height: max(0, iconSize.height))
        let dx = iconOffset.horizontal
        let dy = iconOffset.vertical
        let frame: CGRect
        switch iconLocation {
        case .leftTop:
            // 左上：向左 / 向上为外向
            frame = CGRect(x: -dx, y: -dy, width: size.width, height: size.height)
        case .leftBottom:
            // 左下：向左 / 向下为外向
            frame = CGRect(
                x: -dx,
                y: bounds.height - size.height + dy,
                width: size.width,
                height: size.height
            )
        case .rightTop:
            // 右上：向右 / 向上为外向
            frame = CGRect(
                x: bounds.width - size.width + dx,
                y: -dy,
                width: size.width,
                height: size.height
            )
        case .rightBottom:
            // 右下：向右 / 向下为外向
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

        iconBtn.frame = frame
        bringSubviewToFront(iconBtn)
    }
}
