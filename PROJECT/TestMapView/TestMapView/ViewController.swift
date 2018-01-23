//
//  ViewController.swift
//  TestMapView
//
//  Created by SONGYEE SHIN on 2017. 11. 7..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ***커스텀 어노테이션이 찍히기 전에 델리게이트로 모양을 만들어야하므로 먼저 써야함
        mapView.delegate = self
        
        // <#T##CLLocationCoordinate2D#>에 맞게 만듦
        let coordinate = CLLocationCoordinate2D(latitude: 37.497938, longitude: 127.027519)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        // 1 = 111km(Degree)
        
        // <#T##region: MKCoordinateRegion##MKCoordinateRegion#> 타입에 맞게 만들기
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
        let customPin = CustomAnnotation(title: "샘플", coordinate: coordinate)
        mapView.addAnnotation(customPin)
    }


}
// MARK
extension ViewController: MKMapViewDelegate {
    // MARK: pin 만들기
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? CustomAnnotation {
            let id = "pin"
            var pinView: MKPinAnnotationView
            if let dequeueView = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView {
                dequeueView.annotation = annotation
                pinView = dequeueView
            }else{
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
                pinView.canShowCallout = true
                pinView.calloutOffset = CGPoint(x: -5, y: 5)
                pinView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            return pinView
        }
        return nil
    }
}


