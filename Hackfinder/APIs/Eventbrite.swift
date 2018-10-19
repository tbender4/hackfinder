//
//  Eventbrite.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/18/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import Foundation

class Eventbrite {
  static let baseURL = "https://www.eventbriteapi.com/v3/"
  private static let userToken = Token.personalOAuthToken   //This is kept in a separate file for security purposes. The file is listed under .gitignore and thus will NOT be pushed to the public repository.

  var workingURL: String
  
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
  
  func generateURL (sortBy: String, locationAddress: String, locationWithin: String, isFree: Bool) -> String {
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
    return url
  }
  //not specifying price shows all
  func generateURL (sortBy: String, locationAddress: String, locationWithin: String) -> String {
    return generateURL(sortBy: sortBy, locationAddress: locationAddress, locationWithin: locationWithin, isFree: false)
  }
  //generic defaults for testing purposes
  func generateURL () -> String{
    return generateURL(sortBy: "best", locationAddress: "california", locationWithin: "50", isFree: false)
  }
  
  
  init() {
    print("Generating default url")
    workingURL = ""
    self.workingURL = generateURL(sortBy: "best", locationAddress: "new+york", locationWithin: "50", isFree: false)
    self.workingURL = generateURL()
    print(workingURL)
  }
  
  //https://www.eventbriteapi.com/v3/events/search/?q=hackathon&sort_by=best&location.address=new+york&location.within=50mi&price=free&token=YOUR_TOKEN
  
}
