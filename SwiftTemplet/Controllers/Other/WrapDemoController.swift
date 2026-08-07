//
//  WrapDemoController.swift
//  SwiftTemplet
//
//  Flutter Wrap 对齐组件演示：20 个彩色子项自动换行。
//

import UIKit
import SwiftExpand

class WrapDemoController: UIViewController {

    private let itemCount = 20

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.keyboardDismissMode = .onDrag
        return view
    }()

    private lazy var wrapView: NNWrapView = {
        let view = NNWrapView()
        view.direction = .horizontal
        view.alignment = .start
        view.spacing = 8
        view.runAlignment = .start
        view.runSpacing = 8
        view.crossAxisAlignment = .center
        view.children = makeColorItems(count: itemCount)
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 8
        view.clipBehavior = .hardEdge
        return view
    }()

    private let spacingValues: [CGFloat] = [8, 16, 24]

    private lazy var directionTitleLabel: UILabel = makeParamTitleLabel("direction")
    private lazy var alignmentTitleLabel: UILabel = makeParamTitleLabel("alignment")
    private lazy var runAlignmentTitleLabel: UILabel = makeParamTitleLabel("runAlignment")
    private lazy var spacingTitleLabel: UILabel = makeParamTitleLabel("spacing")
    private lazy var runSpacingTitleLabel: UILabel = makeParamTitleLabel("runSpacing")

    private lazy var alignmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["start", "center", "end", "between", "around", "evenly"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onAlignmentChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var runAlignmentControl: UISegmentedControl = {
        // 与 Flutter Wrap.runAlignment 一致；需容器交叉轴有剩余空间才可见
        let control = UISegmentedControl(items: ["start", "center", "end", "between", "around", "evenly"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onRunAlignmentChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var directionControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["horizontal", "vertical"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onDirectionChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var spacingControl: UISegmentedControl = {
        let control = UISegmentedControl(items: spacingValues.map { "\(Int($0))" })
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onSpacingChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var runSpacingControl: UISegmentedControl = {
        let control = UISegmentedControl(items: spacingValues.map { "\(Int($0))" })
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onRunSpacingChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "NNWrapView · 对齐 Flutter Wrap\nspacing=8 · runSpacing=8 · 内容自适应\nrunAlignment 作用在交叉轴剩余空间（灰底区域内上下/左右）"
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        if title?.isEmpty != false {
            title = "WrapDemo"
        }

        view.addSubview(scrollView)
        scrollView.addSubview(tipLabel)
        scrollView.addSubview(directionTitleLabel)
        scrollView.addSubview(directionControl)
        scrollView.addSubview(alignmentTitleLabel)
        scrollView.addSubview(alignmentControl)
        scrollView.addSubview(runAlignmentTitleLabel)
        scrollView.addSubview(runAlignmentControl)
        scrollView.addSubview(spacingTitleLabel)
        scrollView.addSubview(spacingControl)
        scrollView.addSubview(runSpacingTitleLabel)
        scrollView.addSubview(runSpacingControl)
        scrollView.addSubview(wrapView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let inset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        scrollView.frame = view.bounds

        let contentWidth = scrollView.bounds.width - inset.left - inset.right
        let titleHeight: CGFloat = 18
        let controlHeight: CGFloat = 32
        var y = inset.top

        // tip 两行说明稍高一些
        tipLabel.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: 56)
        y = tipLabel.frame.maxY + 12

        directionTitleLabel.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: titleHeight)
        y = directionTitleLabel.frame.maxY + 4
        directionControl.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: controlHeight)
        y = directionControl.frame.maxY + 12

        alignmentTitleLabel.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: titleHeight)
        y = alignmentTitleLabel.frame.maxY + 4
        alignmentControl.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: controlHeight)
        y = alignmentControl.frame.maxY + 12

        runAlignmentTitleLabel.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: titleHeight)
        y = runAlignmentTitleLabel.frame.maxY + 4
        runAlignmentControl.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: controlHeight)
        y = runAlignmentControl.frame.maxY + 12

        spacingTitleLabel.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: titleHeight)
        y = spacingTitleLabel.frame.maxY + 4
        spacingControl.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: controlHeight)
        y = spacingControl.frame.maxY + 12

        runSpacingTitleLabel.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: titleHeight)
        y = runSpacingTitleLabel.frame.maxY + 4
        runSpacingControl.frame = CGRect(x: inset.left, y: y, width: contentWidth, height: controlHeight)
        y = runSpacingControl.frame.maxY + 16

        // 交叉轴额外留白：否则内容撑满容器时 runAlignment 无可见效果（与 Flutter 一致）
        let crossAxisExtra: CGFloat = 140
        let wrapSize: CGSize
        switch wrapView.direction {
        case .horizontal:
            wrapView.preferredMaxLayoutWidth = contentWidth
            wrapSize = wrapView.contentSize(mainAxisLimit: contentWidth)
            wrapView.frame = CGRect(
                x: inset.left,
                y: y,
                width: contentWidth,
                height: wrapSize.height + crossAxisExtra
            )
        case .vertical:
            let wrapHeight: CGFloat = 360
            wrapView.preferredMaxLayoutHeight = wrapHeight
            wrapSize = wrapView.contentSize(mainAxisLimit: wrapHeight)
            wrapView.frame = CGRect(
                x: inset.left,
                y: y,
                width: wrapSize.width + crossAxisExtra,
                height: wrapHeight
            )
        }

        scrollView.contentSize = CGSize(
            width: scrollView.bounds.width,
            height: wrapView.frame.maxY + inset.bottom
        )
    }

    // MARK: - Actions
    @objc private func onDirectionChanged(_ sender: UISegmentedControl) {
        wrapView.direction = sender.selectedSegmentIndex == 0 ? .horizontal : .vertical
        view.setNeedsLayout()
    }
    
    @objc private func onAlignmentChanged(_ sender: UISegmentedControl) {
        let map: [NNMainAxisAlignment] = [.start, .center, .end, .spaceBetween, .spaceAround, .spaceEvenly]
        wrapView.alignment = map[sender.selectedSegmentIndex]
        view.setNeedsLayout()
    }

    @objc private func onRunAlignmentChanged(_ sender: UISegmentedControl) {
        let map: [NNMainAxisAlignment] = [.start, .center, .end, .spaceBetween, .spaceAround, .spaceEvenly]
        wrapView.runAlignment = map[sender.selectedSegmentIndex]
        wrapView.setNeedsLayout()
        view.setNeedsLayout()
    }

    @objc private func onSpacingChanged(_ sender: UISegmentedControl) {
        wrapView.spacing = spacingValues[sender.selectedSegmentIndex]
        wrapView.setNeedsLayout()
        view.setNeedsLayout()
    }

    @objc private func onRunSpacingChanged(_ sender: UISegmentedControl) {
        wrapView.runSpacing = spacingValues[sender.selectedSegmentIndex]
        wrapView.setNeedsLayout()
        view.setNeedsLayout()
    }

    // MARK: - Helpers

    private func makeParamTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .label
        return label
    }

    private func makeColorItems(count: Int) -> [UIView] {
        let palette: [UIColor] = [
            .systemRed, .systemOrange, .systemYellow, .systemGreen,
            .systemTeal, .systemBlue, .systemIndigo, .systemPurple,
            .systemPink, .systemBrown, .systemGray, .systemCyan,
            .systemMint, .systemRed.withAlphaComponent(0.7),
            .systemBlue.withAlphaComponent(0.7), .systemGreen.withAlphaComponent(0.7),
            .systemOrange.withAlphaComponent(0.7), .systemPurple.withAlphaComponent(0.7),
            .systemTeal.withAlphaComponent(0.7), .systemIndigo.withAlphaComponent(0.7),
        ]

        // 文案长短不一，便于验证内容自适应宽高
        let titles = [
            "1", "22", "Wrap", "Swift", "Flutter",
            "自适应", "NNWrapView", "Hello", "iOS 18", "Chip",
            "对齐", "spacing", "runSpacing", "Tag", "Demo",
            "长文本示例", "A", "AB", "内容尺寸", "OK",
        ]

        return (0..<count).map { index in
            let chip = WrapDemoChipView()
            chip.text = titles[index % titles.count]
            chip.fillColor = palette[index % palette.count]
            chip.borderColor = .systemBlue
            return chip
        }
    }
}

