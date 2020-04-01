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
class coreLocationViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
         */

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
       }
    }
    
   
