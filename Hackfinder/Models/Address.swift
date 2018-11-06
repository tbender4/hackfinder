//
//  Address.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/23/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import Foundation

class Address {
  
  /*
   "address_1": "16007 Crenshaw Blvd",
   "address_2": null,
   "city": "Torrance",
   "region": "CA",
   "postal_code": "90506",
   "country": "US",
   "latitude": "33.8846365",
   "longitude": "-118.3304771",
   "localized_address_display": "16007 Crenshaw Blvd, Torrance, CA 90506",
   "localized_area_display": "Torrance, CA",
   "localized_multi_line_address_display": [
   "16007 Crenshaw Blvd",
   "Torrance, CA 90506"
   ]
 */
  
  static let token = Token.personalOAuthToken
  
//  let venueID: String?
  
  var name: String?
  
  var addressOne: String?
  var addressTwo: String?
  var city: String?
  var region: String?
  var postalCode: String?
  var country: String?       //useful for optional story
  var latitude: String?    //use in map view
  var longitude: String?   //use in map view
  var addressMultiLine: [String]?   //use localized_multi_line_address_display
  
  func debug () {

    print(city)
    print(region)
    print(postalCode)
  }
  init(venue: [String: Any]) {
    let name = venue["name"] as? String
    let addressDictionary = venue["address"] as? [String: Any]
    let addressOne = addressDictionary?["address_1"] as? String
    let addressTwo = addressDictionary?["address_2"] as? String
    let city = addressDictionary?["city"] as? String
    let region = addressDictionary?["region"] as? String
    let postalCode = addressDictionary?["postal_code"] as? String
    let country = addressDictionary?["country"] as? String
    let latitude = addressDictionary?["latitude"] as? String
    let longitude = addressDictionary?["longitude"] as? String
    let addressMultiLine = addressDictionary?["localized_multi_line_address_display"] as? [String]
    
    self.name = name
    self.addressOne = addressOne
    self.addressTwo = addressTwo
    self.city = city
    self.region = region
    self.postalCode = postalCode
    self.country = country
    self.latitude = latitude
    self.longitude = longitude
    self.addressMultiLine = addressMultiLine
    
    //debug()
  }
  
//  func getVenueInfo () {
//    let url = generateURL()
//    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//    let task = session.dataTask(with: request) { (data, response, error) in
//      if let error = error {
//        print(error.localizedDescription)
//      } else if let data = data {
//        //do code
//        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//        let name = dataDictionary["name"] as? String
//        let addressDictionary = dataDictionary["address"] as? [String: Any]
//        let addressOne = addressDictionary?["address_1"] as? String
//        let addressTwo = addressDictionary?["address_2"] as? String
//        let city = addressDictionary?["city"] as? String
//        let region = addressDictionary?["region"] as? String
//        let postalCode = addressDictionary?["postal_code"] as? String
//        let country = addressDictionary?["country"] as? String
//        let latitude = addressDictionary?["latitude"] as? String
//        let longitude = addressDictionary?["longitude"] as? String
//        let addressMultiLine = addressDictionary?["localized_multi_line_address_display"] as? [String]
//
//        self.name = name
//        self.addressOne = addressOne
//        self.addressTwo = addressTwo
//        self.city = city
//        self.region = region
//        self.postalCode = postalCode
//        self.country = country
//        self.latitude = latitude
//        self.longitude = longitude
//        self.addressMultiLine = addressMultiLine
//
//      }
//    }
//    task.resume()
//  }
//
//  func generateURL() -> URL {
//    //https://www.eventbriteapi.com/v3/venues/27321840/?token=KB5QEQ6C22MFGF7HJKIS
//    let urlString = "https://www.eventbriteapi.com/v3/venues/" + venueID + Address.token
//    return URL(string: urlString)!
//  }
  
//  class func parseDictionary(dictionaries: [String: Any]) -> Address {
//    let address = Address(venue: dictionaries)   //TODO: Verify
//    return address
//  }
  
  
}
