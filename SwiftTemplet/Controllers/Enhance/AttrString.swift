//
//  AttrString.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/26.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

struct AttrString {
    let attributedString: NSAttributedString
}

extension AttrString: ExpressibleByStringLiteral {
    init(stringLiteral: String) {
        self.attributedString = NSAttributedString(string: stringLiteral)
    }
}

extension AttrString: CustomStringConvertible {
    var description: String {
        return String(describing: self.attributedString)
    }
}

extension AttrString: ExpressibleByStringInterpolation {
    struct StringInterpolation: StringInterpolationProtocol {
        var attributedString: NSMutableAttributedString

        init(literalCapacity: Int, interpolationCount: Int) {
            self.attributedString = NSMutableAttributedString()
        }

        func appendLiteral(_ literal: String) {
            let astr = NSAttributedString(string: literal)
            self.attributedString.append(astr)
        }

        func appendInterpolation(_ string: String, attributes: [NSAttributedString.Key: Any]? = nil) {
            let astr = NSAttributedString(string: string, attributes: attributes)
            self.attributedString.append(astr)
        }
    }
    
    init(stringInterpolation: StringInterpolation) {
        self.attributedString = NSAttributedString(attributedString: stringInterpolation.attributedString)
    }
}

public struct AttrStringStyle {
    let attributes: [NSAttributedString.Key: Any]
    static func font(_ font: UIFont) -> Self {
        return self.init(attributes: [.font: font])
    }
    
    static func color(_ color: UIColor) -> Self {
        return self.init(attributes: [.foregroundColor: color])
    }
    
    static func bgColor(_ color: UIColor) -> Self {
        return self.init(attributes: [.backgroundColor: color])
    }
    
    static func link(_ value: String) -> Self {
        return .linkURL(URL(string: value)!)
    }
    
    static func linkURL(_ value: URL) -> Self {
        return self.init(attributes: [.link: value])
    }
    //设置字体倾斜度，取值为float，正值右倾，负值左倾
    static func oblique(_ value: CGFloat = 0.1) -> Self {
        return self.init(attributes: [.obliqueness: value])
    }
    
    //字符间距
    static func kern(_ value: CGFloat) -> Self {
        return self.init(attributes: [.kern: value])
    }
    
    //设置字体的横向拉伸，取值为float，正值拉伸 ，负值压缩
    static func expansion(_ value: CGFloat) -> Self {
        return self.init(attributes: [.expansion: value])
    }
    
    //设置下划线
    static func underline(_ color: UIColor, _ style: NSUnderlineStyle) -> Self {
        return self.init(attributes: [
            .underlineColor: color,
            .underlineStyle: style.rawValue
        ])
    }
    
    //设置删除线
    static func strikethrough(_ color: UIColor, _ style: NSUnderlineStyle) -> Self {
        return self.init(attributes: [
            .strikethroughColor: color,
            .strikethroughStyle: style.rawValue,
        ])
    }
            
    ///设置基准位置 (正上负下)
    static func baseline(_ value: CGFloat) -> Self {
        return self.init(attributes: [.baselineOffset: value])
    }
    
    ///设置段落
    static func paraStyle(_ alignment: NSTextAlignment,
                          lineSpacing: CGFloat = 0,
                          paragraphSpacingBefore: CGFloat = 0,
                          lineBreakMode: NSLineBreakMode = .byTruncatingTail) -> Self {
        let style = NSMutableParagraphStyle()
        style.alignment = alignment
        style.lineBreakMode = lineBreakMode
        style.lineSpacing = lineSpacing
        style.paragraphSpacingBefore = paragraphSpacingBefore
        return self.init(attributes: [.paragraphStyle: style])
    }
    
    ///设置属性字典
    static func addAttributes(_ dic: [NSAttributedString.Key: Any]) -> Self {
        return self.init(attributes: dic)
    }
    
    ///设置段落
    static func paragraphStyle(_ style: NSMutableParagraphStyle) -> Self {
        return self.init(attributes: [.paragraphStyle: style])
    }
  
}

extension AttrString.StringInterpolation {
    func appendInterpolation(_ string: String, _ style: AttrStringStyle...) {
        var attrs: [NSAttributedString.Key: Any] = [:]
        style.forEach {
            attrs.merge($0.attributes, uniquingKeysWith: {$1})
        }
        let astr = NSAttributedString(string: string, attributes: attrs)
        self.attributedString.append(astr)
    }

    func appendInterpolation(wrap string: AttrString, _ style: AttrStringStyle...) {
        var attrs: [NSAttributedString.Key: Any] = [:]
        style.forEach {
            attrs.merge($0.attributes, uniquingKeysWith: {$1})
        }
        let mas = NSMutableAttributedString(attributedString: string.attributedString)
        let fullRange = NSRange(mas.string.startIndex..<mas.string.endIndex, in: mas.string)
        mas.addAttributes(attrs, range: fullRange)
        self.attributedString.append(mas)
    }
    
    func appendInterpolation(image: UIImage, scale: CGFloat = 1.0) {
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let attachment = NSTextAttachment()
        attachment.image = newImage

        self.attributedString.append(NSAttributedString(attachment: attachment))
//        print(#function, rect, size)
    }
}

public extension NSAttributedString{
    ///设置样式
    func style(_ style: AttrStringStyle...) -> NSAttributedString {
        var dic: [NSAttributedString.Key: Any] = [:]
        style.forEach {
            dic.merge($0.attributes, uniquingKeysWith: {$1})
        }
        
        let mattr = NSMutableAttributedString(attributedString: self)
        mattr.addAttributes(dic, range: NSMakeRange(0, self.length))
        return mattr;
    }
}

extension AttrString{

    public static func testNew(_ title: String = "上传", count: Int = 0, maxCount: Int = 2) -> NSAttributedString {
        if #available(iOS 13.0, *) {
            let image: UIImage? = UIImage.chevron_right?
                .byResize(to: CGSize(width: 12, height: 12))?
                .maskWithColor(color: .gray)

            let str2: AttrString = """
              \(title, .color(.theme), .font(UIFont.systemFont(ofSize: 15))) \("0/2", .color(.textColor9), .font(UIFont.systemFont(ofSize: 12))) \(image: image!, scale: 1.0)
              """
            return str2.attributedString
        }
        return "".matt
    }
    
    public static func test() -> NSAttributedString {
        let user = "AliSoftware"
        let str: AttrString = """
          Hello \(user, attributes: [.foregroundColor: UIColor.blue])!
          """
        let str1: AttrString = """
          Hello \(user, .color(.blue), .underline(.red, .single)), how do you like this?
          """

        let username = "AliGator"
        let str2: AttrString = """
          Hello \(username, .color(.red)), isn't this \("cool", .color(.blue), .oblique(), .underline(.purple, .single))?

          \(wrap: """
            \(" Merry Xmas! ", .font(.systemFont(ofSize: 24)), .color(.red), .bgColor(.yellow), .oblique(0.2))
            \(image: UIImage(named: "pay_record_buscard")!, scale: 2.0)
            """, .paraStyle(.center))

          Go there to \("learn more about String Interpolation", .link("https://github.com/apple/swift-evolution/blob/master/proposals/0228-fix-expressiblebystringinterpolation.md"), .oblique(), .underline(.blue, .single))!
          """
        return str2.attributedString
    }
}

extension UIImage {

    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!

        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)

        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }

}
