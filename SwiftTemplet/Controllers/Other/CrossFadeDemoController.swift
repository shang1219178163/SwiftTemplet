//
//  CrossFadeDemoController.swift
//  SwiftTemplet
//
//  Flutter NCrossFade 对齐组件演示（基于 NNCrossFadeView）。
//

import UIKit
import SnapKit
import SwiftExpand

class CrossFadeDemoController: UIViewController {

    private let tipText = """
    NNCrossFadeView · 对齐 Flutter NCrossFade
    firstChild / secondChild 构建闭包内调用 onToggle 切换。
    收起时 tip 最多两行，点按展开可查看全部说明；再点按收起。
    下方彩色面板演示尺寸交叉淡入淡出，也可通过按钮或外部 toggle() 切换。
    """

    private lazy var tipCrossFadeView: NNCrossFadeView = {
        let text = tipText
        let view = NNCrossFadeView(
            firstChild: { onToggle in
                ExpandPanelView(
                    text: text,
                    numberOfLines: 2,
                    actionTitle: "展开",
                    onToggle: onToggle
                )
            },
            secondChild: { onToggle in
                ExpandPanelView(
                    text: text,
                    numberOfLines: 0,
                    actionTitle: "收起",
                    onToggle: onToggle
                )
            },
            alignment: .topCenter,
            isFirst: true,
            duration: 0.35
        )
        view.onChanged = { [weak self] _ in
            self?.updateStatusLabel()
        }
        return view
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "tip: 收起(最多两行) · panel isFirst: true"
        return label
    }()

    private lazy var toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("面板外部 toggle()", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(onExternalToggle), for: .touchUpInside)
        return button
    }()

    private lazy var panelCrossFadeView: NNCrossFadeView = {
        let view = NNCrossFadeView(
            firstChild: { onToggle in
                CrossFadeDemoController.makePanel(
                    title: "firstChild",
                    subtitle: "100 × 200 · 点我切换",
                    color: .systemYellow,
                    size: CGSize(width: 100, height: 200),
                    onToggle: onToggle
                )
            },
            secondChild: { onToggle in
                CrossFadeDemoController.makePanel(
                    title: "secondChild",
                    subtitle: "200 × 100 · 点我切换",
                    color: .systemGreen,
                    size: CGSize(width: 200, height: 100),
                    onToggle: onToggle
                )
            },
            alignment: .center,
            isFirst: true,
            duration: 0.35
        )
        view.onChanged = { [weak self] _ in
            self?.updateStatusLabel()
        }
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 12
        return view
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        if title?.isEmpty != false {
            title = "NNCrossFade"
        }

        view.addSubview(tipCrossFadeView)
        view.addSubview(toggleButton)
        view.addSubview(statusLabel)
        view.addSubview(panelCrossFadeView)

        tipCrossFadeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        toggleButton.snp.makeConstraints { make in
            make.top.equalTo(tipCrossFadeView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(toggleButton.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        panelCrossFadeView.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
        }
        updateStatusLabel()
    }

    // MARK: Actions

    @objc private func onExternalToggle() {
        panelCrossFadeView.toggle()
    }

    private func updateStatusLabel() {
        let tipState = tipCrossFadeView.isFirst ? "收起(最多两行)" : "展开(全部)"
        statusLabel.text = "tip: \(tipState) · panel isFirst: \(panelCrossFadeView.isFirst)"
    }

    // MARK: Helpers

    fileprivate static func makePanel(
        title: String,
        subtitle: String,
        color: UIColor,
        size: CGSize,
        onToggle: @escaping () -> Void
    ) -> UIView {
        FixedSizeTogglePanel(
            fixedSize: size,
            title: title,
            subtitle: subtitle,
            color: color,
            onToggle: onToggle
        )
    }
}

// MARK: - ExpandPanelView (collapsed N lines / expanded all)

/// 可点按展开/收起的文案视图。
/// 使用 frame 布局，避免被 `NNAnimatedCrossFadeView` 改写 frame + TAMIC 时与内部约束冲突。
private final class ExpandPanelView: UIView, UIGestureRecognizerDelegate {

    private let label = UILabel()
    private let actionButton = CallbackButton(frame: .zero)
    private let onToggle: () -> Void
    private let actionSpacing: CGFloat = 4

    init(
        text: String,
        numberOfLines: Int,
        actionTitle: String,
        onToggle: @escaping () -> Void
    ) {
        self.onToggle = onToggle
        super.init(frame: .zero)

        // 父级用 frame 布局本视图；内部也用 frame，避免 height==0 时与 SnapKit 竖向链冲突
        translatesAutoresizingMaskIntoConstraints = true
        label.translatesAutoresizingMaskIntoConstraints = true
        actionButton.translatesAutoresizingMaskIntoConstraints = true

        label.text = text
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = numberOfLines

        actionButton.setTitle(actionTitle, for: .normal)
        actionButton.titleLabel?.font = .systemFont(ofSize: 13, weight: .medium)
        actionButton.onTap = onToggle

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        addGestureRecognizer(tap)
        isUserInteractionEnabled = true

        addSubview(label)
        addSubview(actionButton)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = max(bounds.width, 0)
        guard width > 0 else {
            label.frame = .zero
            actionButton.frame = .zero
            return
        }

        label.preferredMaxLayoutWidth = width
        let labelSize = label.sizeThatFits(CGSize(
            width: width,
            height: CGFloat.greatestFiniteMagnitude
        ))
        label.frame = CGRect(x: 0, y: 0, width: width, height: ceil(labelSize.height))

        let buttonSize = actionButton.sizeThatFits(CGSize(
            width: width,
            height: CGFloat.greatestFiniteMagnitude
        ))
        let buttonWidth = ceil(buttonSize.width)
        let buttonHeight = ceil(buttonSize.height)
        actionButton.frame = CGRect(
            x: width - buttonWidth,
            y: label.frame.maxY + actionSpacing,
            width: buttonWidth,
            height: buttonHeight
        )
    }

    /// 收起动画时容器可能高于内容；只响应文案+按钮区域，避免点到下方空白误触发 toggle。
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        label.frame.contains(point) || actionButton.frame.contains(point)
    }

    override var intrinsicContentSize: CGSize {
        let fitted = sizeThatFits(CGSize(
            width: preferredMaxLayoutWidthForMeasure(),
            height: CGFloat.greatestFiniteMagnitude
        ))
        return CGSize(width: UIView.noIntrinsicMetric, height: fitted.height)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        // 拒绝 infinite / 异常大宽度，否则多行文案会被压成单行
        let width: CGFloat
        if size.width.isFinite, size.width > 1, size.width < 10_000 {
            width = size.width
        } else {
            width = preferredMaxLayoutWidthForMeasure()
        }
        label.preferredMaxLayoutWidth = width
        let labelSize = label.sizeThatFits(CGSize(
            width: width,
            height: CGFloat.greatestFiniteMagnitude
        ))
        let buttonSize = actionButton.sizeThatFits(CGSize(
            width: width,
            height: CGFloat.greatestFiniteMagnitude
        ))
        return CGSize(
            width: width,
            height: ceil(labelSize.height) + actionSpacing + ceil(buttonSize.height)
        )
    }

    private func preferredMaxLayoutWidthForMeasure() -> CGFloat {
        if bounds.width > 1 { return bounds.width }
        if label.preferredMaxLayoutWidth > 1 { return label.preferredMaxLayoutWidth }
        return UIScreen.main.bounds.width - 32
    }

    @objc private func handleTap() {
        onToggle()
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        // 点击 UIControl（展开/收起按钮）时不响应容器手势，防止 toggle 两次
        if touch.view is UIControl { return false }
        var view = touch.view
        while let current = view {
            if current is UIControl { return false }
            if current === self { break }
            view = current.superview
        }
        return true
    }
}

