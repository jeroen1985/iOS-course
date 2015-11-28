//
//  ViewController.swift
//  Map Demo
//
//  Created by Jeroen Stevens on 2015-11-27.
//  Copyright (c) 2015 fishsticks. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        var latitude:CLLocationDegrees = 52.378695
        
        var longitude:CLLocationDegrees = 4.899057
        
        var latDelta:CLLocationDegrees = 1
        
        var lonDelta:CLLocationDegrees = 1
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        var annotation = MKPointAnnotation()
        
        map.setRegion(region, animated: true)
        
        annotation.coordinate = location
        
        annotation.title = "Beautiful Amsterdam!"
        
        annotation.subtitle = "best town"
        
        map.addAnnotation(annotation)
        
        var uilprg = UILongPressGestureRecognizer(target: self, action: "action:")
        
        uilprg.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilprg)
        
        }
    
    func action (gestureRecognizer: UIGestureRecognizer){
        
        println("test")
        
        var touchPoint = gestureRecognizer.locationInView(self.map)
        
        var newCoordinate: CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "new place"
        
        annotation.subtitle = "awesome"
        
        map.addAnnotation(annotation)
   
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation: CLLocation = locations[0] as CLLocation
        
        var latitude = userLocation.coordinate.latitude
        
        var longitude = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.01
        
        var lonDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        var annotation = MKPointAnnotation()
        
        self.map.setRegion(region, animated: false)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

