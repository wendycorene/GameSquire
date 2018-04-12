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
        
        //This should change the background color - Hunter
        self.view.backgroundColor = UIColor(red: 214/255, green: 204/255, blue: 169/255, alpha: 1)
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
                }
            } else {
                // Log details of the failure
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
