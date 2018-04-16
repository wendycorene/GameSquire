//
//  AllShopsByUsernameTableViewController.swift
//  GameSquire
//
//  Created by Eloe,Wendy C on 4/16/18.
//  Copyright © 2018 Eloe,Wendy C. All rights reserved.
//

import UIKit
import Parse

class AllShopsByUsernameTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AppDelegate.myModel.userShops.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shopName", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = AppDelegate.myModel?.userShops[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let shopCode = AppDelegate.myModel.userShops[indexPath.row]
        var fromB4A = ""
        AppDelegate.myModel.items = []
        
        let decoder = JSONDecoder()
        let query = PFQuery(className: "Shops")
        query.whereKey("ShopCode", equalTo: shopCode as Any)
        query.findObjectsInBackground {
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
        
        let alert = UIAlertController(title: "Load Shop", message: "Load Shop: \(shopCode)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Load", style: .default, handler: { action in
            self.performSegue(withIdentifier: "loadingUserShop", sender: self)
            NotificationCenter.default.post(name: Notification.Name("UPDATED_DATA"), object: nil)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
