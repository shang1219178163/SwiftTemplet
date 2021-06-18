//
//  NumberFormatterExampleController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/3/30.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class NumberFormatterExampleController: UIViewController {
    
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("按钮", for: .normal)

        view.setTitleColor(.red, for: .normal)
        view.setCustomType(.titleAndOutline)
        
        return view
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(btn)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20);
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.height.equalTo(50);
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        testNumberFormatterStyle()
    }
    
    func testNumberFormatterStyle() {
        let fmt = NumberFormatter.number(.none)
        let fmtDecimal = NumberFormatter.number(.decimal)
        let fmtCurrency = NumberFormatter.number(.currency)
        let fmtCurrencyISOCode = NumberFormatter.number(.currencyISOCode)
        let fmtCurrencyPlural = NumberFormatter.number(.currencyPlural)
        let fmtCurrencyAccounting = NumberFormatter.number(.currencyAccounting)
        
        let fmtPercent = NumberFormatter.number(.percent)
        let fmtScientific = NumberFormatter.number(.scientific)
        let fmtSpellOut = NumberFormatter.number(.spellOut)
        let fmtOrdinal = NumberFormatter.number(.ordinal)
        
        let min = 0.6767
        let max = 123456789.6767

        let a = "none_              \(min) -> \(min, fmt: fmt)"
        let b = "decimal_           \(min) -> \(min, fmt: fmtDecimal)"
        
        let c = "currency_          \(min) -> \(min, fmt: fmtCurrency)"
        let d = "currencyISOCode_   \(min) -> \(min, fmt: fmtCurrencyISOCode)"
        let e = "currencyPlural_    \(min) -> \(min, fmt: fmtCurrencyPlural)"
        let f = "currencyAccounting_\(min) -> \(min, fmt: fmtCurrencyAccounting)"
        
        let g = "percent_           \(min) -> \(min, fmt: fmtPercent)"
        let h = "scientific_        \(min) -> \(min, fmt: fmtScientific)"
        let i = "spellOut_          \(min) -> \(min, fmt: fmtSpellOut)"
        let j = "ordinal_           \(min) -> \(min, fmt: fmtOrdinal)"
        
        
        let a1 = "none_              \(max) -> \(max, fmt: fmt)"
        let b1 = "decimal_           \(max) -> \(max, fmt: fmtDecimal)"
        
        let c1 = "currency_          \(max) -> \(max, fmt: fmtCurrency)"
        let d1 = "currencyISOCode_   \(max) -> \(max, fmt: fmtCurrencyISOCode)"
        let e1 = "currencyPlural_    \(max) -> \(max, fmt: fmtCurrencyPlural)"
        let f1 = "currencyAccounting_\(max) -> \(max, fmt: fmtCurrencyAccounting)"
        
        let g1 = "percent_           \(max) -> \(max, fmt: fmtPercent)"
        let h1 = "scientific_        \(max) -> \(max, fmt: fmtScientific)"
        let i1 = "spellOut_          \(max) -> \(max, fmt: fmtSpellOut)"
        let j1 = "ordinal_           \(max) -> \(max, fmt: fmtOrdinal)"

        DDLog(a);
        DDLog(b);
        DDLog(c);
        DDLog(d);
        DDLog(e);
        DDLog(f);
        DDLog(g);
        DDLog(h);
        DDLog(i);
        DDLog(j);
        
        DDLog(a1);
        DDLog(b1);
        DDLog(c1);
        DDLog(d1);
        DDLog(e1);
        DDLog(f1);
        DDLog(g1);
        DDLog(h1);
        DDLog(i1);
        DDLog(j1);
        
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 91]: none_              0.6767 -> 1
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 92]: decimal_           0.6767 -> 0.677
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 93]: currency_          0.6767 -> ¥0.68
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 94]: currencyISOCode_   0.6767 -> CNY 0.68
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 95]: currencyPlural_    0.6767 -> 0.68 人民币
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 96]: currencyAccounting_0.6767 -> ¥0.68
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 97]: percent_           0.6767 -> 68%
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 98]: scientific_        0.6767 -> 6.767E-1
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 99]: spellOut_          0.6767 -> 〇点六七六七
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 100]: ordinal_           0.6767 -> 第1
        
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 102]: none_              123456789.6767 -> 123456790
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 103]: decimal_           123456789.6767 -> 123,456,789.677
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 104]: currency_          123456789.6767 -> ¥123,456,789.68
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 105]: currencyISOCode_   123456789.6767 -> CNY 123,456,789.68
//        2021-03-31 10:53:35.024 testNumberFormatterStyle()[line 106]: currencyPlural_    123456789.6767 -> 123,456,789.68 人民币
//        2021-03-31 10:53:35.025 testNumberFormatterStyle()[line 107]: currencyAccounting_123456789.6767 -> ¥123,456,789.68
//        2021-03-31 10:53:35.025 testNumberFormatterStyle()[line 108]: percent_           123456789.6767 -> 12,345,678,968%
//        2021-03-31 10:53:35.025 testNumberFormatterStyle()[line 109]: scientific_        123456789.6767 -> 1.234567896767E8
//        2021-03-31 10:53:35.025 testNumberFormatterStyle()[line 110]: spellOut_          123456789.6767 -> 一亿二千三百四十五万六千七百八十九点六七六七
//        2021-03-31 10:53:35.025 testNumberFormatterStyle()[line 111]: ordinal_           123456789.6767 -> 第123,456,790
    }
    
    func testNumberFormatter() {
        let fmtCard = NumberFormatter.format(.none,
                                             minFractionDigits: 0,
                                             maxFractionDigits: 0,
                                             positivePrefix:"",
                                             groupingSeparator: " ",
                                             groupingSize: 4)

        let a = "\(fmtCard.numberStyle.rawValue)_\(18729742695, fmt: fmtCard)"
        let b = "\(fmtCard.numberStyle.rawValue)_\(4392260032488908, fmt: fmtCard)"
        let c = "\(fmtCard.numberStyle.rawValue)_\(610431198903080651, fmt: fmtCard)"

        DDLog(a);
        DDLog(b);
        DDLog(c);
    }

}
