//
//  MKMapView+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/4.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import MapKit

extension MKMapView {

    /// 泛型复用cell - cellType: "类名.self" (默认identifier: 类名字符串)
    final func dequeueReusableCell<T: MKAnnotationView>(for type: T.Type, annotation: MKAnnotation?, identifier: String = String(describing: T.self)) -> T{
        if let view = self.dequeueReusableAnnotationView(withIdentifier: identifier) as? T{
            return view
        }
        let view = T.init(annotation: annotation, reuseIdentifier: identifier)
        return view;
    }

}
