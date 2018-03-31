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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var shopNameTF: UITextField!
    
    @IBAction func loadShopBTN(_ sender: UIButton) {
        var shopName = shopNameTF.text
        var fromB4A: [Any] = []
        
        let decoder = JSONDecoder()
        let query = PFQuery(className: "Shops")
        query.whereKey("ShopName", equalTo: shopName as Any)
        query.findObjectsInBackground { // what happened to the ( ) ?
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                for object in objects! {
                    fromB4A.append(object)
                    print(fromB4A)
                    print("AHHHHHHHHHHHHHHHHHHH")
                }
                print(fromB4A[0])
            } else {
                // Log details of the failure
                print("ERROR")
            }
        }
        print(fromB4A)
        /*do {
            let A = try decoder.decode(ShopItem, from: fromB4A)
            //print(otherObj)
        } catch {
            print("You fucked up.")
        }*/
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
