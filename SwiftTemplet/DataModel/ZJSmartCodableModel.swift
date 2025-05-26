//
//  ZJSmartCodableModel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2025/4/1.
//  Copyright © 2025 BN. All rights reserved.
//

import SmartCodable

struct ZJSmartCodableModel: SmartCodable {
    var name: String?
    var age: Int?
    var weight: Double?
    var sex: Int?
    var location: String?
    @SmartAny
    var customData: Any?
    var threeDayForecast: [ZJThreeDaySmartCodableModel] = []
    
    static func mappingForKey() -> [SmartKeyTransformer]? {
        [
            CodingKeys.threeDayForecast <--- "three_day_forecast",
            CodingKeys.name <--- ["username", "name"]
        ]
    }
}


struct ZJThreeDaySmartCodableModel: SmartCodable {
    var conditions: String?
    var day: String?
    var temperature: Int?

    
    static func mappingForKey() -> [SmartKeyTransformer]? {
        [
            CodingKeys.conditions <--- "conditions",
            CodingKeys.day <--- ["day",],
            CodingKeys.temperature <--- "temperature",
        ]
    }
}
