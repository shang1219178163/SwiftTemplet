//
//  AnimatedCrossFadeDemoController.swift
//  SwiftTemplet
//
//  Flutter AnimatedCrossFade 对齐组件演示（SnapKit）。
//

import UIKit
import SnapKit
import SwiftExpand

class AnimatedCrossFadeDemoController: UIViewController {

    /// firstChild 基准尺寸；secondChild = 1.5 倍
    private let firstPanelSize = CGSize(width: 100, height: 100)
    private var secondPanelSize: CGSize {
        CGSize(width: firstPanelSize.width * 1.5, height: firstPanelSize.height * 1.5)
    }

    private let contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        return view
    }()

    private lazy var contentView = UIView()

    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "NNAnimatedCrossFadeView · SnapKit\nsecondChild = firstChild × 1.5 · alignment 控制尺寸动画锚点"
        return label
    }()

    private lazy var stateTitleLabel: UILabel = makeParamTitleLabel("crossFadeState")
    private lazy var alignmentTitleLabel: UILabel = makeParamTitleLabel("alignment（动画锚点）")
    private lazy var curveTitleLabel: UILabel = makeParamTitleLabel("sizeCurve")
    private lazy var durationTitleLabel: UILabel = makeParamTitleLabel("duration")

    private let alignmentOptions: [NNAlignment] = NNAlignment.allCases

    private lazy var stateControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["showFirst", "showSecond"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onStateChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var alignmentControl: UISegmentedControl = {
        let titles = alignmentOptions.map(\.shortName)
        let control = UISegmentedControl(items: titles)
        control.selectedSegmentIndex = alignmentOptions.firstIndex(of: .center) ?? 0
        control.addTarget(self, action: #selector(onAlignmentChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var curveControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["linear", "easeInOut", "bounceOut"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onCurveChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var durationControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["0.3s", "0.8s", "1.5s"])
        control.selectedSegmentIndex = 1
        control.addTarget(self, action: #selector(onDurationChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var controlsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeLabeledControl(title: stateTitleLabel, control: stateControl),
            makeLabeledControl(title: alignmentTitleLabel, control: alignmentControl),
            makeLabeledControl(title: curveTitleLabel, control: curveControl),
            makeLabeledControl(title: durationTitleLabel, control: durationControl),
        ])
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()

    private lazy var toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Toggle crossFadeState", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(onToggle), for: .touchUpInside)
        return button
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.text = "state: showFirst"
        return label
    }()

    /// 固定槽位：容纳 secondChild 最大尺寸，crossFade 在其内按 alignment 锚定
    private lazy var slotView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray5
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var firstChild: UIView = {
        let size = firstPanelSize
        return makePanel(
            title: "firstChild",
            subtitle: "\(Int(size.width)) × \(Int(size.height))",
            color: .systemOrange,
            size: size
        )
    }()

    private lazy var secondChild: UIView = {
        let size = secondPanelSize
        return makePanel(
            title: "secondChild",
            subtitle: "\(Int(size.width)) × \(Int(size.height)) (×1.5)",
            color: .systemTeal,
            size: size
        )
    }()

    private lazy var crossFadeView: NNAnimatedCrossFadeView = {
        let view = NNAnimatedCrossFadeView(
            firstChild: firstChild,
            secondChild: secondChild,
            firstCurve: .linear,
            secondCurve: .linear,
            sizeCurve: .easeInOut,
            alignment: .center,
            crossFadeState: .showFirst,
            duration: 0.8,
            clipBehavior: .hardEdge
        )
        view.backgroundColor = UIColor.systemGray6
        view.layer.cornerRadius = 12
        view.onEnd = { [weak self] completed in
            guard let self else { return }
            self.statusLabel.text = "onEnd(completed: \(completed)) · state: \(self.stateText)"
        }
        return view
    }()

    private var stateText: String {
        crossFadeView.crossFadeState == .showFirst ? "showFirst" : "showSecond"
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        if title?.isEmpty != false {
            title = "AnimatedCrossFade"
        }
        setupHierarchy()
        setupConstraints()
        applyAlignmentConstraints()
    }

    // MARK: Setup

    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [tipLabel, controlsStack, toggleButton, statusLabel, slotView].forEach {
            contentView.addSubview($0)
        }
        slotView.addSubview(crossFadeView)
    }

    private func setupConstraints() {
        let slot = secondPanelSize

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

        toggleButton.snp.makeConstraints { make in
            make.top.equalTo(controlsStack.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(contentInset.left)
            make.height.equalTo(44)
        }

        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(toggleButton.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(contentInset.left)
        }

        slotView.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.size.equalTo(slot)
            make.bottom.equalToSuperview().inset(contentInset.bottom + 24)
        }
    }

    /// 按 `alignment` 将 crossFadeView 锚定在 slot 内（配合组件 Auto Layout 尺寸动画）
    private func applyAlignmentConstraints() {
        let (ax, ay) = crossFadeView.alignment.xy

        crossFadeView.snp.remakeConstraints { make in
            switch ax {
            case ..<(-0.5):
                make.leading.equalToSuperview()
            case ...0.5:
                make.centerX.equalToSuperview()
            default:
                make.trailing.equalToSuperview()
            }

            switch ay {
            case ..<(-0.5):
                make.top.equalToSuperview()
            case ...0.5:
                make.centerY.equalToSuperview()
            default:
                make.bottom.equalToSuperview()
            }
        }
    }

    // MARK: Actions

    @objc private func onStateChanged(_ sender: UISegmentedControl) {
        crossFadeView.crossFadeState = sender.selectedSegmentIndex == 0 ? .showFirst : .showSecond
        statusLabel.text = "animating → \(stateText)"
    }

    @objc private func onAlignmentChanged(_ sender: UISegmentedControl) {
        let index = min(max(sender.selectedSegmentIndex, 0), alignmentOptions.count - 1)
        crossFadeView.alignment = alignmentOptions[index]
        applyAlignmentConstraints()
    }

    @objc private func onCurveChanged(_ sender: UISegmentedControl) {
        let map: [NNCurves] = [.linear, .easeInOut, .bounceOut]
        crossFadeView.sizeCurve = map[sender.selectedSegmentIndex]
        crossFadeView.firstCurve = map[sender.selectedSegmentIndex]
        crossFadeView.secondCurve = map[sender.selectedSegmentIndex]
    }

    @objc private func onDurationChanged(_ sender: UISegmentedControl) {
        let map: [TimeInterval] = [0.3, 0.8, 1.5]
        crossFadeView.duration = map[sender.selectedSegmentIndex]
    }

    @objc private func onToggle() {
        let next: CrossFadeState = crossFadeView.crossFadeState == .showFirst ? .showSecond : .showFirst
        stateControl.selectedSegmentIndex = next == .showFirst ? 0 : 1
        crossFadeView.crossFadeState = next
        statusLabel.text = "animating → \(stateText)"
    }

    // MARK: Helpers

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

    private func makePanel(title: String, subtitle: String, color: UIColor, size: CGSize) -> UIView {
        let panel = FixedSizePanelView(fixedSize: size)
        panel.backgroundColor = color
        panel.layer.cornerRadius = 12
        panel.layer.borderWidth = 2
        panel.layer.borderColor = UIColor.systemBlue.cgColor

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center

        let subLabel = UILabel()
        subLabel.text = subtitle
        subLabel.textColor = UIColor.white.withAlphaComponent(0.9)
        subLabel.font = .systemFont(ofSize: 13)
        subLabel.textAlignment = .center

        panel.addSubview(titleLabel)
        panel.addSubview(subLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-12)
            make.leading.greaterThanOrEqualToSuperview().offset(8)
            make.trailing.lessThanOrEqualToSuperview().offset(-8)
        }
        subLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.greaterThanOrEqualToSuperview().offset(8)
            make.trailing.lessThanOrEqualToSuperview().offset(-8)
        }
        return panel
    }
}

/// 固定理想尺寸的面板，避免 UIView.sizeThatFits 跟随被改写的 bounds
private final class FixedSizePanelView: UIView {
    private let fixedSize: CGSize

    init(fixedSize: CGSize) {
        self.fixedSize = fixedSize
        super.init(frame: CGRect(origin: .zero, size: fixedSize))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize { fixedSize }

    override func sizeThatFits(_ size: CGSize) -> CGSize { fixedSize }
}
