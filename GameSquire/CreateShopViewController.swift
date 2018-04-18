//
//  CreateShopViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/9/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class CreateShopViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //This should change the background color - Hunter
        self.view.backgroundColor = UIColor(red: 214/255, green: 204/255, blue: 169/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var codeLBL: UILabel!
    
    @IBAction func toDBBTN(_ sender: UIButton) {
        if AppDelegate.myModel.itemsInCreateShop.count > 0 {
            //Generate random code for shop
            let shopCode = AppDelegate.myModel.randomShopCode()
            codeLBL.text = "Shop Code: \(shopCode)"
            //Send shop to database
            let randomShop = PFObject(className:"Shops")
            randomShop["ShopItems"] = AppDelegate.myModel.createdToJSON()
            randomShop["ShopCode"] = shopCode
            randomShop["ShopOwner"] = AppDelegate.myModel.username
            randomShop.acl = PFACL(user: PFUser.current()!)
            randomShop.acl?.getPublicReadAccess = true
            randomShop.saveInBackground()
        }
    }
}
