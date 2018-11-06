//
//  Eventbrite.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/18/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

/*
 USAGE OF Eventbrite API:
 1) Update search with Eventbrite.updateSearch(...)
 2) run getEvents()
 */


import Foundation
import Alamofire

class Eventbrite {
  static let baseURL = "https://www.eventbriteapi.com/v3/"
  private static let userToken = Token.personalOAuthToken   //This is kept in a separate file for security purposes. The file is listed under .gitignore and thus will NOT be pushed to the public repository.

  static var workingURL: URL = URL(string: "nil")!      //if it remains as nil, getEvents will default to LA
  var session: URLSession
  //The following is used to build the json URL. It does NOT hold user's parameters.
  static let search = "events/search/"
  static let query = "?q=hackathon"
  static let sortBy = "&sort_by="
  static let locationAddress = "&location.address="
  static let locationWithin = "&location.within="
  static let unit = "mi"  //TODO: allow changing of unit for international users
  static let price = "&price="
  static let token = "&token="
  //end URL objects
  
  
  static func generateURL (sortBy: String, locationAddress: String, locationWithin: String, isFree: Bool) -> URL {
    var price = ""
    if isFree == true {
      price = "free"
    }
    let url = Eventbrite.baseURL + Eventbrite.search + Eventbrite.query
      + Eventbrite.sortBy + sortBy
      + Eventbrite.locationAddress + locationAddress
      + Eventbrite.locationWithin + locationWithin + Eventbrite.unit
      + Eventbrite.price + price
      + Eventbrite.token + Eventbrite.userToken
    print(url)
    return URL(string: url)!
  }
  
  //generic defaults for testing purposes
  static func generateURL () -> URL{
    return generateURL(sortBy: "best", locationAddress: "los+angeles", locationWithin: "50", isFree: false)
  }
  
  //default
  static func getEvents(completion: @escaping ([Event]?, Error?) -> ()) {
    //self.workingURL = generateURL()
    if self.workingURL.absoluteString == "nil" {    //
      workingURL = Eventbrite.generateURL()
    }
    let request = URLRequest(url: self.workingURL, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
         let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        //print(dataDictionary)
        let eventDictionaries = dataDictionary["events"] as! [[String: Any]]
        let events = Event.events(dictionaries: eventDictionaries)
        completion(events, nil)
      } else {
        completion(nil, error)
      }
    }
    task.resume()
  }
  
  static func getVenueInfo(venueID: String, completion: @escaping (Address?, Error?) -> ()) {
    print(venueID)
    let url = generateVenueURL(venueID: venueID)
    print(url)
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
        //do code
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let address = Address(venue: dataDictionary)
        completion(address, nil)
      } else {
        completion(nil, error)
      }
    }
    task.resume()
  }
  static func generateVenueURL(venueID: String) -> URL {
    //https://www.eventbriteapi.com/v3/venues/27321840/?token=KB5QEQ6C22MFGF7HJKIS
    let urlString = "https://www.eventbriteapi.com/v3/venues/" + venueID + "?token=" + Token.personalOAuthToken
    return URL(string: urlString)!
  }
  
  
  static func updateSearch(sortBy: String, locationAddress: String, locationWithin: String, isFree: Bool) {
    self.workingURL = generateURL(sortBy: sortBy, locationAddress: locationAddress, locationWithin: locationWithin, isFree: isFree)
  }
  
  
  
  init() {
    print("Generating default url")
    session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
  }
  
  //https://www.eventbriteapi.com/v3/events/search/?q=hackathon&sort_by=best&location.address=new+york&location.within=50mi&price=free&token=YOUR_TOKEN
  
}
