//
//  ViewController.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/15/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit
import SwiftDate

class ListViewController: UIViewController, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  
  
  var events: [Event] = []
  let group = DispatchGroup()   //to pause
  let queue = DispatchQueue(label: "eventQueue")
  
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
  
//  func setAddress (event: Event) -> Event {
//    let venueID = event.venueID
//    Eventbrite.getVenueInfo(venueID: venueID) { (address: Address?, error: Error?) in
//     event.address = address
//      print(address?.city ?? "city error")
//    }
//    return event
//  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    /*
     USAGE OF Eventbrite API:
     1) Update search with Eventbrite.updateSearch(...)
     2) run getEvents()
     */
    Eventbrite.updateSearch(sortBy: "best", locationAddress: "new+york", locationWithin: "50", isFree: false)
    //   getEvents()
    
    group.enter()
    self.getEvents()
    
    group.notify(queue: .main) {
      self.tableView.reloadData()
    }
  }
  
  func formattedDate(date: String) -> String {
    let dateISO = date.toISODate(region: Region.ISO)!
    return dateISO.toFormat("E, MMMM dd")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
  //  let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) //need to fix
    let event = events[indexPath.row]
    let name = event.name
    
    //implement cocoapod and do this properly //Done!
    //2018-11-16T22:00:00Z
    
    
    
    var address = event.address?.addressMultiLine
    if let venueName = event.address?.name {
      address?.insert(venueName, at: 0) //puts title at the top
    }
    let addressText: String = (address?.joined(separator: "\n") ?? "")
    
    cell.nameLabel.text = name
    cell.dateLabel.text = formattedDate(date: event.date)
    cell.addressLabel.text = addressText
    return cell
  }

}

