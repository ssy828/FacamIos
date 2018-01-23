//
//  CustomAnnotation.swift
//  TestMapView
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
    }
    
    
}
// MARK: MKAnnotation 프로토콜
//public protocol MKAnnotation: NSObjectProtocol
//{
//    var coordinate: CLLocationCoordinate2D { get }
//}

