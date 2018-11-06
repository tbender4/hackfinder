//
//  AllEvents.swift
//  Hackfinder
//
//  Created by Thomas Bender on 11/6/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import Foundation

class UserEvents {
  //We need to move everything from ListViewController to this separate class
  //so that BOTH ListViewController and MapViewController will
  //share the same data.
  var events: [Event] = []
  static var addressCount = 0
  let group = DispatchGroup()   //to pause
  let queue = DispatchQueue(label: "eventQueue")
  
  init() {
    Eventbrite.updateSearch(sortBy: "best", locationAddress: "new+york", locationWithin: "50", isFree: false)
    group.enter()
  }
  
  func getEvents () {
    
    Eventbrite.getEvents { (events: [Event]?, error: Error?) in
      if let events = events {
        self.events = events
        self.group.leave()
      } else {
        print("error")
        self.group.leave()
      }
    }
  }
  
  
  
}
