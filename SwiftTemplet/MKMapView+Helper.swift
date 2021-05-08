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
    
    
    func zoom(to coordinates: [CLLocationCoordinate2D], meter: Double, edgePadding: UIEdgeInsets, animated: Bool) {
        guard !coordinates.isEmpty else { return }

        if coordinates.count == 1 {
            let coordinateRegion = MKCoordinateRegion(
                center: coordinates.first!,
                latitudinalMeters: meter,
                longitudinalMeters: meter)
            setRegion(coordinateRegion, animated: true)
        } else {
            let mkPolygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
            setVisibleMapRect(mkPolygon.boundingMapRect, edgePadding: edgePadding, animated: animated)
        }
    }
}


public extension MKMapView {

    @available(iOS 11.0, tvOS 11.0, macOS 10.13, *)
    func register<T: MKAnnotationView>(annotationViewWithClass type: T.Type, identifier: String? = nil) {
        register(T.self, forAnnotationViewWithReuseIdentifier: identifier ?? String(describing: type))
    }
    
    /// 泛型复用cell - cellType: "类名.self" (默认identifier: 类名字符串)
    final func dequeueReusableAnnoView<T: MKAnnotationView>(for type: T.Type, annotation: MKAnnotation?, identifier: String? = nil) -> T {
        if let view = self.dequeueReusableAnnotationView(withIdentifier: identifier ?? String(describing: type)) as? T{
            return view
        }
        let view = T.init(annotation: annotation, reuseIdentifier: identifier ?? String(describing: type))
        return view;
    }

}

public extension MKAnnotationView {
    static func dequeueReusableAnnoView(_ mapView: MKMapView, annotation: MKAnnotation?, identifier: String) -> MKAnnotationView{
        if let annoView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier){
            return annoView
        }
        let annoView = self.init(annotation: annotation, reuseIdentifier: identifier)
        annoView.canShowCallout = true
        return annoView
    }
}
