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

    @IBOutlet weak var shopCodeLBL: UILabel!
    
    @IBAction func toDBBTN(_ sender: UIButton) {
        //Generate random code for shop
        let shopCode = AppDelegate.myModel.randomShopCode()
        shopCodeLBL.text = "Shop Code: \(shopCode)"
        //Send shop to database
        let randomShop = PFObject(className:"Shops")
        randomShop["ShopItems"] = AppDelegate.myModel.toJSON()
        randomShop["ShopCode"] = shopCode
        randomShop.acl = PFACL(user: PFUser.current()!)
        randomShop.saveInBackground()
    }
    
    @IBAction func clearShopBTN(_ sender: UIButton) {
        AppDelegate.myModel.clearRandomShop()
    }
}
