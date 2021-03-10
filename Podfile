# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
install!'cocoapods', :deterministic_uuids => false
platform :ios, '10.0'
use_frameworks!

def common_pods

    pod 'AFNetworking'
#  pod 'AImage'
    pod 'Alamofire', '~> 5.4.1'
#    pod 'AlamofireImage'
    pod 'RxAlamofire'

#    pod 'Aspects'
#    pod 'BSImagePicker'
#    pod 'BluetoothKit'
#    pod 'CryptoSwift'
#    pod 'EZSwiftExtensions'
#   pod 'FoldingCell'
    pod 'IQKeyboardManagerSwift'

#   pod 'ImagePicker'
#   pod 'KeychainAccess'
    pod 'Kingfisher'
    pod 'SDWebImage'
    
    pod 'MBProgressHUD'
    pod 'MMPopupView'
    pod 'MJRefresh'
    pod 'UICircularProgressRing'

    pod 'MonkeyKing'
#   pod 'Permission'
#   pod 'PromiseKit'
#   pod 'ReachabilitySwift'
#   pod 'SQLite.swift'
    pod 'SnapKit'
    pod 'SnapKitExtend'

#   pod 'Spring'
#   pod 'Surge'
#   pod 'SwiftOCR'
#   pod 'SwiftString'
    pod 'SwiftyJSON'
#   pod 'SwiftyUserDefaults'
    pod 'SwiftExpand'

#   pod 'TZStackView'
#   pod 'Whisper'
#   pod 'RealmSwift'

#    pod 'RxAlamofire'
#    pod 'RxBlocking'
    pod 'RxCocoa'
    pod 'RxSwift'
    pod 'OHHTTPStubs'
    
    pod 'Starscream'

    pod 'HandyJSON'
    
    pod 'YYWebImage'
    pod 'YYCache'
    pod 'YYCategories'
    pod 'YYModel'
#    pod 'TextFieldEffects'
#    pod 'KeychainAccess'
#    pod 'SwiftOCR'
#    pod "Koloda" #探探主页效果
    pod 'KeychainSwift'

    pod 'NNPlateKeyboard'
    pod 'NNPopoverButton'
    pod 'HFNavigationController'
    pod 'NNExcelView'
#    pod 'swiftScan'
#    pod 'YBAttributeTextTapAction'
#    pod 'AAInfographics', :git => 'https://github.com/AAChartModel/AAChartKit-Swift.git'

#iOS自带悬浮窗调试工具,摇晃手机即可显示系统的UI调试界面。
#    pod 'UIDebuggingTool'
    pod 'EAIntroView'
    pod 'XHLaunchAd'
    pod 'Instructions'
    pod 'TZImagePickerController'
    pod 'FloatingPanel'
#    pod 'ContainerController'
#    pod 'XLPagerTabStrip'

#    pod 'MarqueeLabel'
#    pod 'NotificationBannerSwift'
    pod 'EFQRCode'

    pod 'AlipaySDK-iOS'
    pod 'WechatOpenSDK'
    
#    pod 'UMCCommon'
#    pod 'mob_sharesdk/ShareSDKUI'
#    pod 'mob_sharesdk/ShareSDKPlatforms/WeChat'
#    pod 'mob_sharesdk/ShareSDKPlatforms/SinaWeibo'
#    pod 'mob_sharesdk/ShareSDKPlatforms/AliPaySocial'
#    pod 'mob_sharesdk/ShareSDKExtension'
    
    #  :configurations => ['Debug'] 只是在xcode debug 时才会加入；
    pod 'Reveal-SDK', :configurations => ['Debug']

    pod 'BXKAdvertSDK'
    
    #SwiftUI 辅助库
#    pod 'SwiftUIX'
#    pod "Introspect"
    
end


target 'SwiftTemplet' do
    common_pods
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.3'
      end
  end
end
