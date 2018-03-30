//
//  GeneratedShopViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/7/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class GeneratedShopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toDBBTN(_ sender: UIButton) {
        //Send shop to database
        let randomShop = PFObject(className:"Shops")
        randomShop["ShopItems"] = AppDelegate.myModel.toJSON()
        randomShop["ShopName"] = "HEIST"
        randomShop.acl = PFACL(user: PFUser.current()!)
        randomShop.saveInBackground()
    }
    
    @IBAction func clearShopBTN(_ sender: UIButton) {
        AppDelegate.myModel.clearRandomShop()
    }
}