/// 按文字内容自适应尺寸的彩色 Chip（供 Wrap 测量）
private final class WrapDemoChipView: UIView {

    var text: String = "" {
        didSet { label.text = text; invalidateIntrinsicContentSize() }
    }

    var fillColor: UIColor = .systemBlue {
        didSet { backgroundColor = fillColor }
    }

    var borderColor: UIColor = .systemBlue {
        didSet { layer.borderColor = borderColor.cgColor }
    }

    private let contentInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

    private lazy var label: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 15)
        view.numberOfLines = 1
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = fillColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = borderColor.cgColor
        addSubview(label)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        let textSize = label.sizeThatFits(CGSize(
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        ))
        return CGSize(
            width: ceil(textSize.width) + contentInset.left + contentInset.right,
            height: ceil(textSize.height) + contentInset.top + contentInset.bottom
        )
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let maxTextWidth = max(0, size.width - contentInset.left - contentInset.right)
        let textSize = label.sizeThatFits(CGSize(
            width: maxTextWidth > 0 ? maxTextWidth : CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        ))
        return CGSize(
            width: ceil(textSize.width) + contentInset.left + contentInset.right,
            height: ceil(textSize.height) + contentInset.top + contentInset.bottom
        )
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds.inset(by: contentInset)
    }
}
