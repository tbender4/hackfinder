//
//  ViewController.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/15/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {


    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus() // Keeps Track
    let regionRadius: Double = 1000
    var events: [Event] = []    //once one event can be parsed, do the rest
//    let coords = [  CLLocation(latitude: xxxx, longitude: xxxx),
//                    CLLocation(latitude: xxx, longitude: xxx),
//                    CLLocation(latitude: xxx, longitude:xxx)
//    ];
 // let queue = DispatchQueue.global()
    var coords : [CLLocation] = []
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /*
     USAGE OF Eventbrite API:
     1) Update search with Eventbrite.updateSearch(...)
     2) run getEvents()
    */
    Eventbrite.updateSearch(sortBy: "best", locationAddress: "new+york", locationWithin: "50", isFree: false)
 //   getEvents()
    

      UserEvents.getEvents()
    centerMapOnUserLocation()
    
    UserEvents.group.notify(queue: .main) {
        DispatchQueue.global().async {
            while true {
                if UserEvents.safeToReload() {
                    //self.tableView.reloadData()
                    //print(UserEvents.events[0].address?.latitude as! String)
                    
                    for coor in UserEvents.events{
                        let lat = Double(coor.address?.latitude as! String)
                        let long = Double(coor.address?.longitude as! String)
                        let loc = CLLocation(latitude: lat!, longitude: long!)
                        self.coords.append(loc)
                    }
                    
                    self.addAnnotations(coords: self.coords)
                    
                    break
                }
            }
        }
    }
    
    
    
  }
    
    
//    func getEvents () {
//        Eventbrite.getEvents { (events: [Event]?, error: Error?) in
//            if let events = events {
//                self.events = events
//            } else {
//                print("error")
//            }
//        }
//    }
    @IBAction func centerBtnWasPressed(_ sender: Any) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse {
            centerMapOnUserLocation()
        }
    }
    
    func addAnnotations(coords: [CLLocation]){
        for coord in coords{
            let CLLCoordType = CLLocationCoordinate2D(latitude: coord.coordinate.latitude,
                                                      longitude: coord.coordinate.longitude);
            let anno = MKPointAnnotation();
            anno.coordinate = CLLCoordType;
            mapView.addAnnotation(anno);
        }
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil;
        }else{
            let pinIdent = "Pin";
            var pinView: MKPinAnnotationView;
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: pinIdent) as? MKPinAnnotationView {
                dequeuedView.annotation = annotation;
                pinView = dequeuedView;
            }else{
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: pinIdent);
    
            }
        return pinView;
    }
}
    
    
}
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Customize the pin drop
        
        if annotation is MKUserLocation {
            return nil
        }
        let pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "droppablePin")
        pinAnnotation.pinTintColor = #colorLiteral(red: 0.9771530032, green: 0.7062081099, blue: 0.1748393774, alpha: 1)
        pinAnnotation.animatesDrop = true
        return pinAnnotation
    }
    
    func centerMapOnUserLocation(){ // Center the coordinate on user location
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func configureLocationServices(){ // are we authorized to access the location
        if authorizationStatus == .notDetermined {
            locationManager.requestAlwaysAuthorization() // Whether the app is closed or open we are always going to request location
        }else{
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //Where to call that to center the map on user location. Anytime the map view change authozation. Everytime we aproove we center the user.
        centerMapOnUserLocation()
    }
}



