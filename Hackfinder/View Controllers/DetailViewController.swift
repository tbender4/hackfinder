//
//  DetailViewController.swift
//  Hackfinder
//
//  Created by kairi on 10/30/18.
//  Copyright © 2018 Thomas Bender. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var overView: String?
    var imageURLString: String?
    var name: String?
    var date: String?

  @IBOutlet weak var nameLbl: UILabel!
  @IBOutlet weak var dateLbl: UILabel!
  
    @IBOutlet weak var LogoImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let overView = overView{
//            overviewLabel.text = overView.description
//        }
        /* if let image = image{
         LogoImageView.image = UserEvents.logo
         }*/
      
      
      


        // Do any additional setup after loading the view.
    print(name)
      nameLbl?.text = name!
      dateLbl?.text = date!
      let url = URL(string: imageURLString!)!
      LogoImageView?.af_setImage(withURL: url)
      overviewLabel?.text = overView
    }
  

  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

  
}
