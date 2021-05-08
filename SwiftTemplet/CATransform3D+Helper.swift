//
//  CATransform3D+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/8.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import QuartzCore

extension CATransform3D: Equatable {

    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable
    public static func == (lhs: CATransform3D, rhs: CATransform3D) -> Bool {
        CATransform3DEqualToTransform(lhs, rhs)
    }

}


public extension CATransform3D {
    /// SwifterSwift: The identity transform: [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1].
    @inlinable
    static var identity: CATransform3D { return CATransform3DIdentity }
    
    @inlinable
    var isIdentity: Bool { return CATransform3DIsIdentity(self) }
    
    @inlinable
    var isAffine: Bool { return CATransform3DIsAffine(self) }

    @inlinable
    func affineTransform() -> CGAffineTransform { return CATransform3DGetAffineTransform(self) }
    
    
    /// Translate the receiver by `(tx, ty, tz)`.
    /// - Parameters:
    ///   - tx: x-axis translation
    ///   - ty: y-axis translation
    ///   - tz: z-axis translation
    /// - Returns: The translated matrix.
    @inlinable
    func translatedBy(x tx: CGFloat, y ty: CGFloat, z tz: CGFloat) -> CATransform3D {
        return CATransform3DTranslate(self, tx, ty, tz)
    }

    /// Scale the receiver by `(sx, sy, sz)`.
    /// - Parameters:
    ///   - sx: x-axis scale
    ///   - sy: y-axis scale
    ///   - sz: z-axis scale
    /// - Returns: The scaled matrix.
    @inlinable
    func scaledBy(x sx: CGFloat, y sy: CGFloat, z sz: CGFloat) -> CATransform3D {
        return CATransform3DScale(self, sx, sy, sz)
    }

    /// Rotate the receiver by `angle` radians about the vector `(x, y, z)`.
    ///
    /// If the vector has zero length the behavior is undefined.
    /// - Parameters:
    ///   - angle: The angle of rotation
    ///   - x: x position of the vector
    ///   - y: y position of the vector
    ///   - z: z position of the vector
    /// - Returns: The rotated matrix.
    @inlinable
    func rotated(by angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) -> CATransform3D {
        return CATransform3DRotate(self, angle, x, y, z)
    }

    /// Invert the receiver.
    ///
    /// Returns the original matrix if the receiver has no inverse.
    /// - Returns: The inverted matrix of the receiver.
    @inlinable
    func inverted() -> CATransform3D {
        return CATransform3DInvert(self)
    }

    /// Concatenate `transform` to the receiver.
    /// - Parameter t2: The transform to concatenate on to the receiver
    /// - Returns: The concatenated matrix.
    @inlinable
    func concatenating(_ t2: CATransform3D) -> CATransform3D {
        return CATransform3DConcat(self, t2)
    }

    /// Translate the receiver by `(tx, ty, tz)`.
    /// - Parameters:
    ///   - tx: x-axis translation
    ///   - ty: y-axis translation
    ///   - tz: z-axis translation
    @inlinable
    mutating func translateBy(x tx: CGFloat, y ty: CGFloat, z tz: CGFloat) {
        self = CATransform3DTranslate(self, tx, ty, tz)
    }

    /// SwifterSwift: Scale the receiver by `(sx, sy, sz)`.
    /// - Parameters:
    ///   - sx: x-axis scale
    ///   - sy: y-axis scale
    ///   - sz: z-axis scale
    @inlinable
    mutating func scaleBy(x sx: CGFloat, y sy: CGFloat, z sz: CGFloat) {
        self = CATransform3DScale(self, sx, sy, sz)
    }

    /// Rotate the receiver by `angle` radians about the vector `(x, y, z)`.
    ///
    /// If the vector has zero length the behavior is undefined.
    /// - Parameters:
    ///   - angle: The angle of rotation
    ///   - x: x position of the vector
    ///   - y: y position of the vector
    ///   - z: z position of the vector
    @inlinable
    mutating func rotate(by angle: CGFloat, x: CGFloat, y: CGFloat, z: CGFloat) {
        self = CATransform3DRotate(self, angle, x, y, z)
    }

    /// Invert the receiver.
    ///
    /// Returns the original matrix if the receiver has no inverse.
    @inlinable
    mutating func invert() {
        self = CATransform3DInvert(self)
    }

    /// Concatenate `transform` to the receiver.
    /// - Parameter t2: The transform to concatenate on to the receiver
    @inlinable
    mutating func concatenate(_ t2: CATransform3D) {
        self = CATransform3DConcat(self, t2)
    }
}


public extension CGAffineTransform {
    /// Returns a transform with the same effect as the receiver.
    @inlinable
    func transform3D() -> CATransform3D { CATransform3DMakeAffineTransform(self) }
}
