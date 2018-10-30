//
//  ViewController.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/15/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {
  @IBOutlet weak var tableView: UITableView!
  
  
  var events: [Event] = []    //once one event can be parsed, do the rest
  
  func getEvents () {
    Eventbrite.getEvents { (events: [Event]?, error: Error?) in
      if let events = events {
        self.events = events
      } else {
        print("error")
      }
    }
    tableView.reloadData()
  }
  
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
    
      self.getEvents()
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
      self.tableView.reloadData()
      // Your code with delay
    }
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
  //  let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) //need to fix
    let event = events[indexPath.row]
    let name = event.name
    let date = event.date
    let address = event.address?.addressMultiLine
    //let addressText: String = (address?.joined(separator: "\n"))!
    cell.nameLabel.text = name
    cell.dateLabel.text = date
    //cell.addressLabel.text = addressText
    return cell
  }

}

