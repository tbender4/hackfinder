//
//  ViewController.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/15/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var events: [Event] = []    //once one event can be parsed, do the rest
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    func getEvents () {
      Eventbrite.getEvents { (events: [Event]?, error: Error?) in
        if let events = events {
          self.events = events
        } else {
          print("error")
        }
      }
    }
    /*
     USAGE OF Eventbrite API:
     1) Update search with Eventbrite.updateSearch(...)
     2) run getEvents()
    */
    
    Eventbrite.updateSearch(sortBy: "best", locationAddress: "new+york", locationWithin: "50", isFree: false)
    
  }

}

