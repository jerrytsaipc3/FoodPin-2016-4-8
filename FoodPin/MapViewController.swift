//
//  MapViewController.swift
//  FoodPin
//
//  Created by Apple on 2016/4/13.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView:MKMapView!
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //將地址轉換成座標並標註在地圖上
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location, completionHandler:{ placemarks, error in
            if error != nil {
                print(error)
                return
            }
            if let placemarks = placemarks {
                //取得第一個地標
                let placemark = placemarks[0]
                
                //加上標註
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    //顯示標注
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                }
                
            }
        })
        
        //定義mapView代理
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    //將地圖視圖加入圖像
func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
      let identifier = "Mypin"
      if annotation.isKindOfClass(MKUserLocation) {
        return nil
        }
    
    //如果可以的話回收使用這個標籤
            var annotationView:MKPinAnnotationView? =
            mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
            
    if annotationView == nil {
        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        annotationView?.canShowCallout = true
            }
            
            let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
            leftIconView.image = UIImage(named: restaurant.image)
            annotationView?.leftCalloutAccessoryView = leftIconView
            return annotationView
      }
 

}