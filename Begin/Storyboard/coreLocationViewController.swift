//
//  coreLocationViewController.swift
//  Begin
//
//  Created by Siddhesh jadhav on 01/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class coreLocationViewController: UIViewController,CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
       
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()

       

       /*
        let camera = GMSCameraPosition.camera(withLatitude: 19.1450238, longitude: 72.9291216, zoom: 15.0,bearing: 0,viewingAngle: 45)

        // setting map type
        mapView.mapType = GMSMapViewType.normal
        
        mapView.camera = camera
        let marker = GMSMarker()

        marker.position = camera.target

        marker.title = "Bhandup"
        marker.snippet = "India"
        marker.map = mapView
        
        // show deivce current location
        mapView.isMyLocationEnabled = true
 */
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        let center = CLLocationCoordinate2D.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
    }
    
    
}






