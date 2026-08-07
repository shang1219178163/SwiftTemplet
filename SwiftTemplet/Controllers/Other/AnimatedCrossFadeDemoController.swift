//
//  AnimatedCrossFadeDemoController.swift
//  SwiftTemplet
//
//  Flutter AnimatedCrossFade 对齐组件演示。
//

import UIKit
import SwiftExpand

class AnimatedCrossFadeDemoController: UIViewController {

    /// firstChild 基准尺寸；secondChild = 1.5 倍
    private let firstPanelSize = CGSize(width: 100, height: 100)
    private var secondPanelSize: CGSize {
        CGSize(width: firstPanelSize.width * 1.5, height: firstPanelSize.height * 1.5)
    }

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.alwaysBounceVertical = true
        return view
    }()

    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "NNAnimatedCrossFadeView · 对齐 Flutter AnimatedCrossFade\nsecondChild = firstChild × 1.5 · alignment 控制尺寸动画锚点"
        return label
    }()

    private lazy var stateTitleLabel: UILabel = makeParamTitleLabel("crossFadeState")
    private lazy var alignmentTitleLabel: UILabel = makeParamTitleLabel("alignment（动画锚点）")
    private lazy var curveTitleLabel: UILabel = makeParamTitleLabel("sizeCurve")
    private lazy var durationTitleLabel: UILabel = makeParamTitleLabel("duration")

    /// 与分段选项一一对应
    private let alignmentOptions: [NNAlignment] = [
        .topCenter, .center, .bottomCenter, .centerLeft, .centerRight
    ]

    private lazy var stateControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["showFirst", "showSecond"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onStateChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var alignmentControl: UISegmentedControl = {
        // Flutter 默认 topCenter；另提供常用锚点便于对比
        let control = UISegmentedControl(items: ["topCenter", "center", "bottomCenter", "centerLeft", "centerRight"])
        control.selectedSegmentIndex = 1 // center
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

        view.addSubview(scrollView)
        [tipLabel, stateTitleLabel, stateControl,
         alignmentTitleLabel, alignmentControl,
         curveTitleLabel, curveControl,
         durationTitleLabel, durationControl,
         toggleButton, statusLabel, crossFadeView].forEach {
            scrollView.addSubview($0)
        }
        

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let inset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        scrollView.frame = view.bounds
        let width = scrollView.bounds.width - inset.left - inset.right
        let titleH: CGFloat = 18
        let controlH: CGFloat = 32
        var y = inset.top

        tipLabel.frame = CGRect(x: inset.left, y: y, width: width, height: 44)
        y = tipLabel.frame.maxY + 12

        stateTitleLabel.frame = CGRect(x: inset.left, y: y, width: width, height: titleH)
        y = stateTitleLabel.frame.maxY + 4
        stateControl.frame = CGRect(x: inset.left, y: y, width: width, height: controlH)
        y = stateControl.frame.maxY + 12

        alignmentTitleLabel.frame = CGRect(x: inset.left, y: y, width: width, height: titleH)
        y = alignmentTitleLabel.frame.maxY + 4
        alignmentControl.frame = CGRect(x: inset.left, y: y, width: width, height: controlH)
        y = alignmentControl.frame.maxY + 12

        curveTitleLabel.frame = CGRect(x: inset.left, y: y, width: width, height: titleH)
        y = curveTitleLabel.frame.maxY + 4
        curveControl.frame = CGRect(x: inset.left, y: y, width: width, height: controlH)
        y = curveControl.frame.maxY + 12

        durationTitleLabel.frame = CGRect(x: inset.left, y: y, width: width, height: titleH)
        y = durationTitleLabel.frame.maxY + 4
        durationControl.frame = CGRect(x: inset.left, y: y, width: width, height: controlH)
        y = durationControl.frame.maxY + 16

        toggleButton.frame = CGRect(x: inset.left, y: y, width: width, height: 44)
        y = toggleButton.frame.maxY + 8

        statusLabel.frame = CGRect(x: inset.left, y: y, width: width, height: 20)
        y = statusLabel.frame.maxY + 16

        // 预留 secondChild 大小的槽位；按 alignment 锚点放置，切换时相对该锚点缩放
        let slotSize = secondPanelSize
        let slotFrame = CGRect(
            x: inset.left + (width - slotSize.width) / 2,
            y: y,
            width: slotSize.width,
            height: slotSize.height
        )
        let fadeSize = crossFadeView.sizeThatFits(CGSize(
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude
        ))
        let originInSlot = crossFadeView.alignment.origin(childSize: fadeSize, in: slotSize)
        crossFadeView.frame = CGRect(
            x: slotFrame.minX + originInSlot.x,
            y: slotFrame.minY + originInSlot.y,
            width: fadeSize.width,
            height: fadeSize.height
        )

        scrollView.contentSize = CGSize(
            width: scrollView.bounds.width,
            height: slotFrame.maxY + inset.bottom + 40
        )
    }

    // MARK: Actions

    @objc private func onStateChanged(_ sender: UISegmentedControl) {
        crossFadeView.crossFadeState = sender.selectedSegmentIndex == 0 ? .showFirst : .showSecond
        statusLabel.text = "animating → \(stateText)"
        view.setNeedsLayout()
    }

    @objc private func onAlignmentChanged(_ sender: UISegmentedControl) {
        let index = min(max(sender.selectedSegmentIndex, 0), alignmentOptions.count - 1)
        crossFadeView.alignment = alignmentOptions[index]
        crossFadeView.setNeedsLayout()
        view.setNeedsLayout()
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
        view.setNeedsLayout()
    }

    // MARK: Helpers

    private func makeParamTitleLabel(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.textColor = .label
        return label
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
        titleLabel.frame = CGRect(x: 8, y: size.height / 2 - 22, width: size.width - 16, height: 22)
        subLabel.frame = CGRect(x: 8, y: size.height / 2 + 2, width: size.width - 16, height: 20)
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
