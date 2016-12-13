//
//  SetLocationTimeViewController.swift
//  EmtDoc
//
//  Created by studentuser on 12/12/16.
//  Copyright © 2016 FormatHealth. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SetLocationTimeViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    var currentCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBAction func useCurrentLocationButton(_ sender: Any) {
        locationManager.delegate = self
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.incident
        
        // Check for authorization
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        // Grab the annotation
        let allAnnotations = self.mapView.annotations
        
        // Set our current coordinate
        self.currentCoordinate = (allAnnotations[0].coordinate)
        
        // Set our mainModel
        mainModel.coordinates = self.currentCoordinate
        
        print("Lat:\(String(self.currentCoordinate.latitude))\nLong:\(String(self.currentCoordinate.longitude))")
    }
    
    @IBAction func goToCurrentLocation(_ sender: Any) {
        centerMapOnLocation(location: CLLocation(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Add long press recognizer
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(addAnnotationOnLongPress(gesture:)))
        longPressGesture.minimumPressDuration = 1.0
        self.mapView.addGestureRecognizer(longPressGesture)
        
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true;
        
        // Fetch the EmtDocModel from app delegate singleton
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let mainModel = appDelegate.EmtDocModel.incident
        
        // If we don't have something already stored then
        if (mainModel.coordinates == nil) {
            // Go to current Location
            self.currentCoordinate = CLLocationCoordinate2DMake((locationManager.location?.coordinate.latitude)!, (locationManager.location?.coordinate.longitude)!)
        // Else go to the saved location
        } else {
            self.currentCoordinate = mainModel.coordinates!

        }
        
        
        
        // Create non-2d coordinate
        let non2DLocation = CLLocation(latitude: self.currentCoordinate.latitude, longitude: self.currentCoordinate.longitude)
        
        // Center map on current location
        centerMapOnLocation(location: non2DLocation)
        
        // Drop a pin on current location
        let annotation = MKPointAnnotation()
        annotation.coordinate = self.currentCoordinate
        self.mapView.addAnnotation(annotation)
        
    }
    
    func addAnnotationOnLongPress(gesture: UILongPressGestureRecognizer) {
        
        if gesture.state == .ended {
            // Remove previous annotations
            let allAnnotations = self.mapView.annotations
            self.mapView.removeAnnotations(allAnnotations)
            
            // Get location selected
            let point = gesture.location(in: self.mapView)
            // Create coordinate
            let coordinate = self.mapView.convert(point, toCoordinateFrom: self.mapView)
            //Now use this coordinate to add annotation on map.
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            self.mapView.addAnnotation(annotation)
        }
    }
    
    // For our initial view
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
