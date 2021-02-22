//
//  MKMapView+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/4.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import MapKit

@objc public extension MKMapView {
    
    var coordLeftTop: CLLocationCoordinate2D{
        let point = CGPoint(x: frame.minX, y: frame.minY)
        return convert(point, toCoordinateFrom: superview)
    }
    
    var coordLeftBom: CLLocationCoordinate2D{
        let point = CGPoint(x: frame.minX, y: frame.maxY)
        return convert(point, toCoordinateFrom: superview)
    }
    
    var coordRightTop: CLLocationCoordinate2D{
        let point = CGPoint(x: frame.maxX, y: frame.minY)
        return convert(point, toCoordinateFrom: superview)
    }
    
    var coordRightBom: CLLocationCoordinate2D{
        let point = CGPoint(x: frame.maxX, y: frame.maxY)
        return convert(point, toCoordinateFrom: superview)
    }
    
}


public extension MKMapView {

    /// 泛型复用cell - cellType: "类名.self" (默认identifier: 类名字符串)
    final func dequeueReusableCell<T: MKAnnotationView>(for type: T.Type, annotation: MKAnnotation?, identifier: String = String(describing: T.self)) -> T{
        if let view = self.dequeueReusableAnnotationView(withIdentifier: identifier) as? T{
            return view
        }
        let view = T.init(annotation: annotation, reuseIdentifier: identifier)
        return view;
    }

}
