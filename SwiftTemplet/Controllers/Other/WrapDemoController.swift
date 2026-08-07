//
//  WrapDemoController.swift
//  SwiftTemplet
//
//  Flutter Wrap 对齐组件演示：20 个彩色子项自动换行（SnapKit）。
//

import UIKit
import SnapKit
import SwiftExpand

class WrapDemoController: UIViewController {

    private let itemCount = 20
    private let spacingValues: [CGFloat] = [8, 16, 24]
    private let crossAxisExtra: CGFloat = 140
    private let verticalWrapHeight: CGFloat = 360
    private let contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        view.keyboardDismissMode = .onDrag
        return view
    }()

    private lazy var contentView = UIView()

    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "NNWrapView · SnapKit\nspacing / runSpacing 可调 · 内容自适应\nrunAlignment 作用在交叉轴剩余空间（灰底区域内）"
        return label
    }()

    private lazy var controlsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeLabeledControl(title: directionTitleLabel, control: directionControl),
            makeLabeledControl(title: alignmentTitleLabel, control: alignmentControl),
            makeLabeledControl(title: runAlignmentTitleLabel, control: runAlignmentControl),
            makeLabeledControl(title: spacingTitleLabel, control: spacingControl),
            makeLabeledControl(title: runSpacingTitleLabel, control: runSpacingControl),
        ])
        stack.axis = .vertical
        stack.spacing = 12
        return stack
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
        view.setContentHuggingPriority(.required, for: .vertical)
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }()

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

    private var lastContentWidth: CGFloat = 0
    private var needsWrapSizeRefresh = true

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        if title?.isEmpty != false {
            title = "WrapDemo"
        }
        setupHierarchy()
        setupConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let width = contentView.bounds.width - contentInset.left - contentInset.right
        guard width > 0, abs(width - lastContentWidth) > 0.5 || needsWrapSizeRefresh else { return }
        lastContentWidth = width
        needsWrapSizeRefresh = false
        updateWrapSizeConstraints(contentWidth: width)
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tipLabel)
        contentView.addSubview(controlsStack)
        contentView.addSubview(wrapView)
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.width.equalTo(scrollView.frameLayoutGuide)
        }

        tipLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(contentInset.top)
            make.leading.trailing.equalToSuperview().inset(contentInset.left)
        }

        controlsStack.snp.makeConstraints { make in
            make.top.equalTo(tipLabel.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(contentInset.left)
        }

        wrapView.snp.makeConstraints { make in
            make.top.equalTo(controlsStack.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(contentInset.left)
            make.trailing.equalToSuperview().inset(contentInset.right)
            make.height.equalTo(200)
            make.bottom.equalToSuperview().inset(contentInset.bottom)
        }
    }

    private func updateWrapSizeConstraints(contentWidth: CGFloat) {
        switch wrapView.direction {
        case .horizontal:
            wrapView.preferredMaxLayoutWidth = contentWidth
            wrapView.preferredMaxLayoutHeight = 0
            let contentHeight = wrapView.contentSize(mainAxisLimit: contentWidth).height
            wrapView.snp.remakeConstraints { make in
                make.top.equalTo(controlsStack.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview().inset(contentInset.left)
                make.height.equalTo(contentHeight + crossAxisExtra)
                make.bottom.equalToSuperview().inset(contentInset.bottom)
            }
        case .vertical:
            wrapView.preferredMaxLayoutWidth = 0
            wrapView.preferredMaxLayoutHeight = verticalWrapHeight
            let contentWidthNeeded = wrapView.contentSize(mainAxisLimit: verticalWrapHeight).width
            wrapView.snp.remakeConstraints { make in
                make.top.equalTo(controlsStack.snp.bottom).offset(16)
                make.leading.equalToSuperview().inset(contentInset.left)
                make.width.equalTo(contentWidthNeeded + crossAxisExtra)
                make.height.equalTo(verticalWrapHeight)
                make.bottom.equalToSuperview().inset(contentInset.bottom)
            }
        }
        wrapView.reload()
    }

    private func refreshWrapLayout() {
        needsWrapSizeRefresh = true
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }

    // MARK: - Actions

    @objc private func onDirectionChanged(_ sender: UISegmentedControl) {
        wrapView.direction = sender.selectedSegmentIndex == 0 ? .horizontal : .vertical
        refreshWrapLayout()
    }

    @objc private func onAlignmentChanged(_ sender: UISegmentedControl) {
        let map: [NNMainAxisAlignment] = [.start, .center, .end, .spaceBetween, .spaceAround, .spaceEvenly]
        wrapView.alignment = map[sender.selectedSegmentIndex]
        wrapView.reload()
    }

    @objc private func onRunAlignmentChanged(_ sender: UISegmentedControl) {
        let map: [NNMainAxisAlignment] = [.start, .center, .end, .spaceBetween, .spaceAround, .spaceEvenly]
        wrapView.runAlignment = map[sender.selectedSegmentIndex]
        wrapView.reload()
    }

    @objc private func onSpacingChanged(_ sender: UISegmentedControl) {
        wrapView.spacing = spacingValues[sender.selectedSegmentIndex]
        refreshWrapLayout()
    }

    @objc private func onRunSpacingChanged(_ sender: UISegmentedControl) {
        wrapView.runSpacing = spacingValues[sender.selectedSegmentIndex]
        refreshWrapLayout()
    }

    // MARK: - Helpers

    private func makeParamTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .label
        return label
    }

    private func makeLabeledControl(title: UILabel, control: UIControl) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: [title, control])
        stack.axis = .vertical
        stack.spacing = 4
        control.snp.makeConstraints { make in
            make.height.equalTo(32)
        }
        return stack
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
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(contentInset)
        }
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
}
