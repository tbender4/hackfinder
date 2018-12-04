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
  static var events: [Event] = []
  static var addressCount = 0
  static let group = DispatchGroup()   //to pause
  static let queue = DispatchQueue(label: "eventQueue")
  
  static func getEvents (completion: @escaping (Bool) -> Void) {
    UserEvents.group.enter()
    Eventbrite.getEvents { (events: [Event]?, error: Error?) in
      if let events = events {
        self.events = events
        self.group.leave()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          completion(true)
        }
      } else {
        print("error")
        self.group.leave()
      }
    }
  }
  
  static func safeToReload() -> Bool {
    if UserEvents.addressCount == UserEvents.events.count {
      return true
    }
    return false
  }
  
  
  
}
