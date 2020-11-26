//
//  AttrString.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/26.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

//class AttrString: NSObject {
//
//}
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
    init(stringInterpolation: StringInterpolation) {
        self.attributedString = NSAttributedString(attributedString: stringInterpolation.attributedString)
    }

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
}

extension AttrString {
    struct Style {
        let attributes: [NSAttributedString.Key: Any]
        static func font(_ font: UIFont) -> Style {
            return Style(attributes: [.font: font])
        }
        
        static func color(_ color: UIColor) -> Style {
            return Style(attributes: [.foregroundColor: color])
        }
        
        static func bgColor(_ color: UIColor) -> Style {
            return Style(attributes: [.backgroundColor: color])
        }
        
        static func link(_ link: String) -> Style {
            return .link(URL(string: link)!)
        }
        
        static func link(_ link: URL) -> Style {
            return Style(attributes: [.link: link])
        }
        
        static let oblique = Style(attributes: [.obliqueness: 0.1])
        
        static func underline(_ color: UIColor, _ style: NSUnderlineStyle) -> Style {
            return Style(attributes: [
                .underlineColor: color,
                .underlineStyle: style.rawValue
            ])
        }
        
        static func alignment(_ alignment: NSTextAlignment,
                              lineSpacing: CGFloat = 0,
                              lineBreakMode: NSLineBreakMode = .byTruncatingTail) -> Style {
            let style = NSMutableParagraphStyle()
            style.alignment = alignment
            style.lineBreakMode = lineBreakMode
            style.lineSpacing = lineSpacing
            
            return Style(attributes: [.paragraphStyle: style])
        }
  }
}

extension AttrString.StringInterpolation {
    func appendInterpolation(_ string: String, _ style: AttrString.Style...) {
        var attrs: [NSAttributedString.Key: Any] = [:]
        style.forEach {
            attrs.merge($0.attributes, uniquingKeysWith: {$1})
        }
        let astr = NSAttributedString(string: string, attributes: attrs)
        self.attributedString.append(astr)
    }

    func appendInterpolation(wrap string: AttrString, _ style: AttrString.Style...) {
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

extension AttrString{
    
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
          Hello \(username, .color(.red)), isn't this \("cool", .color(.blue), .oblique, .underline(.purple, .single))?

          \(wrap: """
            \(" Merry Xmas! ", .font(.systemFont(ofSize: 24)), .color(.red), .bgColor(.yellow))
            \(image: UIImage(named: "pay_record_buscard")!, scale: 2.0)
            """, .alignment(.center))

          Go there to \("learn more about String Interpolation", .link("https://github.com/apple/swift-evolution/blob/master/proposals/0228-fix-expressiblebystringinterpolation.md"), .oblique, .underline(.blue, .single))!
          """
        
        return str2.attributedString
    }
}
