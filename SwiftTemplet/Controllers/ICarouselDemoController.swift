//
//  ICarouselDemoController.swift
//  SwiftTemplet
//
//  Created by shang on 2026/8/23.
//  Copyright © 2026 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage
import SnapKit

/// iCarousel 效果展示页：调节组件属性改变展示效果
class ICarouselDemoController: UIViewController {

    // MARK: -属性
    private lazy var imageUrls: [String] = NNResourceManager.shared.imageUrls

    private let sliderTitles = ["类型", "间距", "半径", "倾斜"]
    private let switchTitles = ["环绕", "垂直", "分页", "自动滚动"]

    // MARK: -lazy
    private lazy var carousel: iCarousel = {
        let view = iCarousel()
        view.dataSource = self
        view.delegate = self
        view.type = .coverFlow2
        view.backgroundColor = .black
        return view
    }()

    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkText
        label.numberOfLines = 0
        return label
    }()

    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.rowHeight = 44
        view.dataSource = self
        view.delegate = self
        view.tableFooterView = UIView()
        return view
    }()

    private lazy var typeSlider: UISlider = makeSlider(min: 0, max: CGFloat(iCarouselType.custom.rawValue), value: CGFloat(iCarouselType.coverFlow2.rawValue), action: #selector(onTypeChanged(_:)))

    private lazy var spacingSlider: UISlider = makeSlider(min: 0.1, max: 2.0, value: 0.35, action: #selector(onPropertyChanged(_:)))

    private lazy var radiusSlider: UISlider = makeSlider(min: 50, max: 400, value: 200, action: #selector(onPropertyChanged(_:)))

    private lazy var tiltSlider: UISlider = makeSlider(min: -1.0, max: 1.0, value: 0.9, action: #selector(onPropertyChanged(_:)))

    private lazy var wrapSwitch: UISwitch = {
        let view = UISwitch()
        view.isOn = true
        view.addTarget(self, action: #selector(onSwitchChanged(_:)), for: .valueChanged)
        return view
    }()

    private lazy var verticalSwitch: UISwitch = {
        let view = UISwitch()
        view.isOn = false
        view.addTarget(self, action: #selector(onSwitchChanged(_:)), for: .valueChanged)
        return view
    }()

    private lazy var pagingSwitch: UISwitch = {
        let view = UISwitch()
        view.isOn = false
        view.addTarget(self, action: #selector(onSwitchChanged(_:)), for: .valueChanged)
        return view
    }()

    private lazy var autoscrollSwitch: UISwitch = {
        let view = UISwitch()
        view.isOn = false
        view.addTarget(self, action: #selector(onSwitchChanged(_:)), for: .valueChanged)
        return view
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "iCarousel展示"

        view.addSubview(carousel)
        view.addSubview(infoLabel)
        view.addSubview(tableView)

        setupLayout()
        updateInfo()
    }

    // MARK: -funtions
    private func setupLayout() {
        let margin: CGFloat = 16

        carousel.snp.makeConstraints { make in
            make.top.left.right.equalTo(view)
            make.height.equalTo(kScreenWidth * 0.6)
        }

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(carousel.snp.bottom).offset(margin)
            make.left.right.equalTo(view).inset(margin)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(8)
            make.left.right.bottom.equalTo(view)
        }
    }

    private func makeSlider(min: CGFloat, max: CGFloat, value: CGFloat, action: Selector) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.value = Float(value)
        slider.addTarget(self, action: action, for: .valueChanged)
        return slider
    }

    @objc private func onTypeChanged(_ slider: UISlider) {
        carousel.type = iCarouselType(rawValue: Int(slider.value.rounded())) ?? .linear
        updateInfo()
        tableView.reloadData()
    }

    @objc private func onPropertyChanged(_ slider: UISlider) {
        carousel.reloadData()
        updateInfo()
        tableView.reloadData()
    }

    @objc private func onSwitchChanged(_ sw: UISwitch) {
        if sw == wrapSwitch {
            carousel.reloadData()
        } else if sw == verticalSwitch {
            carousel.isVertical = sw.isOn
        } else if sw == pagingSwitch {
            carousel.isPagingEnabled = sw.isOn
        } else if sw == autoscrollSwitch {
            carousel.autoscroll = sw.isOn ? 0.8 : 0.0
        }
        updateInfo()
        tableView.reloadData()
    }

    private func updateInfo() {
        let typeNames = [
            "Linear", "Rotary", "InvertedRotary", "Cylinder", "InvertedCylinder",
            "Wheel", "InvertedWheel", "CoverFlow", "CoverFlow2", "TimeMachine",
            "InvertedTimeMachine", "Custom",
        ]
        let typeIndex = Int(carousel.type.rawValue)
        let typeName = typeIndex < typeNames.count ? typeNames[typeIndex] : "Unknown"
        infoLabel.text = "type:\(typeName) | idx:\(carousel.currentItemIndex + 1)/\(imageUrls.count)"
    }

    private func sliderValueText(forRow row: Int) -> String {
        switch row {
        case 0: return "\(Int(typeSlider.value.rounded()))"
        case 1: return String(format: "%.2f", spacingSlider.value)
        case 2: return String(format: "%.0f", radiusSlider.value)
        case 3: return String(format: "%.2f", tiltSlider.value)
        default: return ""
        }
    }

    private func setupRow(in cell: UITableViewCell, title: String, control: UIView, valueText: String) {
        let w = view.frame.width

        let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: 64, height: 44))
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .darkText
        cell.contentView.addSubview(titleLabel)

        let controlW = w - 16 - 64 - 12 - 60 - 16
        control.frame = CGRect(x: 16 + 64 + 12, y: (44 - 31) / 2.0, width: controlW, height: 31)
        cell.contentView.addSubview(control)

        let valueLabel = UILabel(frame: CGRect(x: w - 16 - 60, y: 0, width: 60, height: 44))
        valueLabel.text = valueText
        valueLabel.font = UIFont.systemFont(ofSize: 12)
        valueLabel.textColor = .gray
        valueLabel.textAlignment = .right
        cell.contentView.addSubview(valueLabel)
    }
}

// MARK: -iCarouselDataSource, iCarouselDelegate
extension ICarouselDemoController: iCarouselDataSource, iCarouselDelegate {

    func numberOfItems(in carousel: iCarousel) -> Int {
        return imageUrls.count
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var imageView = view as? UIImageView
        if imageView == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenWidth * 0.7, height: kScreenWidth * 0.6))
            imageView?.contentMode = .scaleToFill
            imageView?.backgroundColor = .black
        }
        imageView?.sd_setImage(with: URL(string: imageUrls[index]), placeholderImage: UIImage.img_failedDefault)
        return imageView ?? UIView()
    }

    func carouselItemWidth(_ carousel: iCarousel) -> CGFloat {
        return kScreenWidth * 0.7
    }

    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        switch option {
        case .spacing: return CGFloat(spacingSlider.value)
        case .radius:  return CGFloat(radiusSlider.value)
        case .tilt:    return CGFloat(tiltSlider.value)
        case .wrap:    return wrapSwitch.isOn ? 1.0 : 0.0
        case .showBackfaces: return 1.0
        default: return value
        }
    }

    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        updateInfo()
    }
}

// MARK: -UITableViewDataSource, UITableViewDelegate
extension ICarouselDemoController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Slider" : "Switch"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
            cell?.selectionStyle = .none
        }
        guard let cell = cell else { return UITableViewCell() }
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }

        if indexPath.section == 0 {
            let sliders: [UISlider] = [typeSlider, spacingSlider, radiusSlider, tiltSlider]
            let slider = sliders[indexPath.row]
            setupRow(in: cell, title: sliderTitles[indexPath.row], control: slider, valueText: sliderValueText(forRow: indexPath.row))
        } else {
            let switches: [UISwitch] = [wrapSwitch, verticalSwitch, pagingSwitch, autoscrollSwitch]
            let sw = switches[indexPath.row]
            setupRow(in: cell, title: switchTitles[indexPath.row], control: sw, valueText: sw.isOn ? "ON" : "OFF")
        }
        return cell
    }
}
