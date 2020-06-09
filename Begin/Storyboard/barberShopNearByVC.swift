//
//  barberShopNearByVC.swift
//  Begin
//
//  Created by Siddhesh jadhav on 25/04/20.
//  Copyright © 2020 Infiny Webcom. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
    func dropPinSet(placemark:MKPlacemark)
}

class barberShopNearByVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapCard: mapCardCollectionView!
    @IBOutlet weak var homeBtn: UIButton!
    
    var resultSearchController:UISearchController? = nil
    var selectedPin:MKPlacemark? = nil
    var locationManager = CLLocationManager()
    var searchResult = LocationSearchTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingUpSearchBar()
        // mapCard.backgroundColor = UIColor.clear.withAlphaComponent(0)
        //mapCard.backgroundView = nil;
        mapCard.backgroundColor = .clear
        homeBtn.makeCircularButtonWithShadow()
        
        mapView.delegate = self
        checkLocationServices()
    }
    
    func settingUpSearchBar()
    {
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search salon, spa and barber"
        navigationItem.searchController = resultSearchController
        
        searchBar.delegate = self
        searchBar.backgroundImage = UIImage()
        searchBar.backgroundColor = .clear
        searchBar.searchTextField.backgroundColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5764705882, alpha: 0.24)
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.obscuresBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
        let attributes:[NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Tofino-Bold", size: 15)!
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes, for: .normal)
        
        let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.font = UIFont(name: "Tofino-Regular", size: 15)
        textFieldInsideSearchBar?.adjustsFontSizeToFitWidth = true
        textFieldInsideSearchBar?.clearButtonMode = .never
        
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
        
    }
    
    
    
    @IBAction func hoeBtnClicked(_ sender: UIButton) {
        print("button clicked")
    }
    
}

extension barberShopNearByVC: UISearchBarDelegate{
    
}

extension barberShopNearByVC: CLLocationManagerDelegate{
    
    func setUpLocationManager()
    {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
    
    // for zoom
    func centerViewOnUserLocation()
    {
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation  = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation() // calls didUpdateLocation delegate method
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
    
    // check authorzation if status changed
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    // if user moves location updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
        
    }
}

extension barberShopNearByVC:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation{
            return nil
        }
        
        let identifier = "marker"
        var marker: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            marker = dequeuedView
        } else {
            marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            marker.markerTintColor = #colorLiteral(red: 0.9921568627, green: 0.4235294118, blue: 0.3411764706, alpha: 1)
            marker.glyphImage = #imageLiteral(resourceName: "barber icon")
            marker.glyphTintColor = #colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1)
        }
        return marker
        
    }
}

extension barberShopNearByVC: HandleMapSearch {
    func dropPinSet(placemark: MKPlacemark) {
        // cache the pin
        selectedPin = placemark
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        centerViewOnUserLocation()
    }
    
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let center = CLLocationCoordinate2D(latitude: placemark.coordinate.latitude, longitude: placemark.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        mapView.setRegion(region, animated: true)
    }
}











