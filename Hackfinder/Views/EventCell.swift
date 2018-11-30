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
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var innerVIew: UIView!
    
    
    
    @IBOutlet weak var view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func customize(){
        innerVIew.layer.cornerRadius = 20
    }
    

}
