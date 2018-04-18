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
        
        //how to make a gradient background
        
        //These are the two RGB color codes used in the gradient
        let topColor = UIColor(red: 214.0/255.0, green: 204.0/255.0, blue: 169.0/255.0, alpha: 1)
        //let botColor = UIColor(red: 160.0/255.0, green: 138.0/255.0, blue: 88.0/255.0, alpha: 1)
        let botColor = UIColor(red: 56.9/255.0, green: 50.6/255.0, blue: 31.8/255.0, alpha: 1)
        
        //this is to know where the colors begin and end within the gradient
        let gradientColor: [CGColor] = [topColor.cgColor, botColor.cgColor]
        let gradientLocation: [Float] = [0.0, 1.0]
        
        //This is actually adding the gradient layer to the view with the bounds of the two colors
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        gradientLayer.locations = gradientLocation as [NSNumber]
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var codeLBL: UILabel!
    
    @IBAction func toDBBTN(_ sender: UIButton) {
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
