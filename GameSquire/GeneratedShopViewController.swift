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
        
        NotificationCenter.default.addObserver(self, selector: #selector(updated_data), name:Notification.Name("UPDATED_DATA"), object: nil)

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
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updated_data(notification:Notification) -> Void{
        itemDescTV.text = AppDelegate.myModel.itemDesc
    }
    
    @IBOutlet weak var itemDesc: UITextView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var itemDescTV: UITextView!
    
    @IBAction func toDBBTN(_ sender: UIButton) {
        
        //Generate random code for shop
        let shopCode = AppDelegate.myModel.randomShopCode()
        //Send shop to database
        let randomShop = PFObject(className:"Shops")
        randomShop["ShopItems"] = AppDelegate.myModel.toJSON()
        randomShop["ShopCode"] = shopCode
        randomShop["ShopOwner"] = AppDelegate.myModel.username
        randomShop.acl = PFACL(user: PFUser.current()!)
        randomShop.acl?.getPublicReadAccess = true
        randomShop.saveInBackground()
        let alert = UIAlertController(title: "Saving Shop", message: "This shop's code is: \(shopCode)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.performSegue(withIdentifier: "unwinder", sender: self)
        }))
        self.present(alert, animated: true)
    }

    func unwindFromAlert(segue:UIStoryboardSegue) {
    
    }
    
    @IBAction func generateNewShopBTN(_ sender: UIButton) {
        
        AppDelegate.myModel.items = []
        AppDelegate.myModel.randomizeShop()
        let alert = UIAlertController(title: "Generate New Shop", message: "Do you want to generate a different shop?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            NotificationCenter.default.post(name: Notification.Name("UPDATED_DATA"), object: nil)
            self.itemDescTV.text = "Item Description"
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func clearShopBTN(_ sender: UIButton) {
        AppDelegate.myModel.clearRandomShop()
    }
}
