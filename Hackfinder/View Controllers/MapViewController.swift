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
  
  
  
  @IBOutlet weak var pullUpview: UIView!
  
  
  @IBOutlet weak var pullUpViewHeight: NSLayoutConstraint!
  
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
  var selectedAnnotation: MKPointAnnotation?
  var loadedEvents: [Event] = []
  var numberOfEvents = 0
  var screenSize = UIScreen.main.bounds
  var title3 = UILabel()
  var title4 = UILabel()
  var title5 = UILabel()
  var clickForInfo = UIButton()
  var currentLocation: CLLocation!
  var farthestDistance = 0
  var i = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /*
     USAGE OF Eventbrite API:
     1) Update search with Eventbrite.updateSearch(...)
     2) run getEvents()
     */
    //   getEvents()
    
    mapView.delegate = self

    self.configureLocationServices()
    centerMapOnUserLocation()
    Eventbrite.updateSearch(sortBy: "best", locationAddress: "san+franciso", locationWithin: "50", isFree: false)
    //Eventbrite.updateSearch(sortBy: "best", locationCoordinates: currentLocation, locationWithin: "50", isFree: false)
    UserEvents.getEvents {
      if $0{
        for coor in UserEvents.events{
          //                        let lat = Double(coor.address?.latitude as! String)
          //                        let long = Double(coor.address?.longitude as! String)
          //                        let loc = CLLocation(latitude: lat!, longitude: long!)
          //                        self.loadedEvents.
          //                        let name = coor.name
          //                        let desc = coor.description
          //                        let startTime = coor.startTime
          //                        let date = coor.date
          //                        print(name)
          //                        self.coords.append(loc)
          
          self.loadedEvents.append(coor)
        }
        
        for ev in self.loadedEvents{
          let lat = Double(ev.address?.latitude as! String)
          let long = Double(ev.address?.longitude as! String)
          let loc = CLLocation(latitude: lat!, longitude: long!)
          self.coords.append(loc)
          
        }
        
        for c in self.coords{
          let distance = self.currentLocation.distance(from: c)
          if Int(distance) > self.farthestDistance {
            self.farthestDistance = Int(distance)
          }
        }
        
        self.addAnnotations(coords: self.coords)
      }
    }
    mapView.layer.cornerRadius = 20
    view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    
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
    
    for e in loadedEvents{
      let lat = Double(e.address?.latitude as! String)
      let long = Double(e.address?.longitude as! String)
      let CLLCoordType = CLLocationCoordinate2D(latitude: lat!,
                                                longitude: long!);
      let anno = MKPointAnnotation()
      var strDate = e.date.prefix(10)
      strDate = strDate.suffix(5)
      anno.title = "\(strDate.prefix(2))/\(strDate.suffix(2))"
      anno.coordinate = CLLCoordType;
      mapView.addAnnotation(anno)
      
    }
    
    
  }
  
  func pullUpView(lat: String, long: String){
    for ev in loadedEvents{
      //            if lat == ev.address?.latitude && long == ev.address?.longitude{
      //                print("\(lat), \(long)")
      //            }
      
      let latit = ev.address?.latitude as! String
      let longit = ev.address?.longitude as! String
      let latitude = Double(round(1000*Double(latit)!)/1000)
      let longitude = Double(round(1000*Double(longit)!)/1000)
      let thisLat = Double(round(1000*Double(lat)!)/1000)
      let thisLong = Double(round(1000*Double(long)!)/1000)
      //            print("\(thisLat), \(thisLong)")
      //            print("\(latitude), \(longitude)")
      //            print(" ")
      
      //            if thisLat == latitude && thisLong == longitude {
      //                print(ev.name)
      //            }
      
      
      pullUpViewHeight.constant = 300
      pullUpview.layer.cornerRadius = 20;
      pullUpview.layer.masksToBounds = true;
      UIView.animate(withDuration: 0.3) {
        self.view.layoutIfNeeded()
      }
      //pullUpview.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
      
      pullUpview.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
      
      if thisLat == latitude && thisLong == longitude {
        //                print(ev.name)
        let title = UILabel()
        title.frame = CGRect(x: (screenSize.width / 2) - 55, y: 2, width: 100, height: 40)
        title.text = "Hack"
        title.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        title.font = title.font.withSize(25)
        pullUpview.addSubview(title)
        
        let title2 = UILabel()
        title2.frame = CGRect(x: (screenSize.width / 2), y: 2, width: 100, height: 40)
        title2.text = "Finder"
        title2.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        title2.font = title2.font.withSize(25)
        pullUpview.addSubview(title2)
        removeAllFunc()
        
        var strDate = ev.date.prefix(10)
        let year = strDate.prefix(4)
        strDate = strDate.suffix(5)
        let origDate = "\(strDate.prefix(2))/\(strDate.suffix(2))/\(year)"
        var strTime = ev.date.suffix(9)
        strTime = strTime.prefix(8)
        let strTimes = formatt(time: String(strTime))
        addAllFunc(name: ev.name, date: String(origDate), time: String(strTimes))
      }
      
    }
    
    addSwipe()
  }
  
  func formatt(time: String) -> String{
    var prefix = time.prefix(2)
    var pm = false
    var x = ""
    
    if prefix.contains("12"){
      prefix = "12"
      pm = true
    }
    
    if prefix.contains("13"){
      prefix = "1"
      pm = true
    }
    if prefix.contains("14"){
      prefix = "2"
      pm = true
    }
    if prefix.contains("15"){
      prefix = "3"
      pm = true
    }
    if prefix.contains("16"){
      prefix = "4"
      pm = true
    }
    if prefix.contains("17"){
      prefix = "5"
      pm = true
    }
    if prefix.contains("18"){
      prefix = "6"
      pm = true
    }
    if prefix.contains("19"){
      prefix = "7"
      pm = true
    }
    if prefix.contains("20"){
      prefix = "8"
      pm = true
    }
    if prefix.contains("21"){
      prefix = "9"
      pm = true
    }
    if prefix.contains("22"){
      prefix = "10"
      pm = true
    }
    if prefix.contains("23"){
      prefix = "11"
      pm = true
    }
    
    if pm == false{
      x = ":00 AM"
    }else{
      x = ":00 PM"
    }
    
    var realTime = prefix + x
    
    
    return String(realTime)
  }
  
  func addAllFunc(name: String, date: String, time: String){
    title3 = UILabel()
    title3.frame = CGRect(x: 1, y: 20, width: 300, height: 120)
    title3.text = "\(name)"
    title3.numberOfLines = 0
    //title3.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    title3.font = UIFont(name: "Avenir", size: 18)
    title3.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    pullUpview.addSubview(title3)
    
    title4 = UILabel()
    title4.frame = CGRect(x: 1, y: 80, width: 300, height: 120)
    title4.text = "Date: \(date)"
    title4.font = UIFont(name: "Avenir", size: 16)
    title4.numberOfLines = 0
    //title4.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    title4.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    pullUpview.addSubview(title4)
    
    title5 = UILabel()
    title5.frame = CGRect(x: 1, y: 120, width: 300, height: 120)
    title5.text = "Time: \(time)"
    title5.font = UIFont(name: "Avenir", size: 16)
    title5.numberOfLines = 0
    //title5.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
    title5.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    pullUpview.addSubview(title5)
    
//    clickForInfo = UIButton()
//    clickForInfo.frame = CGRect(x: 90, y: 220, width: 200, height: 50)
//    clickForInfo.setTitle("Tap For More Info", for: UIControl.State.normal)
//    clickForInfo.setTitleColor(#colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1), for: .normal)
//    clickForInfo.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    clickForInfo.layer.cornerRadius = 5
//    clickForInfo.layer.borderWidth = 2
//    clickForInfo.layer.borderColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
//    pullUpview.addSubview(clickForInfo)
  }
  
  func removeAllFunc(){
    if title3 != nil {
      title3.removeFromSuperview()
    }
    
    if title4 != nil {
      title4.removeFromSuperview()
    }
    
    if title5 != nil {
      title5.removeFromSuperview()
    }
    
    if clickForInfo != nil {
      clickForInfo.removeFromSuperview()
    }
    
    
  }
  
  
  func addSwipe(){
    let swipe = UISwipeGestureRecognizer(target: self, action: #selector(animateViewDown))
    swipe.direction = .down
    pullUpview.addGestureRecognizer(swipe)
  }
  
  @objc func animateViewDown(){
    pullUpViewHeight.constant = 0
    UIView.animate(withDuration: 0.3) {
      self.view.layoutIfNeeded()
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
    //pinAnnotation.pinTintColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    pinAnnotation.pinTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let annotationLabel = UILabel(frame: CGRect(x: -30, y: -30, width: 70, height: 26))
    annotationLabel.text = annotation.title!
    annotationLabel.textAlignment = .center
    annotationLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    annotationLabel.font = UIFont(name: "Avenir", size: 22)
    annotationLabel.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    annotationLabel.layer.cornerRadius = 5
    annotationLabel.clipsToBounds = true
    pinAnnotation.addSubview(annotationLabel)
    pinAnnotation.animatesDrop = true
    
    return pinAnnotation
  }
  
  
  func centerMapOnUserLocation(){ // Center the coordinate on user location
    guard let coordinate = locationManager.location?.coordinate else {return}
    let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: Double(farthestDistance+(farthestDistance/3)) * 2.0, longitudinalMeters: Double(farthestDistance+(farthestDistance/4)) * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
    currentLocation = locationManager.location
    animateViewDown()
  }
  
  func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    let selectedAnnotatio = view.annotation as? MKPointAnnotation
    let coordinateReg = MKCoordinateRegion(center: (selectedAnnotatio?.coordinate)!, latitudinalMeters: regionRadius * 2, longitudinalMeters: regionRadius * 2)
    mapView.setRegion(coordinateReg, animated: true)
    let lat = Float((selectedAnnotatio?.coordinate.latitude)!)
    let long = Float((selectedAnnotatio?.coordinate.longitude)!)
    pullUpView(lat: String(lat), long: String(long))
  }
}

extension MapViewController: CLLocationManagerDelegate {
  func configureLocationServices(){ // are we authorized to access the location
    if authorizationStatus == .notDetermined {
      locationManager.requestAlwaysAuthorization() // Whether the app is closed or open we are always going to request location
      centerMapOnUserLocation()
    }else{
      return
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    //Where to call that to center the map on user location. Anytime the map view change authozation. Everytime we aproove we center the user.
    centerMapOnUserLocation()
  }
  
  
}


