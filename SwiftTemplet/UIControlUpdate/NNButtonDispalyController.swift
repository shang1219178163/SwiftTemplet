//
//  NNButtonDispalyController.swift
//  SwiftTemplet
//
//  NNButton 图文方位 / 角标演示（SnapKit）。
//

import UIKit
import SnapKit
import SwiftExpand

class NNButtonDispalyController: UIViewController {

    private let contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    private let spacingValues: [CGFloat] = [0, 4, 8, 16]
    private let paddingValues: [CGFloat] = [0, 4, 8, 12]
    private let imageSizeValues: [CGFloat] = [0, 16, 20, 28]
    private let labelHeightValues: [CGFloat] = [18, 25, 32]
    private let eventInsetValues: [CGFloat] = [0, 8, 16]

    private lazy var normalImage = UIImage(named: "icon_selected_no_default")!
    private lazy var selectedImage = UIImage(named: "icon_selected_yes_green")!

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
        label.text = """
        NNButton · SnapKit
        尺寸由内容自适应。direction / imageSize / spacing / padding / labelHeight 会改变 intrinsicContentSize。
        badgeLocation 控制角标角落；点按切换 selected，角标可单独响应。
        """
        return label
    }()

    private lazy var controlsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeLabeledControl(title: directionTitleLabel, control: directionControl),
            makeLabeledControl(title: imageSizeTitleLabel, control: imageSizeControl),
            makeLabeledControl(title: badgeLocationTitleLabel, control: badgeLocationControl),
            makeLabeledControl(title: spacingTitleLabel, control: spacingControl),
            makeLabeledControl(title: paddingTitleLabel, control: paddingControl),
            makeLabeledControl(title: labelHeightTitleLabel, control: labelHeightControl),
            makeLabeledControl(title: eventInsetTitleLabel, control: eventInsetControl),
        ])
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()

    private lazy var directionTitleLabel: UILabel = makeParamTitleLabel("direction")
    private lazy var imageSizeTitleLabel: UILabel = makeParamTitleLabel("imageSize")
    private lazy var badgeLocationTitleLabel: UILabel = makeParamTitleLabel("badgeLocation")
    private lazy var spacingTitleLabel: UILabel = makeParamTitleLabel("spacing")
    private lazy var paddingTitleLabel: UILabel = makeParamTitleLabel("padding")
    private lazy var labelHeightTitleLabel: UILabel = makeParamTitleLabel("labelHeight")
    private lazy var eventInsetTitleLabel: UILabel = makeParamTitleLabel("eventInset")

    private lazy var directionControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["left", "top", "bottom", "right", "none"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var badgeLocationControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["none", "LT", "LB", "RT", "RB"])
        control.selectedSegmentIndex = 3
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var imageSizeControl: UISegmentedControl = {
        let control = UISegmentedControl(items: imageSizeValues.map { $0 == 0 ? "auto" : "\(Int($0))" })
        control.selectedSegmentIndex = 2
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var spacingControl: UISegmentedControl = {
        let control = UISegmentedControl(items: spacingValues.map { "\(Int($0))" })
        control.selectedSegmentIndex = 1
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var paddingControl: UISegmentedControl = {
        let control = UISegmentedControl(items: paddingValues.map { "\(Int($0))" })
        control.selectedSegmentIndex = 2
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var labelHeightControl: UISegmentedControl = {
        let control = UISegmentedControl(items: labelHeightValues.map { "\(Int($0))" })
        control.selectedSegmentIndex = 1
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var eventInsetControl: UISegmentedControl = {
        let control = UISegmentedControl(items: eventInsetValues.map { "\(Int($0))" })
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    /// 受控演示按钮：参数面板实时驱动
    private lazy var demoButton: NNButton = {
        let sender = makeButton(title: "浪迹天涯", direction: .left, badgeLocation: .rightTop)
        sender.badgeSize = CGSize(width: 20, height: 20)
        sender.badgeBtn.setBackgroundImage(UIImage(named: "icon_delete"), for: .normal)
        sender.badgeBtn.addTarget(self, action: #selector(onBadgeTapped(_:)), for: .touchUpInside)
        return sender
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "status: —"
        return label
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        if title?.isEmpty != false {
            title = "NNButtonDispaly"
        }
        setupHierarchy()
        setupConstraints()
        applyControlsToDemoButton()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(tipLabel)
        contentView.addSubview(controlsStack)
        contentView.addSubview(demoButton)
        contentView.addSubview(statusLabel)
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

        demoButton.snp.makeConstraints { make in
            make.top.equalTo(controlsStack.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(contentInset.left)
            // 宽高由内容自适应（intrinsicContentSize）
        }

        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(demoButton.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(contentInset.left)
            make.bottom.equalToSuperview().inset(contentInset.bottom)
        }
    }

    // MARK: - Actions

    @objc private func onControlChanged(_ sender: UISegmentedControl) {
        applyControlsToDemoButton()
    }

    @objc private func onDemoTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        let name = (sender as? NNButton).map { "demo(\($0.direction))" } ?? "button"
        statusLabel.text = "status: \(name) selected=\(sender.isSelected)"
    }

    @objc private func onBadgeTapped(_ sender: UIButton) {
        statusLabel.text = "status: badge tapped"
    }

    // MARK: - Private

    private func applyControlsToDemoButton() {
        let directions: [UIView.Direction] = [.left, .top, .bottom, .right, .none]
        let locations: [UIView.Location] = [.none, .leftTop, .leftBottom, .rightTop, .rightBottom]

        demoButton.direction = directions[directionControl.selectedSegmentIndex]
        demoButton.badgeLocation = locations[badgeLocationControl.selectedSegmentIndex]
        let side = imageSizeValues[imageSizeControl.selectedSegmentIndex]
        demoButton.imageSize = side > 0 ? CGSize(width: side, height: side) : .zero
        demoButton.spacing = spacingValues[spacingControl.selectedSegmentIndex]
        let pad = paddingValues[paddingControl.selectedSegmentIndex]
        demoButton.padding = UIEdgeInsets(top: pad, left: pad, bottom: pad, right: pad)
        demoButton.labelHeight = labelHeightValues[labelHeightControl.selectedSegmentIndex]
        demoButton.eventInset = eventInsetValues[eventInsetControl.selectedSegmentIndex]

        let showBadge = demoButton.badgeLocation != .none
        if showBadge {
            demoButton.badgeBtn.setBackgroundImage(UIImage(named: "icon_delete"), for: .normal)
            demoButton.badgeSize = CGSize(width: 20, height: 20)
            // 正值表示沿该角向外偏移（各角落一致）
            demoButton.badgeOffset = UIOffset(horizontal: 8, vertical: 8)
        } else {
            demoButton.badgeBtn.setBackgroundImage(nil, for: .normal)
            demoButton.badgeBtn.setTitle(nil, for: .normal)
            demoButton.badgeOffset = .zero
        }

        demoButton.invalidateIntrinsicContentSize()
        demoButton.setNeedsLayout()
        demoButton.layoutIfNeeded()
    }

    private func makeButton(
        title: String,
        direction: UIView.Direction,
        badgeLocation: UIView.Location
    ) -> NNButton {
        let sender = NNButton(frame: .zero)
        sender.setTitle(title, for: .normal)
        sender.setImage(normalImage, for: .normal)
        sender.setImage(selectedImage, for: .selected)
        sender.setBorderColor(.lightGray, for: .normal)
        sender.setBorderColor(.systemBlue, for: .selected)
        sender.setCornerRadius(4, for: .normal)
        sender.direction = direction
        sender.badgeLocation = badgeLocation
        sender.addTarget(self, action: #selector(onDemoTapped(_:)), for: .touchUpInside)
        return sender
    }

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
}
