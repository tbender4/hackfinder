//
//  EventTableViewCell.swift
//  Hackfinder
//
//  Created by Thomas Bender on 10/29/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
  @IBOutlet weak var nameLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
