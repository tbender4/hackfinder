//
//  Event.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/18/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import Foundation

class Event {
  
  var name: String
  var description: String
  var id: String
  var url: String
  var date: String          //takes in start_time as a whole
  var startTime: String? //use utc, convert from there    //TODO
  var endTime: String?   //use utc, convert from there    //TODO
  var capacity: String
  var onlineEvent: String? //optional story               //KEK
  
  var originalLogo: String
  var smallLogo: String
  
  
  init() {
    //passes through one event in dictionary form.
    name = "name"
    description = "description"
    id = "idNumber"
    url = "url"
    date = "date"
    startTime = "startTime"
    endTime = "endTime"
    capacity = "capacity"
    originalLogo = "logo"
    smallLogo = "smallLogo"
  }
  
  func debug() {
    print("DEBUG CALLED")
    print("Name:")
    print(name)
    print("")
    print("Description:")
    print(description)
    print("")
    print("ID:")
    print (id)
    print("")
    print("URL:")
    print (url)
    print("")
    print("Date: ")
    print (date)
    print("")
   // print (startTime)
  //  print (endTime)
    print("Capacity:")
    print (capacity)
    print("")
    print("Original:")
    print(originalLogo)
    print("")
    print("Small: ")
    print(smallLogo)
    print("")
    print("END DEBUG")
    print("////////////////////")
  }
  
  init(event: [String: Any]) {
    
    let name = event["name"] as! [String: Any]
    let textName = name["text"] as? String ?? "Event Name N/A"
    self.name = textName
    let description = event["description"] as! [String: Any]
    let textDescription = description["text"] as? String ?? "Description N/A"
    self.description = textDescription
    
    let id = event["id"] as? String ?? "Event ID N/A"
    self.id = id
    let url = event["url"] as? String ?? "URL N/A"
    self.url = url
    
    let start  = event["start"] as! [String: Any]
    let date = start["utc"] as? String ?? "Date N/A"
    
    self.date = date
    //startTime = "startTime"
    //endTime = "endTime"
    
    let capacity = event["capacity"] as? String ?? "Capacity N/A"
    self.capacity = capacity
    
    
      let logo = event["logo"] as? [String: Any] ?? nil
    if logo != nil {
      let originalLogoDict = logo?["original"] as! [String: Any]
      let originalLogo = originalLogoDict["url"] as! String
      let smallLogo = logo?["url"] as! String
      self.originalLogo = originalLogo
      self.smallLogo = smallLogo
    } else {
      self.originalLogo = "original_n/a"
      self.smallLogo = "small_n/a"
    }
    debug()
  }
  
  
  
  class func events(dictionaries: [[String: Any]]) -> [Event] {
    var events: [Event] = []
    for dictionary in dictionaries {
      let event = Event(event: dictionary)   //TODO: Verify
      events.append(event)
    }
    return events
  }
  
  
//  init(data: [String: Any]) {
    
//  }
  
}
