//
//Created by ESJsonFormatForMac on 19/05/06.
//

import UIKit
import HandyJSON

class BNCheckVersRootClass : NSObject,HandyJSON {

    @objc var results: [BNCheckVersResultsModel]?
    @objc var resultCount: Int = 0

    required override init() {}
    func mapping(mapper: HelpingMapper) {
        mapper <<< results <-- "results"
        mapper <<< resultCount <-- "resultCount"
    }
    
}

class BNCheckVersResultsModel : NSObject,HandyJSON {

    @objc var primaryGenreName: String?
    
    @objc var artworkUrl100: String?
    
    @objc var sellerUrl: String?
    
    @objc var currency: String?
    
    @objc var artworkUrl512: String?
    
    @objc var ipadScreenshotUrls: [String]?
    
    @objc var fileSizeBytes: String?
    
    @objc var genres: [String]?
    
    @objc var languageCodesISO2A: [String]?
    
    @objc var artworkUrl60: String?
    
    @objc var supportedDevices: [String]?
    
    @objc var trackViewUrl: String?
    
    @objc var desc: String?
    
    @objc var version: String?
    
    @objc var bundleId: String?
    
    @objc var artistViewUrl: String?
    
    @objc var genreIds: [String]?
    
    @objc var isGameCenterEnabled: Bool = false
    
    @objc var appletvScreenshotUrls: [String]?
    
    @objc var releaseDate: String?
    
    @objc var wrapperType: String?
    
    @objc var trackId: Int = 0
    
    @objc var minimumOsVersion: String?
    
    @objc var formattedPrice: String?
    
    @objc var primaryGenreId: Int = 0
    
    @objc var currentVersionReleaseDate: String?
    
    @objc var userRatingCount: Int = 0
    
    @objc var artistId: Int = 0
    
    @objc var trackContentRating: String?
    
    @objc var artistName: String?
    
    @objc var price: Int = 0
    
    @objc var trackCensoredName: String?
    
    @objc var trackName: String?
    
    @objc var kind: String?
    
    @objc var features: [String]?
    
    @objc var contentAdvisoryRating: String?
    
    @objc var screenshotUrls: [String]?
    
    @objc var releaseNotes: String?
    
    @objc var isVppDeviceBasedLicensingEnabled: Bool = false
    
    @objc var sellerName: String?
    
    @objc var averageUserRating: Double = 0
    
    @objc var advisories: [String]?


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
        //     getcapper <<< averageUserRating <-- "averageUserRating"
//        mapper <<< advisories <-- "advisories"
    }
}

