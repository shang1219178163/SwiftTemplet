//
//	
//	MacTemplet
//
//	Created by shang on 2020/07/09 17:56
//	Copyright © 2020 shang. All rights reserved.
//

import Foundation 
import HandyJSON

@objcMembers
class NNRootAppInfoModel: NSObject, HandyJSON {

    var resultCount: Int = 0

    var results: [NNResultsAppInfoModel]?

    required override init() {}
    func mapping(mapper: HelpingMapper) {

    }
}

@objcMembers
class NNResultsAppInfoModel: NSObject, HandyJSON {

    var advisories: [String]?

    var appletvScreenshotUrls: [String]?

    var artistId: Int = 0

    var artistName: String = ""

    var artistViewUrl: String = ""

    var artworkUrl100: String = ""

    var artworkUrl512: String = ""

    var artworkUrl60: String = ""

    var averageUserRating: Double = 0

    var averageUserRatingForCurrentVersion: Double = 0

    var bundleId: String = ""

    var contentAdvisoryRating: String = ""

    var currency: String = ""

    var currentVersionReleaseDate: String = ""

    var desc: String = ""

    var features: [String]?

    var fileSizeBytes: String = ""

    var formattedPrice: String = ""

    var genreIds: [String]?

    var genres: [String]?

    var ipadScreenshotUrls: [String]?

    var isGameCenterEnabled: Bool = false

    var isVppDeviceBasedLicensingEnabled: Bool = false

    var kind: String = ""

    var languageCodesISO2A: [String]?

    var minimumOsVersion: String = ""

    var price: Int = 0

    var primaryGenreId: Int = 0

    var primaryGenreName: String = ""

    var releaseDate: String = ""

    var releaseNotes: String = ""

    var screenshotUrls: [String]?

    var sellerName: String = ""

    var sellerUrl: String = ""

    var supportedDevices: [String]?

    var trackCensoredName: String = ""

    var trackContentRating: String = ""

    var trackId: Int = 0

    var trackName: String = ""

    var trackViewUrl: String = ""

    var userRatingCount: Int = 0

    var userRatingCountForCurrentVersion: Int = 0

    var version: String = ""

    var wrapperType: String = ""

    required override init() {}
    func mapping(mapper: HelpingMapper) {
        mapper <<< desc <-- "description";

    }
}

