//
//  ViewController.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/15/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit
import SwiftDate
import AlamofireImage

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  @IBOutlet weak var tableView: UITableView!
  
//  let userEvents = UserEvents()
//  let readyToReload = false
//  var events: [Event] = []
//  static var addressCount = 0
//  let group = DispatchGroup()   //to pause
//  let queue = DispatchQueue(label: "eventQueue")
  
  func refresh () {
    UserEvents.getEvents {
      if $0 {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    /*
     USAGE OF Eventbrite API:
     1) Update search with Eventbrite.updateSearch(...)
     2) run getEvents()
     */
    //Eventbrite.updateSearch(sortBy: "best", locationAddress: "new+york", locationWithin: "50", isFree: false)
//
//    group.enter()
//    UserEvents.getEvents()
    Eventbrite.updateSearch(sortBy: "best", locationAddress: "new+york", locationWithin: "50", isFree: false)
    refresh()
  }
    
//    UserEvents.group.notify(queue: .main) {
//      DispatchQueue.global().async {
//        while true {
//          if UserEvents.safeToReload() {
//
//            break
//          }
//        }
//      }
//    }
//  }
    

  
  func formattedDate(date: String) -> String {
    let dateISO = date.toISODate(region: Region.ISO)!
    return dateISO.toFormat("E, MMMM dd")
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return UserEvents.events.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
    let event = UserEvents.events[indexPath.row]
    let name = event.name
    
    var address = event.address?.addressMultiLine
    if let venueName = event.address?.name {
      address?.insert(venueName, at: 0) //puts title at the top
    }
    let addressText: String = (address?.joined(separator: "\n") ?? "")
    
    let posterString: String = event.smallLogo
    //posterString.
    
    cell.nameLabel.text = name
    cell.dateLabel.text = formattedDate(date: event.date)
    cell.addressLabel.text = addressText
    
    return cell
    
    //TODO: Move to separate function in EventCell?
    /*
    override func prepareForSegue(segue: UIStoryboard!, sender: AnyObject?){
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            if let indexPath = tableView.indexPathForSelectedRow{
                if segue.identifier == "detailVc"{
                    let detailVc = segue.destination as! DetailViewController
                    detailVc.overView = UserEvents.events.description
                }
            }
        }}*/

    
    
  }
    
}

