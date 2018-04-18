//
//  PlayerMainScreenViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 3/30/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class PlayerMainScreenViewController: UIViewController {

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
    
    @IBOutlet weak var shopNameTF: UITextField!
    
    let group = DispatchGroup()
    
    @IBAction func loadShopBTN(_ sender: UIButton) {
        var shopCode = shopNameTF.text
        var fromB4A = ""
        AppDelegate.myModel.clearRandomShop()
        
        let decoder = JSONDecoder()
        let query = PFQuery(className: "Shops")
        query.whereKey("ShopCode", equalTo: shopCode as Any)
        query.findObjectsInBackground { // what happened to the ( ) ?
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                for object in objects! {
                    fromB4A += (object.object(forKey: "ShopItems")! as! String)
                    let alert = UIAlertController(title: "Shop Search", message: "Shop Found!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Enter Shop", style: .default, handler: { action in
                        self.performSegue(withIdentifier: "loadShop", sender: self)
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            } else {
                // Log details of the failure
                let alert = UIAlertController(title: "Shop Search", message: "Shop Not Found!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("ERROR")
            }
            do {
                let A = try decoder.decode([ShopItem].self, from: fromB4A.data(using: .utf8)!)
                for item in A {
                    AppDelegate.myModel.items.append(item)
                }
                print(AppDelegate.myModel.items.count)
            } catch {
                print("Error info: \(error)")
                let alert = UIAlertController(title: "Loading Shop", message: "Shop Not Found!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
