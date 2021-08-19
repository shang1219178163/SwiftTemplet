//
//Created by ESJsonFormatForMac on 19/05/06.
//

import UIKit
import HandyJSON


@objcMembers
class NNCheckVersRootClass : NSObject,HandyJSON {

    var results: [NNCheckVersResultsModel]?
    var resultCount: Int = 0

    required override init() {}
    func mapping(mapper: HelpingMapper) {
        mapper <<< results <-- "results"
        mapper <<< resultCount <-- "resultCount"
    }
    
}


@objcMembers
class NNCheckVersResultsModel : NSObject,HandyJSON {

    var primaryGenreName: String?
    
    var artworkUrl100: String?
    
    var sellerUrl: String?
    
    var currency: String?
    
    var artworkUrl512: String?
    
    var ipadScreenshotUrls: [String]?
    
    var fileSizeBytes: String?
    
    var genres: [String]?
    
    var languageCodesISO2A: [String]?
    
    var artworkUrl60: String?
    
    var supportedDevices: [String]?
    
    var trackViewUrl: String?
    
    var desc: String?
    
    var version: String?
    
    var bundleId: String?
    
    var artistViewUrl: String?
    
    var genreIds: [String]?
    
    var isGameCenterEnabled: Bool = false
    
    var appletvScreenshotUrls: [String]?
    
    var releaseDate: String?
    
    var wrapperType: String?
    
    var trackId: Int = 0
    
    var minimumOsVersion: String?
    
    var formattedPrice: String?
    
    var primaryGenreId: Int = 0
    
    var currentVersionReleaseDate: String?
    
    var userRatingCount: Int = 0
    
    var artistId: Int = 0
    
    var trackContentRating: String?
    
    var artistName: String?
    
    var price: Int = 0
    
    var trackCensoredName: String?
    
    var trackName: String?
    
    var kind: String?
    
    var features: [String]?
    
    var contentAdvisoryRating: String?
    
    var screenshotUrls: [String]?
    
    var releaseNotes: String?
    
    var isVppDeviceBasedLicensingEnabled: Bool = false
    
    var sellerName: String?
    
    var averageUserRating: Double = 0
    
    var advisories: [String]?


    required override init() {}
    func mapping(mapper: HelpingMapper) {
//        mapper <<< primaryGenreName <-- "primaryGenreName"
//        mapper <<< artworkUrl100 <-- "artworkUrl100"
//        mapper <<< sellerUrl <-- "sellerUrl"
//        mapper <<< currency <-- "currency"
//        mapper <<< artworkUrl512 <-- "artworkUrl512"
//        mapper <<< ipadScreenshotUrls <-- "ipadScreenshotUrls"
//        mapper <<< fileSizeBytes <-- "fileSizeBytes"
//        mapper <<< genres <-- "genres"
//        mapper <<< languageCodesISO2A <-- "languageCodesISO2A"
//        mapper <<< artworkUrl60 <-- "artworkUrl60"
//        mapper <<< supportedDevices <-- "supportedDevices"
//        mapper <<< trackViewUrl <-- "trackViewUrl"
        mapper <<< desc <-- "description"
//        mapper <<< version <-- "version"
//        mapper <<< bundleId <-- "bundleId"
//        mapper <<< artistViewUrl <-- "artistViewUrl"
//        mapper <<< genreIds <-- "genreIds"
//        mapper <<< isGameCenterEnabled <-- "isGameCenterEnabled"
//        mapper <<< appletvScreenshotUrls <-- "appletvScreenshotUrls"
//        mapper <<< releaseDate <-- "releaseDate"
//        mapper <<< wrapperType <-- "wrapperType"
//        mapper <<< trackId <-- "trackId"
//        mapper <<< minimumOsVersion <-- "minimumOsVersion"
//        mapper <<< formattedPrice <-- "formattedPrice"
//        mapper <<< primaryGenreId <-- "primaryGenreId"
//        mapper <<< currentVersionReleaseDate <-- "currentVersionReleaseDate"
//        mapper <<< userRatingCount <-- "userRatingCount"
//        mapper <<< artistId <-- "artistId"
//        mapper <<< trackContentRating <-- "trackContentRating"
//        mapper <<< artistName <-- "artistName"
//        mapper <<< price <-- "price"
//        mapper <<< trackCensoredName <-- "trackCensoredName"
//        mapper <<< trackName <-- "trackName"
//        mapper <<< kind <-- "kind"
//        mapper <<< features <-- "features"
//        mapper <<< contentAdvisoryRating <-- "contentAdvisoryRating"
//        mapper <<< screenshotUrls <-- "screenshotUrls"
//        mapper <<< releaseNotes <-- "releaseNotes"
//        mapper <<< isVppDeviceBasedLicensingEnabled <-- "isVppDeviceBasedLicensingEnabled"
//        mapper <<< sellerName <-- "sellerName"
//        mapper <<< averageUserRating <-- "averageUserRating"
//        mapper <<< advisories <-- "advisories"
    }
}