/// 固定尺寸面板：内部用 frame 布局，避免被 cross-fade 改写 frame 后与 SnapKit 冲突。
private final class FixedSizeTogglePanel: UIView, UIGestureRecognizerDelegate {
    private let fixedSize: CGSize
    private let titleLabel = UILabel()
    private let subLabel = UILabel()
    private let button = CallbackButton(frame: .zero)
    private let onToggle: () -> Void

    init(
        fixedSize: CGSize,
        title: String,
        subtitle: String,
        color: UIColor,
        onToggle: @escaping () -> Void
    ) {
        self.fixedSize = fixedSize
        self.onToggle = onToggle
        super.init(frame: CGRect(origin: .zero, size: fixedSize))

        translatesAutoresizingMaskIntoConstraints = true
        backgroundColor = color
        layer.cornerRadius = 12
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemBlue.cgColor
        isUserInteractionEnabled = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = true
        titleLabel.text = title
        titleLabel.textColor = .darkText
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center

        subLabel.translatesAutoresizingMaskIntoConstraints = true
        subLabel.text = subtitle
        subLabel.textColor = UIColor.darkText.withAlphaComponent(0.75)
        subLabel.font = .systemFont(ofSize: 12)
        subLabel.textAlignment = .center
        subLabel.numberOfLines = 0

        button.translatesAutoresizingMaskIntoConstraints = true
        button.setTitle("onToggle", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.85)
        button.layer.cornerRadius = 8
        button.onTap = onToggle

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        addGestureRecognizer(tap)

        addSubview(titleLabel)
        addSubview(subLabel)
        addSubview(button)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize { fixedSize }

    override func sizeThatFits(_ size: CGSize) -> CGSize { fixedSize }

    override func layoutSubviews() {
        super.layoutSubviews()
        let w = bounds.width
        let h = bounds.height
        titleLabel.frame = CGRect(x: 8, y: 16, width: max(0, w - 16), height: 22)
        subLabel.frame = CGRect(x: 8, y: titleLabel.frame.maxY + 6, width: max(0, w - 16), height: 36)
        let buttonWidth: CGFloat = 88
        let buttonHeight: CGFloat = 36
        button.frame = CGRect(
            x: (w - buttonWidth) / 2,
            y: h - 16 - buttonHeight,
            width: buttonWidth,
            height: buttonHeight
        )
    }

    @objc private func handleTap() {
        onToggle()
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view is UIControl { return false }
        var view = touch.view
        while let current = view {
            if current is UIControl { return false }
            if current === self { break }
            view = current.superview
        }
        return true
    }
}

private final class CallbackButton: UIButton {
    var onTap: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func handleTap() {
        onTap?()
    }
}
