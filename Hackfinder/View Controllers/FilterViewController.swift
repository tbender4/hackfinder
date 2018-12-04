//
//  FilterViewController.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/29/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit
import SideMenu

class FilterViewController: UITableViewController {
  
  let distance = 0
  let best = 1
  let date = 2
  
  override func viewDidLoad() {
    super.viewDidLoad()
    SideMenuManager.default.menuFadeStatusBar = false
    SideMenuManager.default.menuPresentMode = .menuSlideIn
    SideMenuManager.default.menuPresentingViewControllerUserInteractionEnabled = false
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 4
  }
  
  func sortBy (preference: Int) {  //distance/best/date
    //change parameters
    if preference == distance {
      
    } else if preference == best {
      
    } else if preference == date {
      
    }
    //reload both views
  }
  
  func changeMaxDistance (distance: String) { //use wheel? typing? think of best way to do it
    //change parameters
    
    //reload both views
  }
  
  func freeEventsOnly (freeOnly: Bool) {    //toggle
    //If paid OR paid is selected, untoggled the second one
    //If neither are toggled, return "" to the parameter
    
    //reload both views
  }
  
  func paidEventsOnly (paidOnly: Bool) {  //toggle
    //sameasFreeOnly
    //reload both views
  }
  
  func upcomingOnly (upcomingOnly: Bool) {
    //compare date_modified.range_start to today's date
    //filter out current view
    //reload both views
  }
  
  
  
  /*
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
   
   // Configure the cell...
   
   return cell
   }
   */
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
