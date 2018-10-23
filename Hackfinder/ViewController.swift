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
    
    Eventbrite().getEvents { (events: [Event]?, error: Error?) in
      if let events = events {
        self.events = events
      } else {
        print("error")
      }
    }
    
    //move this to API later
    /*
    let url = dummyAPI.workingURL
    
    let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data {
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let events = dataDictionary["events"] as! [[String: Any]]
        //print(events)
        //print (events[0])
        let event = events[0]
        let name = event["name"] as! [String: Any]
        let textName = name["text"] as! String
        print (textName)
      }
    }
    task.resume()
 
 */
  }

}

