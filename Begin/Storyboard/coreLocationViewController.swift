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
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         // Do any additional setup after loading the view.
         // Create a GMSCameraPosition that tells the map to display the
         // coordinate -33.86,151.20 at zoom level 6.
         let camera = GMSCameraPosition.camera(withLatitude: 19.1450238, longitude: 72.9291216, zoom: 15.0)
         let mapView1 = GMSMapView.map(withFrame: self.view.frame, camera: camera)
         self.view.addSubview(mapView1)
         
         // Creates a marker in the center of the map.
         let marker = GMSMarker()
         marker.position = CLLocationCoordinate2D(latitude: 19.1450238, longitude: 72.9291216)
         marker.title = "Bhandup"
         marker.snippet = "India"
         marker.map = mapView1
         */
        
        /*
         func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
         let myCoord = locations[locations.count - 1]
         // self.myCoordinates = myCoord
         
         // get lat and long
         let myLat = myCoord.coordinate.latitude
         let myLong = myCoord.coordinate.longitude
         let myCoord2D = CLLocationCoordinate2D(latitude: myLat, longitude: myLong)
         
         
         //create MKCoordinateSpan for the span of the map
         let myLatDelta = 0.05 //rate of zoom in the mapView
         let myLongDelta = 0.05
         let mySpan = MKCoordinateSpan(latitudeDelta: myLatDelta, longitudeDelta: myLongDelta)
         
         //set region using the 2D coordinates and the Span.
         let myRegion = MKCoordinateRegion(center: myCoord2D, span: mySpan)
         
         //center map at this region
         mapView.setRegion(myRegion, animated: true) //instance of mapView created outside the function
         }
         */
        
        checkLocationServices()
        
    }
    
    func setUpLocationManager()
    {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationAuthorization(){
              switch CLLocationManager.authorizationStatus() {
              case .authorizedAlways:
                  break
              case .authorizedWhenInUse:
                //mapView.showsUserLocation  = true
                  break
              case .denied:
                  // show alert to turn on permission
                  break
              case .notDetermined:
                  locationManager.requestWhenInUseAuthorization()
                  break
              case .restricted:
                  // show alert
                  break
              default:
                  print("error")
              }
          }
    
    // to Check location services
    func checkLocationServices()
    {
        if CLLocationManager.locationServicesEnabled(){
            setUpLocationManager()
            checkLocationAuthorization()
            
        }
        else{
            print("enable location services")
        }
    }
}


extension coreDataViewController:CLLocationManagerDelegate  {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
