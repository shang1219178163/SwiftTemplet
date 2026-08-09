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
    private let spacingValues: [CGFloat] = [0, 3, 8, 16]
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
        direction 控制主图相对文字方位；imageSize 控制主图尺寸（0=自适应）；iconLocation 控制角标角落。
        点按演示按钮切换 selected；角标按钮可单独响应。
        """
        return label
    }()

    private lazy var controlsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeLabeledControl(title: directionTitleLabel, control: directionControl),
            makeLabeledControl(title: imageSizeTitleLabel, control: imageSizeControl),
            makeLabeledControl(title: iconLocationTitleLabel, control: iconLocationControl),
            makeLabeledControl(title: spacingTitleLabel, control: spacingControl),
            makeLabeledControl(title: labelHeightTitleLabel, control: labelHeightControl),
            makeLabeledControl(title: eventInsetTitleLabel, control: eventInsetControl),
        ])
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()

    private lazy var directionTitleLabel: UILabel = makeParamTitleLabel("direction")
    private lazy var imageSizeTitleLabel: UILabel = makeParamTitleLabel("imageSize")
    private lazy var iconLocationTitleLabel: UILabel = makeParamTitleLabel("iconLocation")
    private lazy var spacingTitleLabel: UILabel = makeParamTitleLabel("spacing")
    private lazy var labelHeightTitleLabel: UILabel = makeParamTitleLabel("labelHeight")
    private lazy var eventInsetTitleLabel: UILabel = makeParamTitleLabel("eventInset")

    private lazy var directionControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["left", "top", "bottom", "right", "none"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(onControlChanged(_:)), for: .valueChanged)
        return control
    }()

    private lazy var iconLocationControl: UISegmentedControl = {
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
        let sender = makeButton(title: "浪迹天涯", direction: .left, iconLocation: .rightTop)
        sender.iconSize = CGSize(width: 20, height: 20)
        sender.iconBtn.setBackgroundImage(UIImage(named: "icon_delete"), for: .normal)
        sender.iconBtn.addTarget(self, action: #selector(onBadgeTapped(_:)), for: .touchUpInside)
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
            make.width.equalTo(140)
            make.height.equalTo(sampleHeight(for: .left))
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
        demoButton.iconLocation = locations[iconLocationControl.selectedSegmentIndex]
        let side = imageSizeValues[imageSizeControl.selectedSegmentIndex]
        demoButton.imageSize = side > 0 ? CGSize(width: side, height: side) : .zero
        demoButton.spacing = spacingValues[spacingControl.selectedSegmentIndex]
        demoButton.labelHeight = labelHeightValues[labelHeightControl.selectedSegmentIndex]
        demoButton.eventInset = eventInsetValues[eventInsetControl.selectedSegmentIndex]

        let showBadge = demoButton.iconLocation != .none
        if showBadge {
            demoButton.iconBtn.setBackgroundImage(UIImage(named: "icon_delete"), for: .normal)
            demoButton.iconSize = CGSize(width: 20, height: 20)
            // 正值表示沿该角向外偏移（各角落一致）
            demoButton.iconOffset = UIOffset(horizontal: 8, vertical: 8)
        } else {
            demoButton.iconBtn.setBackgroundImage(nil, for: .normal)
            demoButton.iconBtn.setTitle(nil, for: .normal)
            demoButton.iconOffset = .zero
        }

        demoButton.snp.updateConstraints { make in
            make.height.equalTo(sampleHeight(for: demoButton.direction))
        }
        demoButton.setNeedsLayout()
        demoButton.layoutIfNeeded()
    }

    private func sampleHeight(for direction: UIView.Direction) -> CGFloat {
        switch direction {
        case .top, .bottom:
            return 70
        case .none:
            return 64
        default:
            return 36
        }
    }

    private func makeButton(
        title: String,
        direction: UIView.Direction,
        iconLocation: UIView.Location
    ) -> NNButton {
        let sender = NNButton(type: .custom)
        sender.setTitle(title, for: .normal)
        sender.setImage(normalImage, for: .normal)
        sender.setImage(selectedImage, for: .selected)
        sender.setBorderColor(.lightGray, for: .normal)
        sender.setBorderColor(.systemBlue, for: .selected)
        sender.setCornerRadius(4, for: .normal)
        sender.direction = direction
        sender.iconLocation = iconLocation
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
