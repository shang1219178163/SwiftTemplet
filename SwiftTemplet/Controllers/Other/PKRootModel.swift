//
//	
//	MacTemplet
//
//	Created by shang on 2020/11/05 14:55
//	Copyright © 2020 shang. All rights reserved.
//

import Foundation
import YYModel

@objcMembers class PKRootModel: NSObject {

    var object: PKObjectModel?

    var status: String = ""

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
	}
    
}

@objcMembers class PKObjectModel: NSObject {

    var blocks: [PKBlocksModel]?

    var buildings: [PKBuildingsModel]?

    var floors: [PKFloorsModel]?

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
	}
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
		return ["blocks" : PKBlocksModel.self,
		"buildings" : PKBuildingsModel.self,
		"floors" : PKFloorsModel.self,
		]
	}
}

@objcMembers class PKBlocksModel: NSObject {

    var descriptionNew: String = ""

    var disabled: Bool = false

    var idNew: Int = 0

    var level: Int = 0

    var name: String = ""

    var value: Int = 0

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
	}
    
}

@objcMembers class PKBuildingsModel: NSObject {

    var disabled: Bool = false

    var idNew: Int = 0

    var level: Int = 0

    var name: String = ""

    var value: Int = 0

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
	}
    
}

@objcMembers class PKFloorsModel: NSObject {

    var disabled: Bool = false

    var idNew: Int = 0

    var level: Int = 0

    var name: String = ""

    var value: Int = 0

    required override init() {}
    static func modelCustomPropertyMapper() -> [String : Any]? {
        return [:]
	}
    
}

